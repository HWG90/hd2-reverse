"""Pack LLtM module captures (GooseGadgets/module-captures/<stamp>/) into each module's folder:
<module-folder>/artifacts/live-captures/<stamp>/.

Only the game's own modules and the user's mod DLLs are packed; third-party SDK DLLs are left out.
The first capture of a module/base pair is stored whole (gzip -9 -n). A later capture of the same
pair is `same_as` when byte-identical, otherwise a page delta: the changed 4 KiB pages, gzipped,
with their RVAs in the manifest. tools/capture/rebuild.py in each folder restores full images.
Usage: python3 -I pack.py REPO_ROOT STAMP [STAMP ...]   (oldest first)
"""
import gzip, hashlib, json, os, re, sys

SRC = "/home/goose/Documents/ChatGPT/GooseGadgets/module-captures"
FOLDERS = [  # module name pattern -> repository folder
    (r"helldivers2\.exe", "helldivers2-exe"),
    (r"game\.dll", "game-dll"),
    (r"runtime\.dll", "runtime-dll"),
    (r"preloader\.dll", "preloader-dll"),
    (r"wwise_pluginw64_release\.dll", "wwise-plugin-dll"),
    (r"level_generation_pluginw64_release\.dll", "level-generation-plugin-dll"),
    (r"guarded_reads_\w+\.dll", "guarded-reads-dll"),
    (r"hd2_luajit_runtime_\w+\.dll", "hd2-luajit-runtime-dll"),
    (r"hd2_nativeinfo_\w+\.dll", "hd2-nativeinfo-dll"),
    (r"reward_api_\w+\.dll", "reward-api-dll"),
]
PAGE = 4096


def folder(module):
    return next((f for p, f in FOLDERS if re.fullmatch(p, module, re.I)), None)


def sha(b):
    return hashlib.sha256(b).hexdigest()


def gz(path, data):
    with open(path, "wb") as f, gzip.GzipFile(fileobj=f, mode="wb", compresslevel=9, mtime=0, filename="") as g:
        g.write(data)


def main():
    root, stamps = sys.argv[1], sys.argv[2:]
    first, manifests = {}, {}
    for stamp in stamps:
        src = os.path.join(SRC, stamp)
        m = json.load(open(os.path.join(src, "manifest.json")))
        for e in m["modules"]:
            dest = "error" not in e and folder(e["module"])
            if not dest:
                continue
            data = open(os.path.join(src, e["file"]), "rb").read()
            assert sha(data) == e["sha256"], e["file"]
            out = os.path.join(root, dest, "artifacts", "live-captures", stamp)
            os.makedirs(out, exist_ok=True)
            stem = e["file"][:-4]
            open(os.path.join(out, stem + ".pages.txt"), "w").write(open(os.path.join(src, e["file"] + ".pages.txt")).read())
            row = {k: e[k] for k in ("module", "base", "image_size", "timestamp", "loader_entry", "sha256", "pages", "unreadable_pages")}
            key = (e["module"], e["base"])
            if key in first:
                pstamp, prev = first[key]
                if prev == data:
                    row["storage"] = {"kind": "same_as", "capture": pstamp}
                else:
                    changed = [o for o in range(0, len(data), PAGE) if data[o:o + PAGE] != prev[o:o + PAGE]]
                    gz(os.path.join(out, stem + ".delta.bin.gz"), b"".join(data[o:o + PAGE] for o in changed))
                    row["storage"] = {"kind": "page_delta", "base_capture": pstamp, "file": stem + ".delta.bin.gz",
                                      "changed_pages": len(changed), "rvas": ["0x%X" % o for o in changed]}
            else:
                gz(os.path.join(out, stem + ".bin.gz"), data)
                row["storage"] = {"kind": "full", "file": stem + ".bin.gz"}
                first[key] = (stamp, data)
            man = manifests.setdefault(out, {"capture": stamp, "pid": m["pid"], "started": m["started"],
                                             "method": m["capture"], "modules": []})
            man["modules"].append(row)
    for out, man in manifests.items():
        json.dump(man, open(os.path.join(out, "manifest.json"), "w"), indent=1)
        print(os.path.relpath(out, root), ", ".join("%s:%s" % (r["module"], r["storage"]["kind"]) for r in man["modules"]))


if __name__ == "__main__":
    main()
