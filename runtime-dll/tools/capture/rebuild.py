"""Rebuild full module images from artifacts/<stamp>/manifest.json and check their sha256.
Usage: python3 -I rebuild.py STAMP [--out DIR]   (without --out, only verifies)
"""
import gzip, hashlib, json, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ART = os.path.join(os.path.dirname(os.path.dirname(HERE)), "artifacts", "live-captures")
PAGE = 4096


def image(stamp, module, base):
    m = json.load(open(os.path.join(ART, stamp, "manifest.json")))
    row = next(r for r in m["modules"] if r["module"] == module and r["base"] == base)
    s = row["storage"]
    if s["kind"] == "full":
        data = gzip.open(os.path.join(ART, stamp, s["file"])).read()
    elif s["kind"] == "same_as":
        data = image(s["capture"], module, base)
    else:
        data = bytearray(image(s["base_capture"], module, base))
        delta = gzip.open(os.path.join(ART, stamp, s["file"])).read()
        for i, rva in enumerate(s["rvas"]):
            o = int(rva, 16)
            data[o:o + PAGE] = delta[i * PAGE:(i + 1) * PAGE]
        data = bytes(data)
    assert hashlib.sha256(data).hexdigest() == row["sha256"], (stamp, module)
    return data


def main():
    stamp = sys.argv[1]
    out = sys.argv[sys.argv.index("--out") + 1] if "--out" in sys.argv else None
    for r in json.load(open(os.path.join(ART, stamp, "manifest.json")))["modules"]:
        data = image(stamp, r["module"], r["base"])
        if out:
            os.makedirs(out, exist_ok=True)
            open(os.path.join(out, "%s-%s.bin" % (r["module"], r["base"])), "wb").write(data)
        print("ok %-44s %s" % (r["module"], r["storage"]["kind"]))


if __name__ == "__main__":
    main()
