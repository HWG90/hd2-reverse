# preloader.dll: entry redirection and runtime.dll mapping

## Result

`helldivers2.exe`, `data/game/game.dll`, `bin/plugins/wwise_pluginw64_release.dll` and `bin/plugins/level_generation_pluginw64_release.dll` each import `preloader.dll` ordinal 1 (read from their import tables). preloader.dll's exported entry points are **`ud2` traps**; an exception handler redirects them to the real code. Under Wine, preloader **maps runtime.dll itself** from `<bin>\runtime.dll` into private memory, so runtime.dll never gets a loader entry. That is why LLtM's `module runtime.dll` reports "not loaded" while the image is present at `0x700000000000`.

preloader.dll: 46,168 bytes, sha256 `2e416e65…dc257`, timestamp `0xA0CF546E`, preferred base `0x180000000`. RVAs below are preloader RVAs unless labelled.

## Entry redirection (decoded)

| Item | RVA | Decoded |
|---|---|---|
| AddressOfEntryPoint (DllMain) | `0xB030` | `ud2` in section `.entry` |
| Export ordinal 1 | `0xB010` | `ud2` in section `.entry` |
| Unwind info of both stubs | | `UNW_FLAG_EHANDLER`, handler RVA `0x2040`; handler data `0x2000` (DllMain stub) and `0x37E0` (export stub) |
| Handler | `0x2040` | `rax = *(u32*)DispatcherContext->HandlerData + DispatcherContext->ImageBase`; stores it to `ContextRecord->Rip` (`+0xF8`); returns 0 (`ExceptionContinueExecution`) |
| Real DllMain | `0x2000` | calls `0x2390`; then `r9 = 0xA048` (context block), `rax = [0xA078]` (runtime entry pointer), restores the original arguments and `jmp rax` |
| Real export 1 | `0x37E0` | |

So executing either stub raises `STATUS_ILLEGAL_INSTRUCTION`, and the handler resumes at the real target named in the unwind data. This is decoded from bytes and unwind records, not inferred.

## Mapping runtime.dll (static interpretation)

From the research agent's trace of `0x2390` (804 decoded lines in the evidence). Indirect calls were followed through resolved pointers, so this level is interpretation; it was not re-derived line by line here.

- Resolves `ntdll!wine_get_version` with `LdrGetProcedureAddress`; its presence selects the load path.
- **Wine path** (observed outcome): `NtOpenFile(<preloader dir>\runtime.dll)`, read headers (MZ, PE, PE32+ checks), reserve within ±2 GB of preloader at 2 MB alignment, then per section commit RW, `NtReadFile` the raw data and `NtProtectVirtualMemory` from a characteristics table at `0x6798`; apply base relocations (`0x2170`). This matches the live image: `MEM_PRIVATE`, 12 anonymous mappings aligned to the sections, base `0x700000000000` in all three sessions inspected (22:48, 22:52 and 23:10 on 2026-10-24).
- **Windows path** (not observed): `NtCreateSection(SEC_IMAGE, PAGE_EXECUTE)` on runtime.dll and `NtMapViewOfSection` near the module.
- OS checks: version resource, `RtlWow64GetProcessMachines` (x64 vs ARM64), build ≥ 17763.
- Fills a context table (`0xA0D0`-`0xA158`) with `MessageBoxW`, `RegGetValueW`, environment and path helpers, and `Zw*` process, thread, file and system-information calls, then calls the runtime entry with code `0x25665CD7`.
- Reads environment variable `PACKER_CRASH_AT` as a number.

Error strings include refusals for old Windows versions, "Wine, Proton, and Steam Deck are not supported", "Syscall emulation is disabled in this Wine build", "File version mismatch between the preloader and runtime DLLs" and "Conflicting software detected!". The game nevertheless runs under this Proton build; which check that message belongs to is not traced.

## Evidence

`extract.py` reads `bin/preloader.dll`, bounds each function by preloader's own `.pdata`, disassembles it with GNU objdump (Intel syntax) into `evidence/*.asm`, decodes the stubs' unwind handler records, and records input and code hashes plus string offsets in `evidence/manifest.json`. The handler at `0x2040` has no `.pdata` entry, so a fixed `0x40` window is emitted; its function ends at the `ret` at `0x2053`.

```sh
python3 -I extract.py
```

## Limits

- Only the Wine path has a live witness. The Windows path, OS-check order and context-table consumers are static readings.
- The runtime entry and what runtime.dll does with code `0x25665CD7` are not traced.
