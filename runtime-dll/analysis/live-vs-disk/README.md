# Live runtime.dll vs the file on disk

## Result

The [live capture](../../artifacts/capture/README.md) was compared page by page with `bin/runtime.dll` laid out as a mapped image, relocated with its own `.reloc` table to `0x700000000000` and with OptionalHeader.ImageBase set to that base, as preloader's Wine path does. **15,694 of 15,702 pages are byte-identical.** All code sections, the high-entropy `packer0`/`packer1` data and the encrypted-looking resources are unchanged in place. runtime.dll does not rewrite its own code or decrypt those sections where they sit; where any decrypted data goes is unknown.

Eight pages differ:

| RVA | Section | Changed bytes | Live protection | What changed |
|---|---|---|---|---|
| `0x4000` | `.rwx` | 122 | `PAGE_EXECUTE_READ` | zero on disk; now 10 system-call stubs and 2 prologue trampolines (below) |
| `0x5FD000` | `packer2` | 153 | `PAGE_READWRITE` | 50 qwords; 4 point into runtime.dll |
| `0x600000` | `packer2` | 8 | `PAGE_READWRITE` | 3 short runs at `0x600C60`-`0x600C72` |
| `0x603000` | `packer2` | 1,403 | `PAGE_READONLY` | 302 qwords; only 22 look like user-space pointers (20 into `0x6FFF…`). The section is read-write, so this page was re-protected after loading |
| `0x604000` | `packer2` | 3,803 | `PAGE_READWRITE` | zero on disk; entropy 7.74 live |
| `0x605000` | `packer2` | 4,083 | `PAGE_READWRITE` | zero on disk; entropy 7.96 live |
| `0x606000` | `packer2` | 741 | `PAGE_READWRITE` | four runs from zero; entropy 2.07 |
| `0x616000` | `packer2` | 181 | `PAGE_READWRITE` | 71 scattered qwords |

About 7.9 KB of high-entropy data at `0x604000`-`0x605FFF` is generated at runtime. Whether it is key material, a decrypted table or random state is not determined.

## The .rwx page (decoded)

On disk `.rwx` (characteristics `0xE0000060`: code, execute, read, write) is one page of zeros. Live it holds 156 bytes (`0x0`-`0x9C`) and is mapped execute-read:

| Offset | Bytes | Decoded |
|---|---|---|
| ten stubs | `4c 8b d1 b8 NN 00 00 00 e9 …` | `mov r10, rcx; mov eax, NN; jmp target` with NN = `0xCF`, `0xD0`, `0x2C`, `0x50`, `0x43`, `0x75`, `0x1C`, `0x4E`, `0x85`, `0x19` |
| `0x34` | `48 8d a4 24 00 00 00 00 e9 …` | `lea rsp, [rsp+0]; jmp 0x6FFFFFF2E288` |
| `0x41` | `55 57 56 53 48 83 ec 28 e9 …` | `push rbp/rdi/rsi/rbx; sub rsp, 0x28; jmp 0x6FFFFFF2E198` |

`mov r10, rcx; mov eax, N` is the first 8 bytes of a Windows x64 ntdll system-call stub. Every one of the ten jump targets is 8 bytes past a 0x20-aligned slot (`0x…408`, `0x…428`, `0x…FA8`, …), which is where execution would continue inside a 0x20-byte ntdll-style stub after those same 8 bytes. The two other entries are 8-byte function prologues followed by a jump to the next instruction of the original function. All 12 targets lie in one module 0xD0000-0xE1000 bytes below runtime.dll's base.

**Interpretation:** these are detour trampolines. Each carries the original first bytes of a system-call stub or function and continues in the original. That is consistent with runtime.dll hooking 10 system-call stubs and 2 functions in that module (likely Wine's ntdll.dll), or calling them while bypassing other hooks. Which of the two, and which module, needs a live read of the targets. The syscall numbers are specific to the Wine build and are not named here.

## Evidence

| File | Produced by |
|---|---|
| [`triage/dump-comparison.json`](../../triage/dump-comparison.json) | `compare_runtime.py` (page classes by section; entropy, changed bytes and new strings per differing page) |
| `evidence/differing-pages.json` | `extract.py` (every changed byte run per page; live and expected bytes for runs up to 64 bytes) |
| `evidence/rwx-stubs.asm` | `extract.py` (GNU objdump of the live `.rwx` span at its live VA, with jump targets) |

```sh
python3 -I compare_runtime.py --self-test
python3 -I extract.py   # reads the capture archive and bin/runtime.dll
```

`compare_runtime.py` is the original script and writes to GooseGadgets by default; pass `--out` to redirect it. Requires `pefile` and GNU objdump.

## Limits and next live steps

- One capture, one session. The differing packer2 pages are state and may differ every run.
- The module below runtime.dll is not attributed. The maps snapshot recorded only runtime.dll and the protected modules.
- Whether the 12 original sites are patched is unknown. Next live step (read-only): a full `/proc/<pid>/maps` snapshot to attribute `0x6FFFFFF1E000`-`0x6FFFFFF2F000`, then read the 8 bytes before each jump target.
- An anonymous 3 MB `r-x` region at `0x70000A790000` (seen at 22:48 in [`triage/live-regions-20261024T2248.json`](../../triage/live-regions-20261024T2248.json)) has no owner yet.
