"""Read-only live dump of HD2's manually mapped runtime.dll through LLtM.

Steps (each LLtM batch is short so the chat relay can interleave):
  1. find the runtime.dll base host-side from /proc/<pid>/maps (runtime_maps_snapshot.find_runtime);
  2. one batch: read the PE header + walk VirtualQuery regions; abort unless MZ/PE, timestamp and
     SizeOfImage match bin/runtime.dll on disk;
  3. N batches: the game reads its own memory page by page (ReadProcessMemory via LLtM `read`) and
     appends the bytes to <LLM folder>/<name>.bin; unreadable pages are zero-filled and listed in
     <name>.bin.pages.txt (same format as the game.dll dumps);
  4. both files are moved into GooseGadgets and a record is appended to runtime-live-dump.json.
No game memory is written and no game function is called.
Usage: python3 -I dump_runtime_live.py [--parts N] [--base 0xHEX] [--dry-run]
"""
import hashlib, json, os, re, shutil, struct, sys, time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import llm_host  # noqa: E402
from llm_host import llm  # noqa: E402
import runtime_maps_snapshot as snap  # noqa: E402

OUT = "/home/goose/Documents/ChatGPT/GooseGadgets"
RUNTIME = os.path.join(snap.HD2, "bin/runtime.dll")


def part_lua(name, base, start, stop, first):
    mode = "wb" if first else "ab"
    return ("eval local base=%d local off=%d local stop=%d local start=off "
            "local path=os.getenv('LOCALAPPDATA')..'\\\\LinksLinkToMemory\\\\%s.bin' "
            "local f=assert(io.open(path,'%s')) local rep=assert(io.open(path..'.pages.txt','%s')) "
            "local bad=0 local zero=string.rep(string.char(0),4096) "
            "return function(deadline) while os.clock()<deadline do if off>=stop then f:close() rep:close() "
            "out(fmt('part 0x%%x-0x%%x done, %%d bytes zero-filled',start,stop,bad)) return true end "
            "local s=read(base+off,4096) if not s then local r=region(base+off) "
            "rep:write(fmt('unreadable_rva=0x%%x size=4096 state=%%x protection=%%x\\n',off,r and r.state or 0,r and r.protection or 0)) "
            "s=zero bad=bad+4096 end f:write(s) off=off+4096 end end, "
            "function() pcall(f.close,f) pcall(rep.close,rep) end") % (base, start, stop, name, mode, mode)


def main():
    args = sys.argv[1:]
    parts = int(args[args.index("--parts") + 1]) if "--parts" in args else 4
    size, secs, _, stamp = snap.pe_layout(RUNTIME)
    if "--base" in args:
        base = int(args[args.index("--base") + 1], 16)
    else:
        pid = snap.game_pid()
        if not pid:
            sys.exit("game not running")
        base, _ = snap.find_runtime(snap.read_maps(pid), size, secs)
        if base is None:
            sys.exit("runtime.dll layout not found in /proc/%d/maps" % pid)
    name = "runtime-live-%s" % time.strftime("%Y%m%dT%H%M")
    bounds = [0] + [((size * i // parts) + 0xfff) & ~0xfff for i in range(1, parts)] + [size]
    batches = [part_lua(name, base, bounds[i], bounds[i + 1], i == 0) for i in range(parts)]
    if "--dry-run" in args:
        print("base 0x%X size 0x%X parts %s" % (base, size, [hex(b) for b in bounds]))
        print(batches[0])
        return
    # 2. verify the header and record the region map
    text = llm.run(["read 0x%X 512" % base, llm_host.regions_lua(base, size)], timeout=30)
    hdr = llm.hexdumps(text).get(base, b"")
    pe_off = struct.unpack_from("<I", hdr, 0x3C)[0] if len(hdr) >= 0x40 else 0
    ok = (hdr[:2] == b"MZ" and hdr[pe_off:pe_off + 4] == b"PE\0\0"
          and struct.unpack_from("<I", hdr, pe_off + 8)[0] == stamp
          and struct.unpack_from("<I", hdr, pe_off + 0x50)[0] == size)
    regions = re.findall(r"R ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+)", text)
    open(os.path.join(OUT, name + ".regions.txt"), "w").write(
        "base=0x%X size=0x%X\n" % (base, size) + "".join(
            "rva=0x%X size=0x%X alloc=0x%s state=0x%s protect=0x%s type=0x%s\n" % (int(b, 16) - base, int(s, 16), a, st, pr, ty)
            for b, s, a, st, pr, ty in regions))
    if not ok:
        sys.exit("header at 0x%X does not match bin/runtime.dll; not dumping\n%s" % (base, text[-800:]))
    # 3. dump in parts
    t0 = time.time()
    for lua in batches:
        res = llm.run([lua], timeout=60)
        print(res.strip().splitlines()[-2] if res.strip() else "(no output)")
    # 4. collect
    src = os.path.join(llm.FOLDER, name + ".bin")
    dst = os.path.join(OUT, name + ".bin")
    shutil.move(src, dst)
    shutil.move(src + ".pages.txt", dst + ".pages.txt")
    data = open(dst, "rb").read()
    unreadable = open(dst + ".pages.txt").read()
    bad = unreadable.count("unreadable_rva=") * 4096
    open(dst + ".pages.txt", "w").write("base=0x%x size=%d stamp=%08x\n%scomplete_bytes=%d zero_filled_bytes=%d\n"
                                        % (base, size, stamp, unreadable, len(data), bad))
    info = {"file": dst, "sha256": hashlib.sha256(data).hexdigest(), "bytes": len(data), "zero_filled_bytes": bad,
            "unreadable_pages": bad // 4096, "base": "0x%X" % base, "image_size": "0x%X" % size,
            "capture": "LLtM eval inside helldivers2.exe: ReadProcessMemory on own process, 4 KiB pages, mapped-image layout",
            "byte_complete": len(data) == size and bad == 0, "page_report": dst + ".pages.txt",
            "regions": os.path.join(OUT, name + ".regions.txt"), "seconds": round(time.time() - t0, 1)}
    print(json.dumps(info, indent=2))
    log = os.path.join(OUT, "runtime-live-dump.json")
    prev = json.load(open(log)) if os.path.exists(log) else []
    prev.append(info)
    json.dump(prev, open(log, "w"), indent=2)


if __name__ == "__main__":
    main()
