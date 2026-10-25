# runtime.dll and preloader.dll on disk

## Result

`bin/runtime.dll` (64,222,296 bytes, sha256 `97fe1c10…c947b`, timestamp `0xFDE6C135`, preferred base `0x200000000`) is a 64-bit DLL whose two large code sections are **plain x86-64 on disk**, with a valid exception table, but heavily obfuscated. Most of its read-only data and resources are high-entropy. It has **no exports** and only four placeholder imports. Both it and `preloader.dll` carry an Authenticode chain naming **Arrowhead Game Studios AB** (DigiCert Trusted G4 code-signing CA); the signature was not verified.

The crash-dumper strings name dump files `THEIA_%llu_%llu.dmp`. That filename is the only basis for calling the protection "Theia"; no product or vendor is confirmed.

## Sections

Entropy is per 4 KiB page. `≥ 7.9` means the page looks encrypted or compressed; this is a statistical estimate, not decryption evidence.

| Section | RVA | Virtual size | Pages | Pages ≥ 7.9 | Notes |
|---|---|---|---|---|---|
| `.rdata` | `0x1000` | `0x1040` | 2 | 0 | IAT `0x1000` |
| `.rodata` | `0x3000` | `0x21` | 1 | 0 | executable |
| `.rwx` | `0x4000` | `0x1000` | 1 | 0 | all zero on disk; written at runtime ([live vs disk](../live-vs-disk/README.md)) |
| `packer0` | `0x5000` | `0x47EF48` | 1,151 | 798 | read-only data |
| `packer1` | `0x484000` | `0x178464` | 377 | 102 | code, 1,818 functions in `.pdata` |
| `packer2` | `0x5FD000` | `0x19908` | 26 | 0 | read-write data |
| `.rsrc` | `0x617000` | `0x505F00` | 1,286 | 1,275 | resources |
| `.reloc` | `0xB1D000` | `0x11AC` | 2 | 0 | |
| `packer30` | `0xB1F000` | `0x24267E` | 579 | 0 | code, 18,023 functions |
| `packer40` | `0xD62000` | `0x86260` | 135 | 22 | read-write data |
| `packer31` | `0xDE9000` | `0x2F055CF` | 12,038 | 0 | code (47 MB), 8,760 functions |
| `packer42` | `0x3CEF000` | `0x666B8` | 103 | 0 | read-write data |

The exception table has 28,601 entries. The entry point (RVA `0x560040`, in `packer1`) is a `jmp` into `packer30` followed by non-code bytes. Sampled code uses mixed boolean-arithmetic obfuscation (`not`/`and`/`imul` with 64-bit constants). The PDB path is `/work/runtime.pdb` (preloader: `/work/preloader.pdb`).

## Imports, strings and resources

- Imports: `ntdll!RtlPcToFileHeader`, `KERNEL32!CloseHandle`, `USER32!CloseWindow`, `GDI32!CloseEnhMetaFile`. None of these explains the module's behaviour; real APIs arrive through preloader's context table ([preloader mapping](../preloader-mapping/README.md)).
- Plaintext strings in `packer0`: X.509 printing strings (mbedTLS style), MSVC STL errors, and UTF-16 crash-dumper text: the `THEIA_*.dmp` name, a full-dump prompt when Shift is held, upload progress with HTTP codes, Arrowhead Zendesk support text and register-dump lines.
- `RCDATA 10001`: zstd-compressed bundle of 488 root CA certificates (u32 length + DER, repeated), listed in `root-certificates.txt`. Their use is not traced; certificate validation is an inference.
- `RCDATA 10100-10103` and `10150-10153`: four payloads in two variants each (same 32-bit tag per pair, first u32 = payload length), high entropy. Contents not determined.

## Evidence

| File | Produced by |
|---|---|
| `disk-analysis.json` | `runtime_disk_analysis.py` (PE layout, entropy, imports, resources, strings, exception table, preloader summary) |
| `root-certificates.txt` | `runtime_disk_analysis.py` (subject, notAfter and SHA-256 fingerprint per certificate) |
| `authenticode-signers.json` | `signers.py` (certificate chain from each file's security directory) |

`runtime_disk_analysis.py` is the original script and writes to GooseGadgets; see [path-migration](../../reports/path-migration.json). Requires `pefile`, the `zstd` CLI and `openssl` ([toolchain](../../reports/toolchain.json)). Reads files on disk only.

## Limits

- Entropy classes pages; it does not prove encryption or identify an algorithm.
- The obfuscation was sampled, not systematically characterised. No function in `packer30`/`packer31` has been decompiled.
- `disk-analysis.json` also records the agent's preloader behaviour summary; the decoded part is in [preloader mapping](../preloader-mapping/README.md).
