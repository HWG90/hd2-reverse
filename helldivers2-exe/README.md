# helldivers2.exe

The game executable. Protected by runtime.dll: imports preloader.dll ordinal 1 and runs from a view whose undecrypted pages are no-access.

| Directory | Contents |
|---|---|
| [artifacts/live-captures](artifacts/live-captures/README.md) | Live whole-image captures, page reports and manifests |
| [tools/capture](tools/capture/) | `pack.py` (GooseGadgets capture → artifacts) and `rebuild.py` (artifacts → full images) |

No analysis yet. Captures only; see the [repository README](../README.md) for the other modules.
