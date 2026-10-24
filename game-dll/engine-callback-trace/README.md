# Engine callback resolution and material command setters

## Result

A read-only live trace resolved the engine callbacks referenced by the previous material analysis into **helldivers2.exe**. Four concrete setters enqueue 1-, 2-, 3- and 4-float material parameter commands. **No GPU shader-binding routine has been identified.** The queue consumer and graphics backend remain unresolved; these setters must not be described as direct GPU bindings.

Observed process: PID 558936, local capture times 00:51:15 and subsequent batches recorded in the logs. Live executable header: timestamp `0x6AD78C0D`, image size `0x29FE000`, base `0x140000000`. The game.dll build is separately `0x6AD7C05D`. Every RVA in this report is an **EXE RVA**, unless explicitly labelled game.dll. Absolute addresses and object/table pointers are session-specific witnesses.

## Resolving the interface

The game.dll global at RVA `0x2CE14C8` contains observed VA `0x142870240`, which is inside the executable, not game.dll. Reading the interface table live gives:

| Engine interface | Slot | EXE target RVA | Meaning supported by the code |
|---|---|---|---|
| `+0x28` | `+0x00` | stub `0x2DE660` -> `0x503C00` | scalar float material parameter command |
| `+0x28` | `+0x08` | stub `0x2DE670` -> `0x503DB0` | 2-float material parameter command |
| `+0x28` | `+0x10` | stub `0x2DE680` -> `0x503E80` | 3-float material parameter command |
| `+0x28` | `+0x18` | stub `0x2DE690` -> `0x503F60` | 4-float material parameter command |
| `+0x18` | `+0x180` | `0x1F50E0` | material-replacement wrapper candidate; resolves a unit-like handle via `0xA06B0`, forwards through object vtable `+0x200` |
| `+0x18` | `+0x1A8` | `0x1F6B70` | handle-resolution wrapper, tail dispatches through object vtable `+0xF8` |
| `+0x18` | `+0x1B8` | `0x1F6BC0` | resolves object and dispatches through vtable `+0x108` after a `+0xF8` call |
| `+0xE8` | `+0x10` | `0x313780` | searches IDs at object `+0x60`, count `+0x58`; returns index or -1 |
| `+0xE8` | `+0x18` | `0x3137B0` | returns a pointer from object `+0x20`, indexed by the supplied index |

The last two observations support interpreting the game.dll `+4` record field as a material selector, but original API names and ownership contracts are not recovered.

## Concrete setter behavior

All four setters validate an object pointer at input `+8` and reject object ID `+4 == 0xFFFFFF`. They obtain a queue-like object through `[input+8] -> dereference -> +0x98`, allocate via its allocator object's vtable `+0x30`, construct a linked command record, publish it using `xchg [queue+8]`, and link the preceding node to it. This establishes a deferred command path, not an immediate graphics call. The full concurrency protocol and consumer are not reconstructed.

| EXE RVA | Stored record size | Header word at record `+0xC` | Value copy |
|---|---|---|---|
| `0x503C00` | `0x20` | 3 | `XMM2` scalar copied to payload `+0xC` |
| `0x503DB0` | `0x24` | 5 | qword copied from supplied pointer to payload `+0xC` |
| `0x503E80` | `0x28` | 6 | qword plus dword copied to payload `+0xC` and `+0x14` |
| `0x503F60` | `0x2C` | 7 | 16 bytes copied to payload `+0xC` |

The aligned payload is located using the record's `+0xE` word. All four write payload `+0 = 7`, object ID at `+4`, parameter identifier at `+8`, and value at `+0xC`. Header words 3/5/6/7 are observed tags; their official enum names are unknown. The four-float copy now confirms the fourth payload's size, which was only a pointer-based inference in the previous report.

## Wind interface boundary

The engine `+0xC0` interface is heterogeneous. Some slots contain data-table addresses, not functions. Specifically the observed slot `+0` points to EXE RVA `0x2870F10`, and slot `+0x48` to `0x2873FA0`; neither is emitted as code by the extractor.

Its slot `+0x28` points to stub `0x2DF810`, which jumps to `0x669450`. The latter scans a string, processes dot-separated parts and combines values using multiplier `0x5BD1E995`. This supports interpreting that call as identifier hashing, not a shader compiler. Slot `+8` points to `0x2DF510` and accesses a registry through helper `0x2E0110`. This does not yet resolve all dynamically returned interfaces used in the wind submission loop.

## Limits and next trace boundary

- Material replacement wrappers reach instance-dependent vtables; those per-object targets were not resolved in this pass.
- No queue consumer, D3D/Vulkan shader bind, constant-buffer upload, pipeline-state selection or shader compilation function was established.
- The on-disk executable has the same observed header timestamp/size, but its sampled code bytes differ from the live witnesses. Static decoding of the disk file at these RVAs is therefore not accepted as evidence for the live functions. No protection mechanism is inferred solely from that difference.
- No callback was invoked by this analysis. Only existing table values, function bytes and a module header were read through the locking LLtM driver while idle. No memory protections were changed and no gameplay writes/hooks were made.
- No public callable API or safe invocation signature is claimed. Runtime parameter changes and visual outcomes remain untested.

## Evidence

The `*-live.log` files preserve raw read receipts, including 1–2 KiB code witnesses and some data tables. Raw chunks can overlap neighboring functions; they are not all code. `extract.py` emits only explicitly bounded code ranges, with hashes and header metadata in `evidence/manifest.json`; data tables/header witnesses are not disassembled.

Requires Capstone 5.x:

```sh
python3 extract.py engine-callback-live.log engine-setters-live.log engine-header-live.log --output evidence
```

Names describe observed behavior and are analyst-assigned. No original symbols or complete engine decompilation are claimed.
