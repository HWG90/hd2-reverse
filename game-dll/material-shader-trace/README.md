# Material and shader reference trace

Build `0x6AD7C05D`; merged image SHA256 `bcad43f462e452407d7ac41ae4d7bf17810802720f6aea325afd1d99b1e8ce00`; coverage 10,942 / 13,186 pages. Addresses are RVAs. Static analysis only; no live changes or engine calls were made. Analyst descriptions below are not original symbols.

## Findings

| Path | Evidence | Interpretation / limit |
|---|---|---|
| Wind shader settings | `0xEC26F0` entry candidate, name reference `0xEC29E1`, engine callback loop `0xEC2A60–0xEC2A92` | Concrete named-parameter submission path with 12 entries. Strong lead for wind rendering controls; not shader compilation or GPU bytecode. |
| Material variables | Apply helper `0x9E9360`, propagation helper `0x9E9660` | Dispatches scalar and vector-like payloads to engine callbacks according to a type field. Strong lead for material parameter manipulation; engine callback implementations are not resolved here. |
| Material swap | Apply helper `0x9EB540`, callback `0x9EB59E` | Searches an 8-by-8 table of entries and submits matching replacement handles through an engine interface. Replacement semantics are inferred from the component neighborhood. |
| BrushShader / ShaderEffect | `0x19C4940`, `0x1A2E270` | Lazy cached type registration through shared helper `0x1969400`. Property construction/binding evidence supports a UI/reflection interpretation. No low-level GPU shader implementation established. |

All 10 extracted ranges match the older research image exactly. These are new interpretations and connected references, not newly decrypted shader code.

## 1. Wind parameter submission

The only scanned RIP-relative MOV/LEA reference to `wind_shader_settings` is at `0xEC29E1`, inside candidate function `0xEC26F0–0xEC2ABE`.

The function obtains identifiers for the following names through an indirect engine call. It assembles 12 descriptors, resolves `wind_shader_settings`, obtains a matching object through further callbacks, and invokes a callback once per descriptor. If the object lookup returns zero, the submission loop is skipped.

| Name | Observed source field relative to the input object |
|---|---|
| frequency | `+0x3D08` float load |
| amplitude | `+0x3D0C` float load |
| octaves | `+0x3D18` integer converted to float |
| lacunarity | `+0x3D10` float load |
| persistence | `+0x3D14` float load |
| ridged_octaves | `+0x3D1C` integer converted to float |
| inverted_ridges | `+0x3D20` byte converted to float |
| min_intensity | `+0x3D24` float load |
| max_intensity | `+0x3D28` float load |
| wind_direction | address of `+0x3D38` |
| wind_offset | address of `+0x3D40` |
| camera_local_wind_offset | address of `+0x3D50` |

The shared engine-interface global is resolved by RIP-relative instructions to `0x2CE14C8`; the wind path accesses an interface at its `+0xC0`. Interfaces returned through callbacks at `+0x48` and `+0x50` participate in descriptor submission/object lookup. Exact API names, parameter lifetimes, vector dimensions and callable signatures are unverified.

A direct caller at `0xAD3497` invokes `0xEC26F0`. Immediately preceding it, code updates fields `+0x3D48/+0x3D4C` and accumulates into `+0x3D50/+0x3D54`. This connects the submission to a changing wind-offset state rather than a registration-only string. The caller is a site in a larger function, not a recovered function entry. The listing begins at an inspected instruction boundary; it does not establish every register argument's provenance.

## 2. Material variable application

The `MaterialVariablesComponent` reference at `0x9EADF4` is in a growth/allocation path, not a setter. Tracing its neighborhood identifies helper `0x9E9360`:

- It checks a unit-like identifier through engine interface `+0x18`, callback `+0x1A8`, then obtains a material-like object through callback `+0x1B8`.
- Input record `+0` is passed as a parameter identifier; `+4` selects a named/sub-material path when nonzero; `+8` selects a payload type; payload begins at `+0xC`.
- Type 0 loads a scalar float and invokes `[engine+0x28]+0` at `0x9E94E2`.
- Type 1 assembles two floats and invokes callback `+8` at `0x9E94C4`.
- Type 2 assembles three floats and invokes callback `+0x10` at `0x9E9486`.
- Type 3 passes the address of the payload to callback `+0x18` at `0x9E9447`; a four-component value is plausible but not proven by that pointer alone.
- A second branch handles the zero selector. The complete helper listing is included; the compact description does not assign official API names.

`0x9E9660` obtains the identifier from a descriptor at manager `+0x30`, calls the apply helper, and, when record byte `+0xEC` is enabled, enumerates related identifiers and applies to eligible ones via the same helper (`0x9E9760`). Whether those identifiers represent attachments, children or another relationship remains unresolved.

This is evidence for material parameter dispatch and propagation. It does not show a D3D constant-buffer upload or recover a shader parameter name dictionary.

## 3. Material replacement

`MaterialSwapComponent` is referenced at `0x9EBFE4` in another growth prefix. The call at `0x9EBFFE` leads to `0x9EC0C0`, which lies beyond the covered prefix in an unknown page. That edge cannot be followed from the merged image; zero-filled holes are not decoded in the evidence extractor.

Separately, the readable component neighborhood contains `0x9EB540`. It runs 8 outer groups of stride `0x88`, each with 8 entries of stride `0x10`. A matching 32-bit selector triggers the engine `+0x18` interface callback `+0x180`, with an identifier, the group's first word, a qword from the matched entry and zero in `R9D`. This is a material replacement/application candidate. The GPU object behind the handle is unknown.

## 4. Generic shader names

`0x19C4940` lazily registers `BrushShader`, passing callbacks `0x19C4A30` and `0x19C4AD0` to `0x1969400`, and caches the returned pointer. `0x1A2E270` does the same for `ShaderEffect`, with callbacks `0x1A2E330` and `0x1A2E3D0`.

The `Shader` reference at `0x199195D` participates in allocating/initializing a property-like object, obtaining the BrushShader type and binding it through `0x19D60B0`. Other `Shader` references call the same type accessor and property lookup/binding helpers. This supports a UI/reflection/property path; the specific UI framework is not identified here. The `BrushShaderProxy`/`ShaderEffectProxy` strings have no match in the scoped RIP-relative scan; other reference forms remain possible.

No shader loader/compiler, bytecode parser, D3D pipeline-state creation or GPU resource binding was established. Indirect engine interfaces are the present boundary of the trace.

## Evidence and reproduction

`string-references.json` contains 13 anchor candidates from a readable-page RIP-relative MOV/LEA byte-pattern scan. `evidence/*.asm` contains coverage-checked ranges, and `evidence/evidence.json` records hashes, provenance, direct edges, RIP references and prior-image comparisons. No unknown page is emitted as code. The material-swap growth prefix ends at the page boundary after the call instruction.

Run with Python and Capstone 5.x:

```sh
python3 trace.py ../recovery/6ad7c05d-6ffff0870000/game-merged.bin.gz ../recovery/6ad7c05d-6ffff0870000/coverage.json --output evidence
```

Use optional `--prior /path/to/older-mapped-image` to reproduce the prior-image comparison fields. Function boundaries are inferred from prologues, returns and call targets because usable unwind information is missing. E8 byte scans are caller candidates, not a complete call graph; indirect edges remain unresolved. Field offsets are relative to the specific observed object, not absolute addresses or safe live-write instructions.
