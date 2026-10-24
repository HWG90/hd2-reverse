# Newly recovered code in the cumulative game.dll image

Baseline: the previously analyzed 21:48 live dump. Cumulative coverage at analysis: 10,685 / 13,186 pages, 2,501 unknown. The merge added 192 pages (768 KiB), all in .text. Of these, 138 match the older Linux HD2 research dump exactly; 54 (216 KiB) differ and expose newly usable code.

Compared with the older research image, those 54 pages have mean entropy 7.956 -> 6.136 bits/byte and undecodable bytes 11,918 -> 99. Their old bytes look encoded/random and their new bytes contain coherent instruction sequences and references into known strings. Decryption/on-demand activation is an inference from that evidence, not a recovered protection algorithm.

## Concrete findings

| Area | Evidence RVA | Observed code | Practical use / limitation |
|---|---|---|---|
| Eagle component | 0x8B92C0 entry candidate; string reference 0x8B92F5 | References EagleComponent, updates a count at object+0x10, reallocates pointer storage at +0x48 | Component management / layout lead. Does not establish a cooldown field or safe callable signature. |
| Eagle diagnostics | 0x8B98B0 entry candidate; reference 0x8B98BD | Emits the existing format string `"eagle" : { "max" : %u, "capacity" : 32 }` using a value from object+0x18 | Cross-check for Eagle component inventory/capacity interpretation. Not a validated gameplay setting. |
| Ragdoll publication | 0xA92E7E, 0xA92E99, 0xA92EC8, 0xA92F4C | Passes named values avatar_ragdoll_active, physics_impact_force, avatar_stance and avatar_airtime through engine API calls | Useful for tracing animation/physics/script communication and camera/movement integrations. These labels are publication names, not recovered memory-field offsets. |
| Horizontal acceleration | 0x9C8FEF | Computes a magnitude, clamps against limits, then passes horizontal_acceleration through a function pointer | Movement/animation value-production lead; not evidence for a directly writable acceleration setting. |

The referenced strings already existed in readable data. The new information is readable implementation code and instruction-level references to them.

No extraction-countdown field, Hover Pack spawn/package-loader implementation, original function names, or exception metadata was recovered by this pass. Function entry candidates above are inferred from instruction prologues/neighboring return boundaries; no unwind metadata validates them.

## Files

- new-to-research.asm: disassembly of the 54 genuinely new pages.
- new-to-research.asm.gz: compressed copy.
- new-code-details.json: exact page RVAs, entropy and string references.
- inspect_merged.py: reproducible comparison against the older research capture.

The merged image contains first-readable pages captured at different times and is not a coherent runtime snapshot. Do not use its captured data-section pointers as current live pointers. Remaining unknown pages are zero-filled and tracked by coverage.json.
