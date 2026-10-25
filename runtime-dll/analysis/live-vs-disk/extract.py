"""Emit bounded live-vs-disk evidence for the pages that differ between the runtime.dll capture
and bin/runtime.dll mapped and relocated to the capture base (compare_runtime.expected_image).

evidence/differing-pages.json: per differing page, every changed byte run, with live and expected
bytes for runs of at most 64 bytes. evidence/rwx-stubs.asm: the non-zero span of the live .rwx
page, disassembled by GNU objdump at its live VA, and the decoded jump targets.
Usage: python3 -I extract.py [capture.bin.gz] [path/to/runtime.dll]
"""
import gzip, hashlib, json, os, re, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import compare_runtime as cr  # noqa: E402

CAPTURE = os.path.join(HERE, "../../artifacts/capture/fde6c135-700000000000/runtime-live-20261024T2310.bin.gz")
BASE, PAGE, RWX = 0x700000000000, 4096, 0x4000


def runs(a, b):
    out, i = [], 0
    while i < len(a):
        if a[i] != b[i]:
            j = i
            while j < len(a) and a[j] != b[j]:
                j += 1
            out.append((i, j - i))
            i = j
        else:
            i += 1
    return out


def main():
    cap = sys.argv[1] if len(sys.argv) > 1 else CAPTURE
    disk = sys.argv[2] if len(sys.argv) > 2 else cr.RUNTIME
    live = gzip.open(cap).read()
    want, secs, _ = cr.expected_image(BASE, disk)
    assert len(live) == len(want), "capture and image sizes differ"
    pages = []
    for rva in range(0, len(live), PAGE):
        a, b = live[rva:rva + PAGE], want[rva:rva + PAGE]
        if a == b:
            continue
        rs = runs(a, b)
        pages.append({"rva": "0x%X" % rva, "section": cr.section_of(secs, rva), "changed_bytes": sum(n for _, n in rs),
                      "runs": [dict({"rva": "0x%X" % (rva + o), "length": n},
                                    **({"live": a[o:o + n].hex(), "expected": b[o:o + n].hex()} if n <= 64 else
                                       {"live_sha256": hashlib.sha256(a[o:o + n]).hexdigest()})) for o, n in rs]})
    os.makedirs(os.path.join(HERE, "evidence"), exist_ok=True)
    meta = {"capture": os.path.relpath(cap, HERE), "capture_sha256": hashlib.sha256(live).hexdigest(),
            "disk": disk, "disk_sha256": hashlib.sha256(open(disk, "rb").read()).hexdigest(),
            "base": "0x%X" % BASE, "pages_compared": len(live) // PAGE, "pages_different": len(pages), "pages": pages}
    json.dump(meta, open(os.path.join(HERE, "evidence", "differing-pages.json"), "w"), indent=1)

    page = live[RWX:RWX + PAGE]
    end = max(i for i, x in enumerate(page) if x) + 1
    with tempfile.NamedTemporaryFile(suffix=".bin") as t:
        t.write(page[:end])
        t.flush()
        text = subprocess.run(["objdump", "-D", "-w", "-b", "binary", "-m", "i386:x86-64", "-M", "intel",
                               "--adjust-vma=0x%X" % (BASE + RWX), t.name], capture_output=True, text=True, check=True).stdout
    body = text[text.index("Disassembly of section"):].replace(t.name, "rwx-page")
    targets = sorted({int(x, 16) for x in re.findall(r"\bjmp\s+0x([0-9a-f]+)", body)})
    tool = subprocess.run(["objdump", "--version"], capture_output=True, text=True).stdout.splitlines()[0]
    head = ("; runtime.dll live .rwx page (RVA 0x%X), non-zero span 0x0-0x%X of 0x1000; on disk the page is all zero\n"
            "; capture sha256 %s, VA = 0x%X + RVA, %s\n" % (RWX, end, meta["capture_sha256"], BASE, tool))
    tail = "\n; jmp targets (absolute VA; all outside runtime.dll's image):\n" + "".join(
        ";   0x%X  (runtime.dll base %s 0x%X)\n" % (v, "-" if v < BASE else "+", abs(v - BASE)) for v in targets)
    open(os.path.join(HERE, "evidence", "rwx-stubs.asm"), "w").write(head + body + tail)
    print("%d differing pages; .rwx span 0x%X bytes, %d jmp targets" % (len(pages), end, len(targets)))


if __name__ == "__main__":
    main()
