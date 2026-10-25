"""Host-side, read-only snapshot of how HD2's protection runtime is laid out in a running game.

Reads only /proc/<pid>/maps (no game memory, no LLtM batch). Finds:
  * runtime.dll: an anonymous (MEM_PRIVATE) image whose mapping boundaries match the section layout
    of bin/runtime.dll on disk (the preloader manual-maps it under Wine, so it has no file path);
  * the protected modules (helldivers2.exe, game.dll, plugins importing preloader.dll #1): each is a
    shared memfd ("wine-mapping") section with two views, a full read-write alias and the execution
    view where not-yet-decrypted pages are PROT_NONE (Windows PAGE_NOACCESS);
  * private read-write buffers whose size equals a protected module's .pdata size.
Writes GooseGadgets/runtime-maps-<YYYYMMDDTHHMM>.json.
Usage: python3 -I runtime_maps_snapshot.py [pid | saved-maps-file] [--no-save]
"""
import collections, glob, json, os, subprocess, sys, time

import pefile

HD2 = "/mnt/WORMHOLE/SteamLibrary/steamapps/common/Helldivers 2"
OUT = "/home/goose/Documents/ChatGPT/GooseGadgets"


def game_pid():
    out = subprocess.run(["pgrep", "-f", "helldivers2.exe --bundle-dir"], capture_output=True, text=True).stdout.split()
    return int(out[0]) if out else None


def read_maps(pid):
    rows = []
    src = pid if isinstance(pid, str) else "/proc/%d/maps" % pid
    for line in open(src):
        p = line.split(None, 5)
        s, e = (int(x, 16) for x in p[0].split("-"))
        rows.append({"start": s, "end": e, "perm": p[1], "offset": int(p[2], 16), "inode": p[4],
                     "path": p[5].strip() if len(p) > 5 else ""})
    return rows


def pe_layout(path):
    pe = pefile.PE(path, fast_load=True)
    secs = [(s.Name.rstrip(b"\0").decode(), s.VirtualAddress, s.Misc_VirtualSize, s.Characteristics) for s in pe.sections]
    # protected images have no exception directory on disk; use the .pdata section size instead
    pdata = next((vs for n, _, vs, _ in secs if n == ".pdata"), pe.OPTIONAL_HEADER.DATA_DIRECTORY[3].Size)
    return pe.OPTIONAL_HEADER.SizeOfImage, secs, pdata, pe.FILE_HEADER.TimeDateStamp


def find_runtime(rows, size, secs):
    starts = {r["start"]: i for i, r in enumerate(rows)}
    want = {va for _, va, _, _ in secs}
    for i, r in enumerate(rows):
        if r["path"] or r["start"] % 0x10000:
            continue
        end = r["start"] + size
        sub, j = [], i
        while j < len(rows) and rows[j]["start"] < end:
            if sub and rows[j]["start"] != sub[-1]["end"]:
                break
            sub.append(rows[j])
            j += 1
        if not sub or sub[-1]["end"] != end or any(x["path"] for x in sub):
            continue
        boundaries = {x["start"] - r["start"] for x in sub}
        # every mapping boundary must be a section start or a page inside a section (protection change)
        if len(want & boundaries) >= len(want) - 3 and any("x" in x["perm"] for x in sub):
            return r["start"], [{"rva": "0x%X" % (x["start"] - r["start"]), "size": "0x%X" % (x["end"] - x["start"]),
                                 "perm": x["perm"]} for x in sub]
    return None, None


def main():
    arg = sys.argv[1] if len(sys.argv) > 1 else None
    pid = arg if arg and os.path.isfile(arg) else (int(arg) if arg else game_pid())  # a saved maps file also works
    if not pid:
        sys.exit("game not running")
    rows = read_maps(pid)
    snap = {"pid": pid, "time": time.strftime("%Y-%m-%dT%H:%M:%S"),
            "source": pid if isinstance(pid, str) else "/proc/%d/maps (read-only)" % pid}
    size, secs, _, stamp = pe_layout(os.path.join(HD2, "bin/runtime.dll"))
    base, maps = find_runtime(rows, size, secs)
    snap["runtime.dll"] = {"base": base and "0x%X" % base, "size_of_image": "0x%X" % size, "timestamp": "0x%08X" % stamp,
                           "file_backed": any("runtime.dll" in r["path"] for r in rows), "mappings": maps,
                           "section_layout": [{"name": n, "rva": "0x%X" % va, "vsize": "0x%X" % vs, "chars": "0x%08X" % ch}
                                              for n, va, vs, ch in secs]}
    # protected modules: images importing preloader.dll
    mods = {}
    for p in [os.path.join(HD2, "bin/helldivers2.exe"), os.path.join(HD2, "data/game/game.dll")] + glob.glob(os.path.join(HD2, "bin/plugins/*.dll")):
        soi, msecs, pdsize, mstamp = pe_layout(p)
        mods[os.path.basename(p)] = (soi, pdsize, mstamp)
    groups = collections.defaultdict(list)
    for r in rows:
        if "memfd:wine-mapping" in r["path"]:
            groups[r["inode"]].append(r)
    views = []
    for ino, rs in groups.items():
        rs.sort(key=lambda r: r["start"])
        clusters, cur = [], [rs[0]]
        for r in rs[1:]:
            if r["start"] - cur[-1]["end"] > 0x1000000:
                clusters.append(cur)
                cur = [r]
            else:
                cur.append(r)
        clusters.append(cur)
        for c in clusters:
            span = c[-1]["end"] - c[0]["start"]
            pages = collections.Counter()
            for r in c:
                pages[r["perm"]] += (r["end"] - r["start"]) // 4096
            name = next((n for n, (soi, _, _) in mods.items() if soi == span), None)
            if span >= 0x80000:
                views.append({"inode": ino, "start": "0x%X" % c[0]["start"], "span": "0x%X" % span, "module_by_size": name,
                              "pages_by_perm": dict(pages),
                              "kind": "exec view (PROT_NONE = not yet decrypted)" if "---s" in pages or "r-xs" in pages else "read-write alias"})
    snap["protected_module_views"] = views
    pd = []
    for n, (soi, pdsize, _) in mods.items():
        for r in rows:
            inside_runtime = base is not None and base <= r["start"] < base + size
            if (not r["path"] and r["perm"] == "rw-p" and pdsize >= 0x10000 and not inside_runtime
                    and r["end"] - r["start"] == (pdsize + 0xfff) & ~0xfff):
                pd.append({"module": n, "pdata_size": "0x%X" % pdsize, "buffer": "0x%X" % r["start"]})
    snap["private_rw_buffers_matching_pdata_size"] = pd
    if "--no-save" not in sys.argv:
        path = os.path.join(OUT, "runtime-maps-%s.json" % time.strftime("%Y%m%dT%H%M"))
        json.dump(snap, open(path, "w"), indent=1)
        print(path)
    print(json.dumps({k: v for k, v in snap.items() if k != "runtime.dll"}, indent=1)[:3000])
    print("runtime.dll base", snap["runtime.dll"]["base"], "file_backed", snap["runtime.dll"]["file_backed"])


if __name__ == "__main__":
    main()
