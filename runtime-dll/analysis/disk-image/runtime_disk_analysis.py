"""Offline analysis of HD2 bin/runtime.dll and bin/preloader.dll (files on disk only; no game access).

Writes GooseGadgets/runtime-disk-analysis.json and GooseGadgets/runtime-root-certs.txt.
Usage: python3 -I runtime_disk_analysis.py
"""
import collections, hashlib, json, math, os, re, struct, subprocess, sys

import pefile

BIN = "/mnt/WORMHOLE/SteamLibrary/steamapps/common/Helldivers 2/bin"
OUT = "/home/goose/Documents/ChatGPT/GooseGadgets"


def entropy(b):
    if not b:
        return 0.0
    c = collections.Counter(b)
    n = len(b)
    return -sum(v / n * math.log2(v / n) for v in c.values())


def sections(pe, data):
    rows = []
    for s in pe.sections:
        raw = data[s.PointerToRawData:s.PointerToRawData + s.SizeOfRawData]
        pages = [raw[i:i + 4096] for i in range(0, len(raw), 4096)]
        ents = [entropy(p) for p in pages if p]
        rows.append({
            "name": s.Name.rstrip(b"\0").decode(errors="replace"),
            "rva": "0x%X" % s.VirtualAddress, "virtual_size": "0x%X" % s.Misc_VirtualSize,
            "raw_offset": "0x%X" % s.PointerToRawData, "raw_size": "0x%X" % s.SizeOfRawData,
            "characteristics": "0x%08X" % s.Characteristics,
            "entropy": round(entropy(raw), 3),
            "pages": len(pages),
            "pages_entropy_ge_7_9": sum(1 for e in ents if e >= 7.9),
            "pages_entropy_lt_7": sum(1 for e in ents if e < 7.0),
        })
    return rows


def imports(pe):
    out = {}
    for imp in getattr(pe, "DIRECTORY_ENTRY_IMPORT", []):
        out[imp.dll.decode()] = [(x.name.decode() if x.name else "#%d" % x.ordinal) for x in imp.imports]
    return out


def exports(pe):
    e = getattr(pe, "DIRECTORY_ENTRY_EXPORT", None)
    if not e:
        return None
    return {"dll_name": e.name.decode() if e.name else None,
            "symbols": [{"name": s.name.decode() if s.name else None, "ordinal": s.ordinal,
                         "rva": "0x%X" % s.address} for s in e.symbols]}


def resources(pe):
    rows = []

    def walk(d, depth=0, path=""):
        for e in d.entries:
            nm = str(e.name) if e.name else (pefile.RESOURCE_TYPE.get(e.id, e.id) if depth == 0 else e.id)
            if hasattr(e, "directory"):
                walk(e.directory, depth + 1, path + "/" + str(nm))
            else:
                st = e.data.struct
                blob = pe.get_data(st.OffsetToData, st.Size)
                rows.append({"path": path + "/" + str(nm), "rva": "0x%X" % st.OffsetToData, "size": "0x%X" % st.Size,
                             "entropy": round(entropy(blob), 3), "head": blob[:16].hex(),
                             "sha256": hashlib.sha256(blob).hexdigest()})
    if hasattr(pe, "DIRECTORY_ENTRY_RESOURCE"):
        walk(pe.DIRECTORY_ENTRY_RESOURCE)
    return rows


def pdata_summary(pe, data_dir_rva, size):
    secs = [(s.Name.rstrip(b"\0").decode(), s.VirtualAddress, s.VirtualAddress + max(s.Misc_VirtualSize, s.SizeOfRawData))
            for s in pe.sections]
    d = pe.get_data(data_dir_rva, size)
    cnt = collections.Counter()
    n = len(d) // 12
    for i in range(n):
        b, e, u = struct.unpack_from("<III", d, i * 12)
        cnt[next((nm for nm, a, z in secs if a <= b < z), "outside")] += 1
    return {"entries": n, "functions_by_section": dict(cnt)}


def certs_from_zstd_resource(pe, rva, size):
    blob = pe.get_data(rva, size)
    if blob[:4] != b"\x28\xb5\x2f\xfd":
        return None, []
    raw = subprocess.run(["zstd", "-d", "-c"], input=blob, capture_output=True, check=True).stdout
    certs, i = [], 0
    while i + 4 <= len(raw):
        n = struct.unpack_from("<I", raw, i)[0]
        der = raw[i + 4:i + 4 + n]
        if len(der) != n or der[:1] != b"\x30":
            break
        r = subprocess.run(["openssl", "x509", "-inform", "DER", "-noout", "-subject", "-enddate", "-fingerprint", "-sha256"],
                           input=der, capture_output=True)
        certs.append(" | ".join(r.stdout.decode(errors="replace").split("\n")).strip(" |"))
        i += 4 + n
    return {"decompressed_bytes": len(raw), "format": "u32 length + DER X.509, repeated", "count": len(certs),
            "parsed_bytes": i}, certs


def strings_of(pe, data, wanted_sections=None):
    out = []
    for s in pe.sections:
        nm = s.Name.rstrip(b"\0").decode()
        if wanted_sections and nm not in wanted_sections:
            continue
        raw = data[s.PointerToRawData:s.PointerToRawData + s.SizeOfRawData]
        for m in re.finditer(rb"(?:[\x20-\x7e]\x00){8,}", raw):
            out.append({"section": nm, "rva": "0x%X" % (s.VirtualAddress + m.start()), "utf16": m.group().decode("utf-16-le")})
        for m in re.finditer(rb"[\x20-\x7e]{12,}", raw):
            t = m.group().decode()
            if re.search(r"[a-z]{3,}[ _.:-][A-Za-z]{3,}", t) or re.search(r"%[0-9]*[sdxlu]", t):
                out.append({"section": nm, "rva": "0x%X" % (s.VirtualAddress + m.start()), "ascii": t})
    return out


def analyse(path):
    data = open(path, "rb").read()
    pe = pefile.PE(data=data)
    oh, fh = pe.OPTIONAL_HEADER, pe.FILE_HEADER
    info = {
        "path": path, "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest(),
        "timestamp": "0x%08X" % fh.TimeDateStamp, "image_base": "0x%X" % oh.ImageBase,
        "size_of_image": "0x%X" % oh.SizeOfImage, "entry_rva": "0x%X" % oh.AddressOfEntryPoint,
        "dll_characteristics": "0x%X" % oh.DllCharacteristics,
        "sections": sections(pe, data), "imports": imports(pe), "exports": exports(pe),
        "resources": resources(pe),
        "data_directories": {d.name: ["0x%X" % d.VirtualAddress, "0x%X" % d.Size] for d in oh.DATA_DIRECTORY if d.VirtualAddress or d.Size},
        "pdb": [e.entry.PdbFileName.rstrip(b"\0").decode() for e in getattr(pe, "DIRECTORY_ENTRY_DEBUG", []) if getattr(e, "entry", None) is not None and hasattr(e.entry, "PdbFileName")],
    }
    exc = oh.DATA_DIRECTORY[3]
    if exc.Size:
        info["exception_table"] = pdata_summary(pe, exc.VirtualAddress, exc.Size)
    return pe, data, info


def main():
    report = {}
    pe, data, rt = analyse(os.path.join(BIN, "runtime.dll"))
    certs_meta, certs = None, []
    for r in rt["resources"]:
        if r["path"].endswith("/10001/1033"):
            certs_meta, certs = certs_from_zstd_resource(pe, int(r["rva"], 16), int(r["size"], 16))
    rt["rcdata_10001_root_certificates"] = certs_meta
    rt["strings_plaintext"] = strings_of(pe, data, {"packer0", "packer2", "packer40", "packer42", ".rdata"})
    report["runtime.dll"] = rt
    pe2, data2, pl = analyse(os.path.join(BIN, "preloader.dll"))
    pl["strings_plaintext"] = strings_of(pe2, data2)
    report["preloader.dll"] = pl
    json.dump(report, open(os.path.join(OUT, "runtime-disk-analysis.json"), "w"), indent=1)
    open(os.path.join(OUT, "runtime-root-certs.txt"), "w").write("\n".join(certs) + "\n")
    print("runtime.dll sections:", len(rt["sections"]), "pdata:", rt.get("exception_table"),
          "certs:", certs_meta and certs_meta["count"], "strings:", len(rt["strings_plaintext"]))


if __name__ == "__main__":
    main()
