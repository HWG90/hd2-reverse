# Live captures of preloader.dll

Whole-image reads inside the running game through LLtM (`ReadProcessMemory` on the game's own process, 4 KiB pages, parts of at most 16 MiB). One folder per capture; both are from game session PID 36844 (launched 2026-10-25 00:46).

| Capture | Module | Timestamp | Base | Pages | Unreadable | Stored as |
|---|---|---|---|---|---|---|
| `20261025T0047` | preloader.dll | `0xA0CF546E` | `0x6FFFFC4E0000` | 14 | 0 | full image |
| `20261025T0133` | preloader.dll | `0xA0CF546E` | `0x6FFFFC4E0000` | 14 | 0 | identical to 00:47 |

Each capture folder has `manifest.json`, the stored bytes and a `.pages.txt` per module listing unreadable (zero-filled) pages. The first capture of a module/base pair is stored whole; a later one is either identical or a page delta of only the changed 4 KiB pages. Rebuild and verify (sha256) with:

```sh
python3 -I ../../tools/capture/rebuild.py 20261025T0133 --out /path/to/images
```

Images are in mapped layout (RVA = offset) at the base shown; pointers are session witnesses. Readable does not prove decrypted. No game memory was written and no game function was called. Capture source: `GooseGadgets/relay-tools/capture_modules.py`; packing: `../../tools/capture/pack.py`.
