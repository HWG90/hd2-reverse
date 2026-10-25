# Protected module views

## Result

The four modules that import preloader ordinal 1 are not file mappings in the running process. Each is a **shared mapping of one object, mapped twice**: a running view at the module base, and a second view of the same inode that is read-write everywhere. In the running view, part of each image is mapped with no access (`---s`). This was read from `/proc/<pid>/maps` on Linux only; the game was not touched.

Snapshot: PID 2289138, 2026-10-24 23:10:07 local, about three minutes after launch ([`triage/maps-20261024T2310.json`](../../triage/maps-20261024T2310.json)).

| Module | Running view | Pages | `---s` | `r-xs` | `r--s` | `rw-s` | Read-write view |
|---|---|---|---|---|---|---|---|
| helldivers2.exe | `0x140000000` | 10,750 | 1,867 | 3,393 | 1,592 | 3,898 | `0x4F00000` |
| game.dll | `0x6FFFF0870000` | 13,186 | 3,431 | 4,657 | 1,803 | 3,295 | `0x8E180000` |
| wwise_pluginw64_release.dll | `0x6FFFF3C10000` | 1,733 | 351 | 734 | 402 | 246 | `0x8BDF0000` |
| level_generation_pluginw64_release.dll | `0x6FFFF42F0000` | 154 | 81 | 30 | 36 | 7 | `0x7FBF0000` |

Modules are matched by mapping size; both views of each share one inode.

Private read-write buffers exactly the size of three modules' exception tables (`.pdata`) were also present: helldivers2.exe `0x142A00000` (`0x112000`), game.dll `0x6FFFFCC70000` (`0x1B7000`) and wwise `0x6FFFF4410000` (`0x3B000`). Two more shared mappings are unattributed: inode 220308 at `0x800000` (324 pages, `r--p`) and inode 226321 at `0xAF0000` (512 pages, `rw-s`).

## Interpretation

runtime.dll keeps each protected image in a shared object, writes decrypted pages through the read-write view, and opens them in the running view on first use. No-access pages are those not yet decrypted. This matches earlier observations: game.dll's no-access pages fell from 3,421 at 21:42 to 2,693 at 21:48 on 2026-10-23, and helldivers2.exe's Quaternion and Matrix4x4 code pages were unreadable until the game first executed them (see [game-dll recovery](../../../game-dll/artifacts/recovery/README.md)). The `.pdata`-sized buffers are probably decrypted exception tables. None of this is decoded from runtime.dll's code; it rests on the mapping layout and its change over time.

## Evidence

`tools/capture/runtime_maps_snapshot.py` reads `/proc/<pid>/maps` and the module headers on disk and writes the snapshot JSON. It does not use LLtM.

```sh
python3 -I /home/goose/Documents/ChatGPT/GooseGadgets/relay-tools/runtime_maps_snapshot.py
```

## Limits

- One snapshot. Counts change as the game runs.
- Whether the read-write view holds plaintext for pages still no-access in the running view is unknown. Reading it is a read-only live step, not yet authorised or done.
- The Windows path (image sections from `NtCreateSection`) may not use this layout at all.
