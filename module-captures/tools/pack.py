"""Pack LLtM module captures (GooseGadgets/module-captures/<stamp>/) into artifacts/<stamp>/.

Only the game's own modules and the user's mod DLLs are packed; third-party SDK DLLs are left out.
The first capture of a module/base pair is stored whole (gzip -9 -n). A later capture of the same
pair is stored as `same_as` when byte-identical, otherwise as a page delta: the changed 4 KiB
pages, gzipped, plus their RVAs in the manifest. rebuild.py restores full images.
Usage: python3 -I pack.py STAMP [STAMP ...]   (oldest first)
"""
import gzip, hashlib, json, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
SRC = "/home/goose/Documents/ChatGPT/GooseGadgets/module-captures"
INCLUDE = re.compile(r"^(helldivers2\.exe|game\.dll|runtime\.dll|preloader\.dll|wwise_pluginw64_release\.dll|"
                     r"level_generation_pluginw64_release\.dll|guarded_reads_\w+\.dll|hd2_luajit_runtime_\w+\.dll|"
                     r"hd2_nativeinfo_\w+\.dll|hd2_cffi_\w+\.dll|reward_api_\w+\.dll|native_ads_\w+\.dll|mcm_input_\w+\.dll)$", re.I)
PAGE = 4096


def sha(b):
    return hashlib.sha256(b).hexdigest()


def gz(path, data):
    with open(path, "wb") as f, gzip.GzipFile(fileobj=f, mode="wb", compresslevel=9, mtime=0, filename="") as g:
        g.write(data)


def main():
    first = {}  # (module, base) -> (stamp, bytes)
    for stamp in sys.argv[1:]:
        src = os.path.join(SRC, stamp)
        m = json.load(open(os.path.join(src, "manifest.json")))
        out = os.path.join(ROOT, "artifacts", stamp)
        os.makedirs(out, exist_ok=True)
        rows = []
        for e in m["modules"]:
            if "error" in e or not INCLUDE.match(e["module"]):
                continue
            data = open(os.path.join(src, e["file"]), "rb").read()
            assert sha(data) == e["sha256"], e["file"]
            pages = open(os.path.join(src, e["file"] + ".pages.txt")).read()
            stem = e["file"][:-4]
            row = {k: e[k] for k in ("module", "base", "image_size", "timestamp", "loader_entry", "sha256", "pages", "unreadable_pages")}
            open(os.path.join(out, stem + ".pages.txt"), "w").write(pages)
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
            rows.append(row)
        json.dump({"capture": stamp, "pid": m["pid"], "started": m["started"], "method": m["capture"], "modules": rows},
                  open(os.path.join(out, "manifest.json"), "w"), indent=1)
        print(stamp, ", ".join("%s:%s" % (r["module"], r["storage"]["kind"]) for r in rows))


if __name__ == "__main__":
    main()
