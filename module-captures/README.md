# Live module captures

Whole-image captures of Helldivers 2's own modules and the mod DLLs loaded alongside them, read inside the running game through LLtM. Third-party SDK DLLs (DLSS, XeSS, FSR, EOS, Steam API, Bink, DirectStorage, PlayFab, PIX, libcurl) were captured but are not published here.

| Directory | Contents |
|---|---|
| [artifacts](artifacts/) | One folder per capture: `manifest.json`, gzipped images or page deltas, per-module `.pages.txt` |
| [tools](tools/) | `pack.py` (capture → artifacts), `rebuild.py` (artifacts → full images, sha256-checked) |

Two captures of one game session (PID 36844, launched 2026-10-25 00:46): `20261025T0047` and `20261025T0133`. The first is stored whole. In the second, a module is either identical to the first, new (stored whole), or a page delta holding only the 4 KiB pages that changed.

| Module | Timestamp | Base | Pages | Unreadable 00:47 | Unreadable 01:33 | 01:33 stored as |
|---|---|---|---|---|---|---|
| helldivers2.exe | `0x6AD78C0D` | `0x140000000` | 10750 | 1873 | 1644 | 385 changed pages |
| game.dll | `0x6AD7C05D` | `0x6FFFF0880000` | 13186 | 3532 | 2622 | 1008 changed pages |
| guarded_reads_b81a5f50ea621a3a.dll | `0x2A3538CB` | `0x6FFFE9EB0000` | 49 | 0 | 0 | identical |
| hd2_luajit_runtime_3add3f7f4b6f7517.dll | `0x6ADD589D` | `0x6FFFE9FA0000` | 692 | 0 | 0 | identical |
| hd2_nativeinfo_3139cc5f8ecb4078.dll | `0xDE5E113B` | `0x6FFFE9F00000` | 56 | 0 | 0 | 1 changed pages |
| hd2_nativeinfo_f6d3465944c1aea1.dll | `0x5B1AB26C` | `0x6FFFE9F50000` | 52 | 0 | 0 | identical |
| level_generation_pluginw64_release.dll | `0x6AD78BE8` | `0x6FFFF4300000` | 154 | 81 | 81 | 1 changed pages |
| preloader.dll | `0xA0CF546E` | `0x6FFFFC4E0000` | 14 | 0 | 0 | identical |
| reward_api_7039e9d3bdd0664f.dll | `0x25F213C4` | `0x6FFFE9BD0000` | 51 | 0 | 0 | 1 changed pages |
| wwise_pluginw64_release.dll | `0x6AD78BEB` | `0x6FFFF3C20000` | 1733 | 356 | 322 | 262 changed pages |
| runtime.dll | `0xFDE6C135` | `0x700000000000` | 15702 | 0 | 0 | 2 changed pages |
| hd2_nativeinfo_4aab2adfbc4090d6.dll | `0x20E73AD9` | `0x6FFFE9B30000` | 52 | - | 0 | full (new) |
| hd2_nativeinfo_5e39eeeeb76b863a.dll | `0x80ED70A5` | `0x6FFFE9AE0000` | 52 | - | 0 | full (new) |

Unreadable pages are zero-filled and listed in each module's `.pages.txt`. In the four modules runtime.dll protects (exe, game.dll, wwise, level-gen) they are pages not yet decrypted; 1,173 more of them were readable at 01:33 than at 00:47 (see [protected module views](../runtime-dll/analysis/protected-module-views/README.md)). Changed pages also include ordinary writable data, so a delta is not only newly decrypted code.

Each image is in mapped layout (RVA = offset) at the base shown; pointers are session witnesses. Images are captures, not on-disk files: relocations, runtime writes and decryption state are as read. Readable does not prove decrypted.

Capture method: `ReadProcessMemory` on the game's own process from an LLtM `eval`, 4 KiB at a time in parts of at most 16 MiB. No game memory was written and no game function was called. Source: `GooseGadgets/relay-tools/capture_modules.py`.

```sh
python3 -I tools/rebuild.py 20261025T0133 --out /path/to/images
```
