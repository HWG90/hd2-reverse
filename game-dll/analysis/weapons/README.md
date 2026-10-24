# Weapon firing, reload and ammunition trace

Static analysis of build `0x6AD7C05D`, image SHA256 `bcad43f462e452407d7ac41ae4d7bf17810802720f6aea325afd1d99b1e8ce00`. All addresses below are RVAs. Snapshot coverage: 10,942 / 13,186 pages. Every extracted range is fully covered. No live calls, hooks, patches, memory writes or protection changes were performed.

## Result

We can now identify a shared **shot/ammo-consumption candidate**, a **reload commit candidate**, and concrete **loaded-round setters**. These are analyst-assigned descriptions, not recovered symbols. Instruction/data-flow observations below are directly supported by the listings; gameplay interpretation remains static evidence and has not been confirmed by observing a shot or reload at runtime. Full trigger processing, projectile creation and reload animation orchestration are not yet mapped.

| RVA | Proposed role | Confidence and evidence |
|---|---|---|
| `0x74FBF0` | Shared post-fire ammunition consumption / notification | Strong static candidate: called from projectile-family code at `0x61DC9D`, beam-family code at `0x84CAAB`, and ability-family code at `0x7E227B`; resolves weapon entity, branches on weapon-mask bits, updates ammunition bookkeeping, writes loaded rounds via `0x7798C0`, then emits an event. It is not the complete fire/trigger routine. |
| `0x782000` | Reload commit / ammunition transfer | Strong static candidate: fills magazine/per-round internal state from configuration, calls the loaded-count dispatcher `0x74D810`, decrements reserve records, publishes changed values and invokes reload-component processing. Exact reload stage/caller contract remains unverified. |
| `0x74D810` | Loaded ammunition setter dispatch | High confidence in static behavior: bit 9 tail-jumps to `0x770290` (numeric conversion first), bit 7 to `0x7798C0`, bit 8 to `0x785E60`. No claim that all weapon families use this path. |
| `0x7798C0` | Magazine loaded-round setter | Directly demonstrated: resolves entity using manager global `0x2CE17F8`; writes supplied `R8D` to `[manager+0x50] + index*12 + 4`, then publishes with identifier `0xD7A5D63E`. |
| `0x7796A0` | Magazine loaded-round fill/adjust | Directly demonstrated: positive input is added to loaded rounds; otherwise obtains a configured amount and then writes loaded rounds. It is not a firing routine. |
| `0x779F60` | Magazine reload-needed/allowed predicate | Candidate: compares loaded count plus a chamber-related adjustment against a configured or supplied target; returns a boolean. Exact predicate name is unverified. |

## Trace from the original strings

The `WeaponComponent`, `WeaponMagazineComponent`, `WeaponReloadComponent` and `WeaponRoundsComponent` string references lead to growth/allocation routines (`0x752190`, `0x77B0E0`, `0x783BA0`, `0x787CD0`). They allocate/copy/zero storage; they do not fire or reload weapons. Their neighborhoods and independent manager references distinguish the operational paths above from these false leads. The diagnostic `WeaponComponent::ammo_allows_firing...` string has no match in this pass's RIP-relative MOV/LEA scan; that does not prove no reference exists.

Global manager anchors were independently checked against the existing ammo layout witnesses:

- Magazine: global `0x2CE17F8`; entity hashmap at manager `+0x20`, records pointer `+0x50`, 12-byte row, reserve count `+0`, loaded count `+4`, state byte `+8`.
- Individual rounds: global `0x2CE1EB0`; hashmap `+0x28`, records pointer `+0x58`, 20-byte row. Additional internal arrays exist and must not be confused with the public counter row.
- Reload manager: RIP-relative load at `0x78201B` resolves to global `0x2CE1C30`.
- Weapon manager: RIP-relative load at `0x74FC0A` resolves to global `0x2CE1810`.

## Shared consumption details

`0x74FBF0` resolves the entity and indexes a 40-byte weapon row. At `0x74FC91` it tests bit 7; if clear, `0x74FDF6` tests bit 8.

Magazine branch:

1. Loads magazine manager at `0x74FCAC` and resolves the same entity.
2. Uses a **separate 16-byte internal row** at manager `+0x48`. Its first word is decremented at `0x74FD7C`, conditionally bypassed for one configuration/state combination. This is not the reserve counter at manager `+0x50`.
3. Computes a value stored at internal row `+8`, passes the internal row's first word as `R8D`, and calls loaded-round setter `0x7798C0` at `0x74FDE3`.
4. Updates a state byte and publishes events. Meaning of configuration byte `+0x9C` and internal fields is inferred from behavior; chamber semantics are not fully established.

Individual-round branch:

- Manager `+0x50` supplies 24-byte internal rows; manager `+0x58` supplies 20-byte counter rows.
- Counter row `+4` selects an internal slot. `0x74FF4A` decrements `[internal_row + selected_slot*4 + 4]`, conditionally bypassed by the preceding configuration/state tests.
- This is concrete ammunition bookkeeping, but it is not a single universal `loaded--` instruction for every weapon type.

Observed direct callers pass the weapon entity in `EDX`. Several functions fetch a global internally, and register liveness/side effects have not been audited sufficiently to publish a safe callable signature.

## Reload commit details

Within `0x782000`:

- `0x782231` stores a configured magazine amount into the internal magazine row at manager `+0x48`, with a preceding chamber-related conditional adjustment.
- `0x78237E` fills the selected individual-round internal slot.
- `0x7823B6` calls `0x74D810`, dispatching the resulting loaded count.
- `0x782B41` decrements the magazine **reserve count** at `[magazine_manager+0x50] + index*12`, then publishes with identifier `0xEC64918B` at `0x782B61`.
- `0x782BFA` writes an individual-round reserve value after subtracting configuration field `+0x5C`; it publishes with identifier `0x9A34C336` at `0x782C15`.
- `0x782AD1` also decrements a 12-byte row in a different manager. That manager's role is not established here; it is deliberately not labelled magazine ammo.

These establish reserve consumption and loaded-state transfer in the reload-family region. Exact animation/event timing and cancellation behavior still require observation.

## What is new

All 12 extracted ranges match the older research image byte-for-byte. New recovery made some references easier to discover (the projectile callsite page first appears in cumulative capture source 6), but this work's primary contribution is **new interpretation and a connected static call/data-flow map**, not newly decrypted routines. The unavailable original capture paths in coverage are historical provenance; this repository contains the merged image.

## Evidence and reproduction

`evidence/*.asm` contains the exact ranges; `evidence/evidence.json` records their hashes, page provenance, direct edges and RIP-relative references. `component-string-references.json` records string anchors. `trace.py` requires Python and Capstone 5.x:

```sh
python3 trace.py ../../artifacts/recovery/6ad7c05d-6ffff0870000/game-merged.bin.gz ../../artifacts/recovery/6ad7c05d-6ffff0870000/coverage.json --output evidence
```

The E8 caller scan is a byte-pattern candidate scan, not a complete call graph. The three consumption callers shown above were inspected in local instruction context; indirect callers and tail edges require separate handling. Linear listing boundaries may include embedded data; function entries are inferred from prologues/returns and direct-call targets because usable unwind metadata remains absent. No complete decompilation, original symbols, universal ammo routine, or live behavior validation is claimed.
