"""Compare live runtime.dll dumps with bin/runtime.dll on disk (offline; no game access).

The disk file is laid out as a mapped image (headers + each section's raw data at its RVA, zero
tail), relocated to the live base with its own .reloc table and with OptionalHeader.ImageBase set to
the live base, which is what the Wine-path manual mapper in preloader.dll does. Each 4 KiB page of a
dump is then classed as: unreadable (listed in .pages.txt), identical to the relocated file, or
different. Different pages get entropy before/after, changed-byte counts and new printable strings.
With two dumps, pages that changed between them and pages that became readable are listed too.

Usage: python3 -I compare_runtime.py DUMP.bin [OLDER_DUMP.bin] [--out runtime-dump-comparison.json]
       python3 -I compare_runtime.py --self-test
"""
import collections, json, math, os, re, struct, sys

import pefile

RUNTIME = "/mnt/WORMHOLE/SteamLibrary/steamapps/common/Helldivers 2/bin/runtime.dll"
OUT = "/home/goose/Documents/ChatGPT/GooseGadgets"
PAGE = 4096


def entropy(b):
    if not b:
        return 0.0
    c = collections.Counter(b)
    return -sum(v / len(b) * math.log2(v / len(b)) for v in c.values())


def expected_image(base, path=RUNTIME):
    pe = pefile.PE(path)
    data = open(path, "rb").read()
    oh = pe.OPTIONAL_HEADER
    img = bytearray(oh.SizeOfImage)
    img[:oh.SizeOfHeaders] = data[:oh.SizeOfHeaders]
    for s in pe.sections:
        n = min(s.SizeOfRawData, max(s.Misc_VirtualSize, 0) or s.SizeOfRawData)
        img[s.VirtualAddress:s.VirtualAddress + n] = data[s.PointerToRawData:s.PointerToRawData + n]
    delta = base - oh.ImageBase
    reloc_targets = set()
    for blk in getattr(pe, "DIRECTORY_ENTRY_BASERELOC", []):
        for e in blk.entries:
            if e.type == 10:  # DIR64
                v = struct.unpack_from("<Q", img, e.rva)[0]
                struct.pack_into("<Q", img, e.rva, (v + delta) & 0xFFFFFFFFFFFFFFFF)
                reloc_targets.update(range(e.rva, e.rva + 8))
            elif e.type != 0:
                raise ValueError("unhandled relocation type %d" % e.type)
    ib = pe.DOS_HEADER.e_lfanew + 4 + 20 + 24
    struct.pack_into("<Q", img, ib, base)
    secs = [(s.Name.rstrip(b"\0").decode(), s.VirtualAddress, s.VirtualAddress + ((max(s.Misc_VirtualSize, s.SizeOfRawData) + 0xfff) & ~0xfff))
            for s in pe.sections]
    return bytes(img), secs, reloc_targets


def section_of(secs, rva):
    return next((n for n, a, z in secs if a <= rva < z), "headers" if rva < 0x1000 else "gap")


def unreadable_pages(dump_path):
    p = dump_path + ".pages.txt"
    if not os.path.exists(p):
        return set(), None
    text = open(p).read()
    m = re.search(r"base=0x([0-9a-fA-F]+)", text)
    return {int(x, 16) for x in re.findall(r"unreadable_rva=0x([0-9a-fA-F]+)", text)}, (int(m.group(1), 16) if m else None)


def new_strings(old, new):
    olds = set(re.findall(rb"[\x20-\x7e]{6,}", old)) | set(x.decode("utf-16-le", "ignore").encode() for x in re.findall(rb"(?:[\x20-\x7e]\x00){6,}", old))
    out = [x.decode() for x in re.findall(rb"[\x20-\x7e]{6,}", new) if x not in olds]
    out += [x.decode("utf-16-le") for x in re.findall(rb"(?:[\x20-\x7e]\x00){6,}", new)
            if x.decode("utf-16-le", "ignore").encode() not in olds]
    return out


def compare(dump_path, older=None):
    dump = open(dump_path, "rb").read()
    bad, base = unreadable_pages(dump_path)
    if base is None:
        sys.exit("no base in %s.pages.txt" % dump_path)
    img, secs, _ = expected_image(base)
    if len(dump) != len(img):
        sys.exit("dump is %d bytes, image is %d" % (len(dump), len(img)))
    per_sec = collections.defaultdict(lambda: collections.Counter())
    diff_pages = []
    for rva in range(0, len(img), PAGE):
        sec = section_of(secs, rva)
        if rva in bad:
            per_sec[sec]["unreadable"] += 1
            continue
        a, b = img[rva:rva + PAGE], dump[rva:rva + PAGE]
        if a == b:
            per_sec[sec]["identical_to_relocated_file"] += 1
            continue
        per_sec[sec]["different"] += 1
        changed = sum(1 for x, y in zip(a, b) if x != y)
        diff_pages.append({"rva": "0x%X" % rva, "section": sec, "changed_bytes": changed,
                           "file_entropy": round(entropy(a), 3), "live_entropy": round(entropy(b), 3),
                           "live_zero_bytes": b.count(0), "new_strings": new_strings(a, b)[:40]})
    result = {"dump": dump_path, "disk": RUNTIME, "base": "0x%X" % base, "pages": len(img) // PAGE,
              "unreadable_pages": len(bad), "by_section": {k: dict(v) for k, v in per_sec.items()},
              "different_pages": diff_pages}
    if older:
        old = open(older, "rb").read()
        old_bad, old_base = unreadable_pages(older)
        changed, gained, lost = [], [], []
        for rva in range(0, min(len(old), len(dump)), PAGE):
            if rva in old_bad and rva not in bad:
                gained.append("0x%X" % rva)
            elif rva in bad and rva not in old_bad:
                lost.append("0x%X" % rva)
            elif rva not in bad and old[rva:rva + PAGE] != dump[rva:rva + PAGE]:
                changed.append({"rva": "0x%X" % rva, "section": section_of(secs, rva),
                                "changed_bytes": sum(1 for x, y in zip(old[rva:rva + PAGE], dump[rva:rva + PAGE]) if x != y)})
        result["versus_older_dump"] = {"older": older, "older_base": old_base and "0x%X" % old_base,
                                       "newly_readable": gained, "newly_unreadable": lost, "changed_pages": changed}
    return result


def self_test():
    import tempfile
    base = 0x700000000000
    img, secs, relocs = expected_image(base)
    with tempfile.TemporaryDirectory() as d:
        p = os.path.join(d, "t.bin")
        live = bytearray(img)
        live[0x603000:0x603010] = b"\x11" * 16  # simulate a runtime write in packer2
        open(p, "wb").write(live)
        open(p + ".pages.txt", "w").write("base=0x%x size=%d stamp=fde6c135\nunreadable_rva=0x617000 size=4096\n" % (base, len(img)))
        r = compare(p)
    assert r["unreadable_pages"] == 1
    assert [x["rva"] for x in r["different_pages"]] == ["0x603000"], r["different_pages"][:3]
    print("self-test ok: %d relocation bytes applied, sections %s" % (len(relocs), [s[0] for s in secs]))


def main():
    args = [a for a in sys.argv[1:]]
    if "--self-test" in args:
        return self_test()
    out = os.path.join(OUT, "runtime-dump-comparison.json")
    if "--out" in args:
        out = args[args.index("--out") + 1]
        del args[args.index("--out"):args.index("--out") + 2]
    r = compare(args[0], args[1] if len(args) > 1 else None)
    json.dump(r, open(out, "w"), indent=1)
    print(out)
    print(json.dumps(r["by_section"], indent=1))


if __name__ == "__main__":
    main()
