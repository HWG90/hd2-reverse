# Investigation workflow

Same workflow as [game-dll](../../game-dll/reports/workflow.md): immutable captures and hashes in `artifacts/`, fingerprints in `triage/`, one hypothesis per `analysis/<case>/` with its evidence and scripts, conclusions in each case README, SHA256SUMS refreshed after changes.

Specific to runtime.dll:

1. runtime.dll has no loader entry. Take its base from `/proc/<pid>/maps` and confirm the header (MZ/PE, timestamp `0xFDE6C135`, SizeOfImage `0x3D56000`) before any read.
2. Live reads go through LLtM's `read` under the shared driver lock, only when the game is running and the work is authorised. No writes, protection changes or game-function calls.
3. Compare against `bin/runtime.dll` mapped and relocated to the live base, never against raw file offsets.
4. Linux-side `/proc` reads (maps snapshots) need no LLtM access but still record PID and time.

## Current hypotheses

- Decoded: preloader.dll's exports are `ud2` stubs redirected by an unwind-info exception handler.
- Live: under Wine, runtime.dll is manually mapped (`MEM_PRIVATE`, no loader entry) at `0x700000000000`; a full capture matches the relocated disk file except 8 pages.
- Decoded live bytes: runtime.dll writes 10 system-call stubs and 2 prologue trampolines into `.rwx`, all jumping into one module below it.
- Strong interpretation: protected modules run from a shared object mapped twice; no-access pages in the running view are not yet decrypted.
- Open: which module the `.rwx` jumps target, and whether its original sites are patched (hooks).
- Open: what the runtime-generated high-entropy data at `packer2` `0x604000`-`0x605FFF` is.
- Open: runtime entry behaviour (code `0x25665CD7`), the encrypted `RCDATA 10100-10153` payloads, use of the 488 root certificates, the 3 MB `r-x` region at `0x70000A790000`.
- Open: whether the read-write views expose plaintext for pages still no-access.

## Next live steps (read-only, when authorised)

1. Full `/proc/<pid>/maps` snapshot to attribute `0x6FFFFFF1E000`-`0x6FFFFFF2F000` and `0x70000A790000`.
2. Read the 8 bytes before each `.rwx` jump target and compare with the trampoline copies.
3. Sample read-write-view pages whose running-view page is `---s`.
