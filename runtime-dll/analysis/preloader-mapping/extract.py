"""Emit bounded preloader.dll evidence: functions named in the README, disassembled from the
on-disk file, plus the file offsets of the strings the README cites.

Function bounds come from preloader.dll's own exception table (.pdata). Disassembly is GNU
objdump (Intel syntax) at the module's preferred base; RVAs are VA - ImageBase.
Usage: python3 -I extract.py [path/to/preloader.dll]
"""
import hashlib, json, os, struct, subprocess, sys

import pefile

HERE = os.path.dirname(os.path.abspath(__file__))
DLL = sys.argv[1] if len(sys.argv) > 1 else "/mnt/WORMHOLE/SteamLibrary/steamapps/common/Helldivers 2/bin/preloader.dll"
TARGETS = [
    (0xB010, "export1_ud2_stub", "export ordinal 1 as exported: ud2 in section .entry"),
    (0xB030, "dllmain_ud2_stub", "AddressOfEntryPoint: ud2 in section .entry"),
    (0x2040, "unwind_handler_redirect", "language handler named by the .entry stubs' unwind info"),
    (0x2000, "dllmain_real", "real DllMain target"),
    (0x37E0, "export1_real", "real export ordinal 1 target"),
    (0x2390, "init_load_runtime", "initialisation: Wine check and runtime.dll mapping"),
    (0x2170, "apply_base_relocations", "base relocation pass used by the Wine path"),
]
STRINGS = [b"wine_get_version", b"NtCreateSection", b"runtime.dll", b"Conflicting software detected!",
           b"File version mismatch between the preloader and runtime DLLs", b"PACKER_CRASH_AT"]


def sha(b):
    return hashlib.sha256(b).hexdigest()


def unwind_handler(pe, unwind_rva):
    """UNWIND_INFO: flags, language-handler RVA and the first u32 of its handler data."""
    head = pe.get_data(unwind_rva, 4)
    flags, codes = head[0] >> 3, head[2]
    if not flags & 3:  # neither UNW_FLAG_EHANDLER nor UNW_FLAG_UHANDLER
        return None
    at = unwind_rva + 4 + 2 * (codes + (codes & 1))
    handler, data = struct.unpack("<II", pe.get_data(at, 8))
    return {"flags": flags, "handler_rva": "0x%X" % handler, "handler_data_u32": "0x%X" % data}


def main():
    data = open(DLL, "rb").read()
    pe = pefile.PE(DLL)
    base = pe.OPTIONAL_HEADER.ImageBase
    entries = getattr(pe, "DIRECTORY_ENTRY_EXCEPTION", [])
    funcs = [(e.struct.BeginAddress, e.struct.EndAddress) for e in entries]
    unwind = {e.struct.BeginAddress: e.struct.UnwindData for e in entries}
    tool = subprocess.run(["objdump", "--version"], capture_output=True, text=True).stdout.splitlines()[0]
    out = {"input": {"path": DLL, "sha256": sha(data), "timestamp": "0x%08X" % pe.FILE_HEADER.TimeDateStamp,
                     "image_base": "0x%X" % base}, "disassembler": tool, "functions": [], "strings": []}
    os.makedirs(os.path.join(HERE, "evidence"), exist_ok=True)
    for rva, name, role in TARGETS:
        begin, end = next(((b, e) for b, e in funcs if b <= rva < e), (rva, rva + 0x40))
        text = subprocess.run(["objdump", "-d", "-w", "-M", "intel",
                               "--start-address=0x%X" % (base + begin), "--stop-address=0x%X" % (base + end), DLL],
                              capture_output=True, text=True, check=True).stdout
        body = text[text.index("Disassembly of section"):]
        path = os.path.join("evidence", "%s-%x.asm" % (name, rva))
        header = "; preloader.dll %s, %s\n; RVA 0x%X-0x%X (pdata %s), VA = 0x%X + RVA\n" % (
            out["input"]["timestamp"], role, begin, end, "bounded" if (begin, end) in funcs else "not found; fixed 0x40", base)
        open(os.path.join(HERE, path), "w").write(header + body)
        raw = pe.get_data(begin, end - begin)
        out["functions"].append({"name": name, "role": role, "rva": "0x%X" % begin, "end_rva": "0x%X" % end,
                                 "bounded_by_pdata": (begin, end) in funcs, "code_sha256": sha(raw), "file": path,
                                 "unwind_handler": unwind_handler(pe, unwind[begin]) if begin in unwind else None})
    for s in STRINGS:
        for enc, needle in (("ascii", s), ("utf-16le", s.decode().encode("utf-16-le"))):
            off = data.find(needle)
            if off >= 0:
                out["strings"].append({"text": s.decode(), "encoding": enc, "file_offset": "0x%X" % off,
                                       "rva": "0x%X" % pe.get_rva_from_offset(off)})
    json.dump(out, open(os.path.join(HERE, "evidence", "manifest.json"), "w"), indent=2)
    print("%d functions, %d strings -> evidence/" % (len(out["functions"]), len(out["strings"])))


if __name__ == "__main__":
    main()
