# Helldivers 2: address changes, Steam build 26251122 → 26568081

Addresses that mods use and that I re-located after the update. All values are RVAs (offset from the module's load base). Both modules now load at a different base on every launch, so always add the live base.

How to read it:
- **Check = bytes compared:** the code or data at the new address was compared against the old build in memory captures of both.
- **Check = pattern match in game:** a byte pattern found the address in the running game on the new build.
- **Check = predicted:** the page was not in my capture; the address follows from its neighbours. Verify before use.
- This is my own research from memory captures, not an official list. Most rows have not been exercised in game yet. Check the bytes at an address before you call or patch it.
- Names and descriptions are my own, not official symbols. A description says what the code or data at the address is, as far as I worked it out; "(unsure)" marks the ones I could not pin down.
- After the update I re-read 227 of these addresses in the running game: none mismatched.

## Build identity

| | 26251122 | 26568081 |
|---|---|---|
| helldivers2.exe PE timestamp | 0x6AE0964A | 0x6AF2D5E6 |
| game.dll PE timestamp | 0x6AE0E5FF | 0x6AF322C1 |
| helldivers2.exe SizeOfImage | 0x29FE000 | 0x29FE000 |
| game.dll SizeOfImage | 0x3382000 | 0x3382000 |
| helldivers2.exe SHA-256 | | b434f6f326b7759978265f5863ef72e3c5edd4aa5315cc1ef4b640d204eae0bb |
| game.dll SHA-256 | | 08b756f535cdb9bdd1b4953fba53c3dfacd25730a155ea6593e5de63211acf5f |

## What changed in general

- **helldivers2.exe:** code moved almost everywhere, in blocks of +0x30 to +0x2B0 (one block −0x70). The Lua C API (lua_*/luaL_*) moved +0x50.
- **game.dll:** code below about 0x930000 did not move; 0x988000–0xACF000 moved +0x30; most code above 0xE69000 moved +0x160 (a few places +0x170).
- **Data:** almost all game.dll globals stayed. In the exe, the engine's Lua API pointer table stayed at 0x286F710, most engine API sub-tables moved −0x10, and the Steam language table moved 0x16F9E10 → 0x16FA8B0.
- **Struct offsets** I rely on (UI, world, player manager, game state, events, account) are unchanged.
- The stock startup script is unchanged.
- Padding bytes after `ret`/`jmp` are refilled per build, so byte signatures that include padding will not match even where code is the same.

Files:
- [`addresses.tsv`](addresses.tsv): every address, moved or not, with its description.
- [`engine-c-api-tables.tsv`](engine-c-api-tables.tsv): every slot of the engine's C API function tables and of the embedded Lua C API table, old and new function address.
- [`engine-lua-api.tsv`](engine-lua-api.tsv): first-pass map of the engine's Lua-exposed functions (Unit.*, World.*, …). Automatic and **unverified**; "high" rows are reliable in my experience, "medium" rows are candidates.

## Shift blocks

Runs of neighbouring addresses that moved by the same amount. Use them to estimate an address that is not in the list, then check the bytes.

### helldivers2.exe

| Old range | Shift | Addresses seen |
|---|---|---|
| 0x61840 – 0x74ce0 | +0x90 | 4 |
| 0x9f900 – 0xa6f60 | +0x30 | 7 |
| 0x103d1d – 0x1049f3 | +0x50 | 3 |
| 0x12b2a9 – 0x12bf35 | +0x30 | 2 |
| 0x1a9514 – 0x1a9514 | +0xa0 | 1 |
| 0x1ad238 – 0x1c4c30 | +0xb0 | 6 |
| 0x1f11a0 – 0x1fb7a0 | +0xc0 | 23 |
| 0x259fe0 – 0x287c70 | +0x90 | 4 |
| 0x28d310 – 0x2df780 | +0xb0 | 23 |
| 0x2e7740 – 0x2f0860 | +0xa0 | 9 |
| 0x3046a0 – 0x316af0 | +0xb0 | 11 |
| 0x3c0fe4 – 0x4d8282 | +0xe0 | 125 |
| 0x4ec360 – 0x523310 | +0xd0 | 34 |
| 0x55be6e – 0x565109 | +0xa0 | 11 |
| 0x56696d – 0x566dea | +0x90 | 5 |
| 0x566e49 – 0x566ef5 | +0x8f | 2 |
| 0x56ad9e – 0x56d819 | +0x90 | 2 |
| 0x5adf31 – 0x5ae648 | +0xa0 | 2 |
| 0x5eb2b0 – 0x5eb4d6 | +0x90 | 10 |
| 0x5f21f9 – 0x635b43 | +0xa0 | 19 |
| 0x638490 – 0x64d230 | +0xb0 | 9 |
| 0x6693a0 – 0x674100 | +0xe0 | 4 |
| 0x6cd1e0 – 0x6cd90b | -0x70 | 23 |
| 0x6cde10 – 0x6cf010 | +0xc0 | 46 |
| 0x792c00 – 0x7a1130 | +0x50 | 69 |
| 0x7cb790 – 0x7d4a20 | +0x2a0 | 27 |
| 0x7eb510 – 0x7f9490 | +0x2b0 | 102 |
| 0x7fad60 – 0x7fad60 | +0xf0 | 1 |
| 0x805010 – 0x880600 | +0x1a0 | 14 |
| 0x9561b0 – 0x956232 | +0x180 | 2 |
| 0xd65790 – 0x12aee70 | +0x1c0 | 2 |
| 0x148d340 – 0x148d368 | +0x8 | 2 |
| 0x148e7b8 – 0x1549168 | +0x0 | 4 |
| 0x16f48b0 – 0x16f9e10 | +0xaa0 | 3 |
| 0x1714b70 – 0x1714b70 | -0x20 | 1 |
| 0x1715bb8 – 0x1715bb8 | +0x88 | 1 |
| 0x1726a10 – 0x1726a10 | -0x60 | 1 |
| 0x172b360 – 0x172b360 | -0x40 | 1 |
| 0x17430a8 – 0x17430a8 | -0x78 | 1 |
| 0x174d4e0 – 0x174d758 | -0x8 | 3 |
| 0x174dac0 – 0x174dad0 | -0x10 | 2 |
| 0x19b65a0 – 0x1ab77c8 | +0x0 | 3 |
| 0x1ab77e0 – 0x1ab77e0 | +0x20 | 1 |
| 0x1ab7808 – 0x2870810 | +0x0 | 23 |
| 0x2870c00 – 0x2874278 | -0x10 | 36 |
| 0x28746b0 – 0x28746b0 | +0x30 | 1 |
| 0x2874858 – 0x2874858 | -0x18 | 1 |
| 0x2874ed0 – 0x2874ed0 | -0x90 | 1 |
| 0x2875080 – 0x28753b0 | -0x10 | 3 |
| 0x28756d0 – 0x28756d0 | -0x8 | 1 |
| 0x2875ac4 – 0x2875ac4 | +0x4 | 1 |
| 0x2875ac8 – 0x2875ac8 | -0x8 | 1 |

### game.dll

| Old range | Shift | Addresses seen |
|---|---|---|
| 0xbc783 – 0x92f690 | +0x0 | 131 |
| 0x988c20 – 0xacedcc | +0x30 | 48 |
| 0xb467b0 – 0xc12380 | +0x170 | 9 |
| 0xe696b0 – 0x1f8fe10 | +0x160 | 403 |
| 0x1fc7988 – 0x1fcae80 | +0x0 | 2 |
| 0x205d100 – 0x205d100 | +0x2f0 | 1 |
| 0x205d590 – 0x205d590 | +0x350 | 1 |
| 0x2069d70 – 0x206b070 | +0x0 | 3 |
| 0x2070f20 – 0x2247aa0 | +0x10 | 18 |
| 0x24b5010 – 0x31870e0 | +0x0 | 201 |

## Engine C API tables

The exe keeps an array of pointers to function tables at 0x2870240 (unchanged). Every table kept its slot count and order; [`engine-c-api-tables.tsv`](engine-c-api-tables.tsv) lists all 2017 slots with the old and new function address. The embedded Lua C API table (LuaApi, 115 slots) stayed at 0x286F710.

| Table | Old | New | Slots | Body differs | Not captured |
|---|---|---|---|---|---|
| root+0x8 | 0x2872030 | 0x2872020 | 243 | 3 | 12 |
| root+0x10 | 0x2871350 | 0x2871340 | 222 | 8 | 0 |
| root+0x18 | 0x28703e0 | 0x28703e0 | 250 | 1 | 0 |
| root+0x20 | 0x2870d00 | 0x2870cf0 | 37 | 0 | 0 |
| root+0x28 | 0x2870e30 | 0x2870e20 | 32 | 0 | 0 |
| root+0x30 | 0x2872f20 | 0x2872f10 | 38 | 1 | 0 |
| root+0x38 | 0x2873310 | 0x2873300 | 41 | 0 | 0 |
| root+0x40 | 0x2873080 | 0x2873070 | 48 | 0 | 0 |
| root+0x48 | 0x2871ed8 | 0x2871ec8 | 18 | 0 | 4 |
| root+0x50 | 0x2871ce0 | 0x2871cd0 | 49 | 1 | 3 |
| root+0xc8 | 0x2873200 | 0x28731f0 | 13 | 0 | 0 |
| root+0xd0 | 0x2872830 | 0x2872820 | 107 | 0 | 0 |
| root+0xd8 | 0x2872ee0 | 0x2872ed0 | 7 | 0 | 0 |
| root+0xe0 | 0x2871ff0 | 0x2871fe0 | 7 | 0 | 0 |
| root+0xe8 | 0x2872ba0 | 0x2872b90 | 24 | 0 | 0 |
| root+0xf0 | 0x2871aa0 | 0x2871a90 | 72 | 0 | 0 |
| root+0xf8 | 0x28753b0 | 0x28753a0 | 92 | 1 | 0 |
| root+0x100 | 0x2872b88 | 0x2872b78 | 3 | 0 | 0 |
| root+0x108 | 0x286d9d8 | 0x286d9d8 | 351 | 6 | 36 |
| root+0x110 | 0x2872e90 | 0x2872e80 | 10 | 0 | 0 |
| root+0x118 | 0x2873460 | 0x2873450 | 9 | 0 | 0 |
| root+0x120 | 0x2873050 | 0x2873040 | 6 | 0 | 0 |
| root+0x128 | 0x2872c90 | 0x2872c80 | 64 | 2 | 0 |
| root+0x130 | 0x2873270 | 0x2873260 | 20 | 0 | 0 |
| root+0x138 | 0x28711b0 | 0x28711a0 | 17 | 0 | 0 |
| root+0x140 | 0x2871030 | 0x2871020 | 29 | 0 | 0 |
| root+0x168 | 0x2872c60 | 0x2872c50 | 6 | 0 | 0 |
| root+0x170 | 0x2870c00 | 0x2870bf0 | 31 | 0 | 0 |
| root+0x178 | 0x2871120 | 0x2871110 | 14 | 0 | 0 |
| root+0x180 | 0x2871fc8 | 0x2871fb8 | 5 | 0 | 0 |
| root+0x188 | 0x2874180 | 0x2874170 | 8 | 0 | 0 |
| root+0x190 | 0x28741c0 | 0x28741b0 | 23 | 1 | 0 |
| root+0x198 | 0x2874278 | 0x2874268 | 6 | 0 | 0 |
| LuaApi | 0x286f710 | 0x286f710 | 115 | 1 | 12 |

## Struct offsets found unchanged

Not addresses: offsets inside a game object.

| Object | Offset | What |
|---|---|---|
| game state object | 0xac29c | Current game state value (3 = on the ship, 4 = in a mission) |
| world object | 0xf24990 | Hash map from unit to entity |
| world object | 0xf14968 | Pointer to the entity type table |
| HUD chat manager | 0x4f6c00 | Ring holding the last 64 chat lines |
| HUD chat manager | 0x14498 | On-screen chat feed |
| HUD chat manager | 0x24e335 | Chat enabled flag (byte) |

## Moved addresses

1510 unique addresses, 1143 moved. Unchanged ones are only in the TSV.

### helldivers2.exe

| Old | New | Shift | Kind | Check | Name | Description |
|---|---|---|---|---|---|---|
| 0x61840 | 0x618d0 | +0x90 | code | bytes compared |  | Post-update hook called at the end of the game update routine |
| 0x704e0 | 0x70570 | +0x90 | code | bytes compared |  | Float-to-string formatter used by the vector to_string Lua natives |
| 0x7053d | 0x705cd | +0x90 | code | bytes compared |  | End of the vector float-to-string formatter function |
| 0x74ce0 | 0x74d70 | +0x90 | code | bytes compared |  | Profiler statistic recorder (name, float) used by the timed Lua GC |
| 0x9f900 | 0x9f930 | +0x30 | code | bytes compared |  | Lua temporary allocator: reserves bytes in the environment temporary ring |
| 0x9fa65 | 0x9fa95 | +0x30 | code | bytes compared |  | End of the Lua temporary allocator function |
| 0x9fbd0 | 0x9fc00 | +0x30 | code | bytes compared |  | Getter returning the native LuaEnvironment for a lua_State (registry slot 1) |
| 0xa06a0 | 0xa06d0 | +0x30 | code | bytes compared | unit_resolve | Resolves a unit reference to its Unit object through the unit registry |
| 0xa2e40 | 0xa2e70 | +0x30 | code | bytes compared |  | Stingray resource manager API: can_get (is a resource of type and name loaded) |
| 0xa2f00 | 0xa2f30 | +0x30 | code | bytes compared |  | Stingray resource manager API: get (returns a loaded resource by type and name) |
| 0xa6f60 | 0xa6f90 | +0x30 | code | bytes compared |  | Stingray get_engine_api: returns an engine plugin API table by id |
| 0x103d1d | 0x103d6d | +0x50 | code | bytes compared | scene_103d1d | Inside a renderer routine: reads the active texture-cache index (backend +0x490) |
| 0x103d2c | 0x103d7c | +0x50 | code | bytes compared | scene_103d2c | Inside a renderer routine: reads the texture-cache array pointer (backend +0x480) |
| 0x1049f3 | 0x104a43 | +0x50 | code | predicted | lens_1049f3 | Inside a renderer routine: compares against the renderer's world count (+0x1600) |
| 0x12b2a9 | 0x12b2d9 | +0x30 | code | bytes compared |  | Call site passing a unit's animation instance to its World's animation manager |
| 0x12bf35 | 0x12bf65 | +0x30 | code | bytes compared |  | Inside the internal unit animation-event trigger: enqueues a deferred command record |
| 0x1a9514 | 0x1a95b4 | +0xa0 | code | bytes compared |  | Inside scene-graph list insertion used when a unit update is published (unsure) |
| 0x1ad238 | 0x1ad2e8 | +0xb0 | code | bytes compared |  | Inside the World unit-update path: call that rebuilds one unit's scene graph (unsure) |
| 0x1bd7c0 | 0x1bd870 | +0xb0 | code | bytes compared |  | Stingray render buffer API: create_buffer |
| 0x1bdb90 | 0x1bdc40 | +0xb0 | code | bytes compared |  | Stingray render buffer API: update_buffer |
| 0x1bdca0 | 0x1bdd50 | +0xb0 | code | bytes compared |  | Stingray render buffer API: destroy_buffer |
| 0x1be170 | 0x1be220 | +0xb0 | code | bytes compared |  | Stingray render buffer API: returns a buffer's render resource |
| 0x1c4c30 | 0x1c4ce0 | +0xb0 | code | bytes compared |  | Global cleanup routine called by the game destructor before service teardown |
| 0x1f11a0 | 0x1f1260 | +0xc0 | code | bytes compared | unit_box_converter | Box converter that copies a pose and extents into an output box |
| 0x1f2250 | 0x1f2310 | +0xc0 | code | bytes compared |  | Unit C API local position getter (Unit API table slot +0x0) |
| 0x1f226b | 0x1f232b | +0xc0 | code | bytes compared |  | Inside the Unit local position getter: computes the 64-byte node local offset |
| 0x1f2520 | 0x1f25e0 | +0xc0 | code | bytes compared |  | Unit C API local position setter (Unit API table slot +0x38) |
| 0x1f25a0 | 0x1f2660 | +0xc0 | code | bytes compared |  | Unit C API immediate local rotation setter (Unit API table slot +0x40) |
| 0x1f2680 | 0x1f2740 | +0xc0 | code | bytes compared |  | Unit C API local rotation setter (Unit API table slot +0x48) |
| 0x1f2f90 | 0x1f3050 | +0xc0 | code | bytes compared | unit_world_position | Unit C API: returns a pointer to a node's world position |
| 0x1f2fd0 | 0x1f3090 | +0xc0 | code | bytes compared | editor INPUT_PIN len 76 | Unit C API function at table slot +0xB0, 76 bytes long (unsure) |
| 0x1f3020 | 0x1f30e0 | +0xc0 | code | bytes compared | unit_world_pose | Unit C API: returns a pointer to a node's world pose matrix |
| 0x1f43e0 | 0x1f44a0 | +0xc0 | code | bytes compared | unit_node | Unit C API: returns a unit's node index for a name hash |
| 0x1f4cb0 | 0x1f4d70 | +0xc0 | code | bytes compared | unit_alive | Unit C API: tests whether a unit reference is alive |
| 0x1f6ad0 | 0x1f6b90 | +0xc0 | code | bytes compared |  | Returns a unit's mesh count (Lua native Unit.num_meshes) |
| 0x1f6b20 | 0x1f6be0 | +0xc0 | code | bytes compared |  | Returns a unit's mesh by index (Lua native Unit.mesh) |
| 0x1f7510 | 0x1f75d0 | +0xc0 | code | bytes compared |  | Checks whether a unit has an animation event (Lua native Unit.has_animation_event) |
| 0x1f7700 | 0x1f77c0 | +0xc0 | code | bytes compared |  | Triggers an animation event on a unit (Lua native Unit.animation_event) |
| 0x1f7ce0 | 0x1f7da0 | +0xc0 | code | bytes compared | ready_pose_source: animation API slot +0x3d8 state setter | Unit C API animation state setter (Unit API table slot +0x3D8) |
| 0x1f7d48 | 0x1f7e08 | +0xc0 | code | bytes compared |  | Inside the Unit API animation state setter: tail call into the state machine |
| 0x1f82f0 | 0x1f83b0 | +0xc0 | code | bytes compared |  | Native Unit API function that reads an animation curve value |
| 0x1f835e | 0x1f841e | +0xc0 | code | bytes compared |  | Inside the native animation curve getter: curve lookup helper call |
| 0x1f837a | 0x1f843a | +0xc0 | code | bytes compared |  | Inside the native animation curve getter: boolean result and return |
| 0x1fb480 | 0x1fb540 | +0xc0 | code | bytes compared |  | Sets a unit's visibility, queued for the world update (Unit.set_unit_visibility) |
| 0x1fb4b4 | 0x1fb574 | +0xc0 | code | bytes compared |  | Inside a Unit API wrapper: fills a deferred command record of type 0x15 (unsure) |
| 0x1fb7a0 | 0x1fb860 | +0xc0 | code | bytes compared | unit_box | Unit C API: returns a unit's oriented bounding box |
| 0x259fe0 | 0x25a070 | +0x90 | code | bytes compared |  | GUI object release body reached from the GUI API release thunk |
| 0x287830 | 0x2878c0 | +0x90 | code | bytes compared |  | Resize routine for the temporary-pool overflow page array |
| 0x2878b8 | 0x287948 | +0x90 | code | bytes compared |  | End of the temporary-pool overflow array resize function |
| 0x287c70 | 0x287d00 | +0x90 | code | bytes compared |  | Array release helper called by the LuaEnvironment destructor (unsure) |
| 0x28d310 | 0x28d3c0 | +0xb0 | code | bytes compared |  | Unit object vtable method returning its scene graph (object + 0x60) |
| 0x28d330 | 0x28d3e0 | +0xb0 | code | bytes compared | unit_type_f8 | Unit vtable method at +0xF8: returns the unit's scene graph |
| 0x28d440 | 0x28d4f0 | +0xb0 | code | bytes compared | unit_vtable slot 0x1a8 | Unit vtable method at +0x1A8: returns the animation bone component (Unit +0x168) |
| 0x28d460 | 0x28d510 | +0xb0 | code | bytes compared |  | Unit virtual method returning its animation instance (vtable +0x1B0) |
| 0x28d470 | 0x28d520 | +0xb0 | code | bytes compared |  | Unit virtual method returning its animation resource id (vtable +0x1B8) |
| 0x28e650 | 0x28e700 | +0xb0 | code | bytes compared | unit_children | Unit vtable method at +0x1E8: collects the unit's child units |
| 0x28e6b5 | 0x28e765 | +0xb0 | code | predicted | subject_28e6b5 | Inside the Unit children getter: steps to the next sibling (+0x1E0) |
| 0x293550 | 0x293600 | +0xb0 | code | bytes compared | unit_type_c8 | Unit vtable method at +0xC8: the unit's type function |
| 0x2a3530 | 0x2a35e0 | +0xb0 | code | bytes compared |  | Core Lua API registrar, first registrar called by the game boot routine |
| 0x2ad280 | 0x2ad330 | +0xb0 | code | bytes compared | blur vtable +0x28 apply | Camera lens (depth of field) provider vtable method +0x28: applies lens settings |
| 0x2ad490 | 0x2ad540 | +0xb0 | code | bytes compared | lens_getter | Camera lens (depth of field) provider vtable method +0x30: reads lens settings |
| 0x2dcf80 | 0x2dd030 | +0xb0 | code | bytes compared |  | Camera C API near-range getter (Camera API table slot +0x58) |
| 0x2dcfa0 | 0x2dd050 | +0xb0 | code | bytes compared |  | Camera C API near-range setter (Camera API table slot +0x68) |
| 0x2dcfc0 | 0x2dd070 | +0xb0 | code | bytes compared |  | Camera C API vertical FOV getter (Camera API table slot +0x78) |
| 0x2dcfd0 | 0x2dd080 | +0xb0 | code | bytes compared |  | Camera C API vertical FOV setter (Camera API table slot +0x80) |
| 0x2dd4f0 | 0x2dd5a0 | +0xb0 | code | bytes compared |  | Camera C API local position setter (Camera API table slot +0x20) |
| 0x2dda00 | 0x2ddab0 | +0xb0 | code | bytes compared | camera_world_to_screen | Camera C API: projects a world position to screen coordinates |
| 0x2de900 | 0x2de9b0 | +0xb0 | code | bytes compared |  | Jump thunk to the Lua native that sets a material's texture resource |
| 0x2defa0 | 0x2df050 | +0xb0 | code | bytes compared | title_material_getter | Engine material API getter returning the texture resource of a material slot |
| 0x2df600 | 0x2df6b0 | +0xb0 | code | bytes compared |  | Helper packing two 32-bit ids into one 64-bit key (query table slot +0x28) |
| 0x2df690 | 0x2df740 | +0xb0 | code | bytes compared |  | Entity property setter, slot +0x0 of an engine property function table (unsure) |
| 0x2df700 | 0x2df7b0 | +0xb0 | code | bytes compared | blur table getter | Entity property getter, slot +0x8 of the same property function table (unsure) |
| 0x2df780 | 0x2df830 | +0xb0 | code | bytes compared |  | Hash API thunk (slot +0x28) jumping to the string hash function |
| 0x2e7740 | 0x2e77e0 | +0xa0 | code | bytes compared | render.render_world_update | Render-world update function (entry in the application API table) |
| 0x2e7800 | 0x2e78a0 | +0xa0 | code | bytes compared | render.render_world_submit | Render-world submit function (entry in the application API table) |
| 0x2ea520 | 0x2ea5c0 | +0xa0 | code | bytes compared | render.create_render_target | Engine function that creates a render target (width, height, mips, format, name) |
| 0x2ea930 | 0x2ea9d0 | +0xa0 | code | bytes compared |  | Stingray application script API: destroys a script-created image/texture (unsure) |
| 0x2ed540 | 0x2ed5e0 | +0xa0 | code | bytes compared |  | Stingray application script API: registers a created texture under a resource id (unsure) |
| 0x2edca0 | 0x2edd40 | +0xa0 | code | bytes compared | armory.create | Engine function that creates an RGBA texture from width, height and pixels |
| 0x2f01e0 | 0x2f0280 | +0xa0 | code | bytes compared | support_weapons edit_guards (package api +0x2F0) | Stingray application script API: resource package function at table slot +752 (unsure) |
| 0x2f0440 | 0x2f04e0 | +0xa0 | code | bytes compared |  | Stingray application script API: resource package function at table slot +768 (unsure) |
| 0x2f0860 | 0x2f0900 | +0xa0 | code | bytes compared | support_weapons edit_guards (package api +0x328) | Checks whether a resource package has loaded (application API slot +0x328) |
| 0x3046a0 | 0x304750 | +0xb0 | code | bytes compared | render.world_flush | World API flush of pending transform and physics commands |
| 0x311230 | 0x3112e0 | +0xb0 | code | bytes compared |  | GUI API release thunk (slot +0x248) jumping to the release body |
| 0x312b18 | 0x312bc8 | +0xb0 | code | bytes compared |  | Code site reading the resource manager (application root +0x3F8) and probing its map |
| 0x312cb0 | 0x312d60 | +0xb0 | code | bytes compared | atlas_query | Engine GUI API query resolving a texture to its atlas texture and UV rect |
| 0x3136d0 | 0x313780 | +0xb0 | code | bytes compared |  | Returns a mesh's material count (Lua native Mesh.num_materials) |
| 0x313720 | 0x3137d0 | +0xb0 | code | bytes compared |  | Returns a mesh's material by index (Lua native Mesh.material) |
| 0x313730 | 0x3137e0 | +0xb0 | code | bytes compared |  | Mesh script API: commits a mesh's material changes to the renderer |
| 0x316570 | 0x316620 | +0xb0 | code | bytes compared | int_writer | JSON writer: writes an integer value (engine JSON API slot +0xF8) |
| 0x3165b0 | 0x316660 | +0xb0 | code | bytes compared | float_writer | JSON writer: writes a float value (engine JSON API slot +0x100) |
| 0x316950 | 0x316a00 | +0xb0 | code | bytes compared | json_scratch_create | Creates a JSON scratch document from a string |
| 0x316af0 | 0x316ba0 | +0xb0 | code | predicted | json_scratch_destroy | Destroys a JSON scratch document |
| 0x3c0fe4 | 0x3c10c4 | +0xe0 | code | predicted |  | Inside the Lua World.update_unit binding: resolves the unit and calls the update (unsure) |
| 0x3cfeb0 | 0x3cff90 | +0xe0 | code | bytes compared | Application.build | Lua native Application.build implementation |
| 0x3d1820 | 0x3d1900 | +0xe0 | code | bytes compared | Application.update_render_world | Site in the Lua binding that calls the render-world update (unsure) |
| 0x3d3f10 | 0x3d3ff0 | +0xe0 | code | bytes compared | Application.set_render_setting | Sets a renderer setting (Lua native Application.set_render_setting, binding thunk) |
| 0x3d4069 | 0x3d4149 | +0xe0 | code | bytes compared |  | Inside a Lua Application binding: loads the global that holds the renderer |
| 0x3d40ba | 0x3d419a | +0xe0 | code | bytes compared |  | Inside Application.render_setting: loads the render settings table pointer |
| 0x3d412e | 0x3d420e | +0xe0 | code | predicted |  | Inside the render-setting code after Application.set_render_setting: value type 4 check (unsure) |
| 0x3d42f0 | 0x3d43d0 | +0xe0 | code | predicted | scene_3d42f0 | Reads a render setting by name (Lua native Application.render_setting) |
| 0x3da080 | 0x3da160 | +0xe0 | code | predicted | save_render_target | Lua native Application.save_render_target (entry that jumps to its body) |
| 0x3da0a0 | 0x3da180 | +0xe0 | code | bytes compared | render.create_render_target_binding | Body of the Lua native Application.create_render_target |
| 0x3da4f0 | 0x3da5d0 | +0xe0 | code | bytes compared | render.create_render_target_entry | Lua native Application.create_render_target (entry that jumps to its body) |
| 0x3f1b70 | 0x3f1c50 | +0xe0 | code | bytes compared | animation_bone_mode | Reads a unit's animation bone mode (Lua native Unit.animation_bone_mode) |
| 0x3f1bc9 | 0x3f1ca9 | +0xe0 | code | bytes compared |  | Inside Unit.animation_bone_mode: reads the bone mode field (component +0x164) |
| 0x3f1e80 | 0x3f1f60 | +0xe0 | code | bytes compared |  | Site that stores the animation bone mode (component +0x164) for Unit.set_animation_bone_mode |
| 0x3f1e90 | 0x3f1f70 | +0xe0 | code | bytes compared |  | Sets a unit's animation bone mode (Lua native Unit.set_animation_bone_mode) |
| 0x3f26f0 | 0x3f27d0 | +0xe0 | code | bytes compared |  | Inside the Lua Unit.animation_set_state implementation: skips nil state arguments |
| 0x3f282b | 0x3f290b | +0xe0 | code | bytes compared |  | Inside the Lua Unit.animation_set_state implementation: call into the state machine |
| 0x3f2850 | 0x3f2930 | +0xe0 | code | bytes compared | Unit.animation_set_state | Sets a unit's animation states (Lua native Unit.animation_set_state, binding thunk) |
| 0x3f38b0 | 0x3f3990 | +0xe0 | code | bytes compared | Unit.animation_get_curve_value | Lua native Unit.animation_get_curve_value entry thunk |
| 0x3f4b43 | 0x3f4c23 | +0xe0 | code | bytes compared |  | Inside Lua Unit.set_mesh_visibility: maps the visibility context to pass bit 1 or 2 |
| 0x3f4bc0 | 0x3f4ca0 | +0xe0 | code | bytes compared | set_mesh_visibility | Lua native Unit.set_mesh_visibility (entry that jumps to its body) |
| 0x3f9390 | 0x3f9470 | +0xe0 | code | bytes compared | scene_3f9390 | Returns a renderer resource by name (Lua native Renderer.resource) |
| 0x402980 | 0x402a60 | +0xe0 | code | bytes compared | render.camera_set_frustum | Sets a camera's frustum extents (Lua native Camera.set_frustum) |
| 0x402b6f | 0x402c4f | +0xe0 | code | bytes compared | render.camera_set_frustum_at_0x96 | Inside Camera.set_frustum: stores the four frustum extents into the camera |
| 0x419c30 | 0x419d10 | +0xe0 | code | bytes compared |  | Vector2 indexed member lookup helpers (first-character key dispatch) |
| 0x419fb0 | 0x41a090 | +0xe0 | code | bytes compared |  | Start of the code block holding the Vector2 Lua natives |
| 0x41d550 | 0x41d630 | +0xe0 | code | bytes compared | Vector3.length_squared | Lua native Vector3.length_squared implementation |
| 0x41e504 | 0x41e5e4 | +0xe0 | code | bytes compared |  | End of the code block holding the Vector2 Lua natives |
| 0x41f400 | 0x41f4e0 | +0xe0 | code | bytes compared |  | Start of the first code block holding Vector3 Lua natives |
| 0x41fc70 | 0x41fd50 | +0xe0 | code | bytes compared |  | Vector3 __call metamethod implementation (Lua native) |
| 0x41fee0 | 0x41ffc0 | +0xe0 | code | bytes compared | Vector3.equal | Lua native Vector3.equal implementation |
| 0x420540 | 0x420620 | +0xe0 | code | bytes compared |  | Lua native Vector3.to_string implementation |
| 0x420a20 | 0x420b00 | +0xe0 | code | bytes compared | Vector3.add | Lua native Vector3.add implementation |
| 0x420c20 | 0x420d00 | +0xe0 | code | bytes compared | Vector3.subtract | Lua native Vector3.subtract implementation |
| 0x420e40 | 0x420f20 | +0xe0 | code | bytes compared | Vector3.multiply | Lua native Vector3.multiply implementation |
| 0x421080 | 0x421160 | +0xe0 | code | bytes compared | Vector3.divide | Lua native Vector3.divide implementation |
| 0x4212b0 | 0x421390 | +0xe0 | code | bytes compared | Vector3.multiply_elements | Lua native Vector3.multiply_elements implementation |
| 0x4214b0 | 0x421590 | +0xe0 | code | bytes compared | Vector3.divide_elements | Lua native Vector3.divide_elements implementation |
| 0x421780 | 0x421860 | +0xe0 | code | bytes compared | Vector3.zero | Lua native Vector3.zero implementation |
| 0x421930 | 0x421a10 | +0xe0 | code | bytes compared | Vector3.base | Lua native Vector3.base implementation |
| 0x421e90 | 0x421f70 | +0xe0 | code | bytes compared | Vector3.right | Lua native Vector3.right implementation |
| 0x421fa0 | 0x422080 | +0xe0 | code | bytes compared | Vector3.forward | Lua native Vector3.forward implementation |
| 0x4220b0 | 0x422190 | +0xe0 | code | bytes compared | Vector3.up | Lua native Vector3.up implementation |
| 0x4221c0 | 0x4222a0 | +0xe0 | code | bytes compared | Vector3.left | Lua native Vector3.left implementation |
| 0x4222d0 | 0x4223b0 | +0xe0 | code | bytes compared | Vector3.backward | Lua native Vector3.backward implementation |
| 0x4223e0 | 0x4224c0 | +0xe0 | code | bytes compared | Vector3.down | Lua native Vector3.down implementation |
| 0x422740 | 0x422820 | +0xe0 | code | bytes compared |  | Start of the second code block holding Vector3 Lua natives |
| 0x4228c0 | 0x4229a0 | +0xe0 | code | bytes compared |  | Lua native Vector3.x_axis implementation |
| 0x4229d0 | 0x422ab0 | +0xe0 | code | bytes compared |  | Lua native Vector3.y_axis implementation |
| 0x422ae0 | 0x422bc0 | +0xe0 | code | bytes compared |  | Lua native Vector3.z_axis implementation |
| 0x422f60 | 0x423040 | +0xe0 | code | bytes compared | Vector3.element | Lua native Vector3.element implementation |
| 0x423090 | 0x423170 | +0xe0 | code | bytes compared | Vector3.x | Lua native Vector3.x implementation |
| 0x423160 | 0x423240 | +0xe0 | code | bytes compared | Vector3.y | Lua native Vector3.y implementation |
| 0x423230 | 0x423310 | +0xe0 | code | bytes compared | Vector3.z | Lua native Vector3.z implementation |
| 0x423340 | 0x423420 | +0xe0 | code | bytes compared | Vector3.to_elements | Lua native Vector3.to_elements implementation |
| 0x423830 | 0x423910 | +0xe0 | code | bytes compared | Vector3.set_element | Lua native Vector3.set_element implementation |
| 0x423a00 | 0x423ae0 | +0xe0 | code | bytes compared | Vector3.set_x | Lua native Vector3.set_x implementation |
| 0x423b80 | 0x423c60 | +0xe0 | code | bytes compared | Vector3.set_y | Lua native Vector3.set_y implementation |
| 0x423d00 | 0x423de0 | +0xe0 | code | bytes compared | Vector3.set_z | Lua native Vector3.set_z implementation |
| 0x423f80 | 0x424060 | +0xe0 | code | bytes compared |  | Lua native Vector3.set_xyz implementation |
| 0x4244a0 | 0x424580 | +0xe0 | code | bytes compared | Vector3.length | Lua native Vector3.length implementation |
| 0x424690 | 0x424770 | +0xe0 | code | bytes compared | Vector3.normalize | Lua native Vector3.normalize implementation |
| 0x424890 | 0x424970 | +0xe0 | code | bytes compared | Vector3.dot | Lua native Vector3.dot implementation |
| 0x424a80 | 0x424b60 | +0xe0 | code | bytes compared | Vector3.cross | Lua native Vector3.cross implementation |
| 0x424c90 | 0x424d70 | +0xe0 | code | bytes compared | Vector3.distance | Lua native Vector3.distance implementation |
| 0x424e40 | 0x424f20 | +0xe0 | code | bytes compared | Vector3.distance_squared | Lua native Vector3.distance_squared implementation |
| 0x424fc0 | 0x4250a0 | +0xe0 | code | bytes compared | Vector3.distance_xy_squared | Lua native Vector3.distance_xy_squared implementation |
| 0x4253d0 | 0x4254b0 | +0xe0 | code | bytes compared | Vector3.lerp | Lua native Vector3.lerp implementation |
| 0x425650 | 0x425730 | +0xe0 | code | bytes compared | Vector3.min | Lua native Vector3.min implementation |
| 0x425850 | 0x425930 | +0xe0 | code | bytes compared | Vector3.max | Lua native Vector3.max implementation |
| 0x425aa0 | 0x425b80 | +0xe0 | code | bytes compared |  | Vector3.make_axes implementation body (builds two orthogonal axes) |
| 0x425df0 | 0x425ed0 | +0xe0 | code | bytes compared | Vector3.make_axes | Lua native Vector3.make_axes implementation |
| 0x425eb0 | 0x425f90 | +0xe0 | code | bytes compared | Vector3.is_valid | Lua native Vector3.is_valid implementation |
| 0x425f40 | 0x426020 | +0xe0 | code | bytes compared |  | End of the second code block holding Vector3 Lua natives |
| 0x4263c0 | 0x4264a0 | +0xe0 | code | bytes compared |  | Vector3Box constructor implementation; start of the Vector3Box natives block |
| 0x426610 | 0x4266f0 | +0xe0 | code | bytes compared |  | Vector3Box __call metamethod implementation (Lua native) |
| 0x426780 | 0x426860 | +0xe0 | code | bytes compared | Vector3Box.__index | Vector3Box __index metamethod implementation (Lua native) |
| 0x426930 | 0x426a10 | +0xe0 | code | bytes compared | Vector3Box.__newindex | Vector3Box __newindex metamethod implementation (Lua native) |
| 0x4269d0 | 0x426ab0 | +0xe0 | code | bytes compared | Vector3Box.__len | Vector3Box __len metamethod implementation (Lua native) |
| 0x426a10 | 0x426af0 | +0xe0 | code | bytes compared |  | Vector3Box store implementation body |
| 0x426c30 | 0x426d10 | +0xe0 | code | bytes compared | Vector3Box.store | Lua native Vector3Box.store implementation |
| 0x426d10 | 0x426df0 | +0xe0 | code | bytes compared | Vector3Box.unbox | Lua native Vector3Box.unbox implementation |
| 0x426dc0 | 0x426ea0 | +0xe0 | code | bytes compared |  | End of the code block holding the Vector3Box Lua natives |
| 0x4270a0 | 0x427180 | +0xe0 | code | bytes compared |  | Start of the first code block holding Vector4 Lua natives |
| 0x427ae0 | 0x427bc0 | +0xe0 | code | bytes compared |  | Vector4 __call metamethod implementation (Lua native) |
| 0x427bc0 | 0x427ca0 | +0xe0 | code | bytes compared | Vector4.equal | Lua native Vector4.equal implementation |
| 0x428290 | 0x428370 | +0xe0 | code | bytes compared | Vector4.to_string | Lua native Vector4.to_string implementation |
| 0x428320 | 0x428400 | +0xe0 | code | bytes compared | Vector4.zero | Lua native Vector4.zero implementation |
| 0x4288a0 | 0x428980 | +0xe0 | code | bytes compared | Vector4.add | Lua native Vector4.add implementation |
| 0x428b30 | 0x428c10 | +0xe0 | code | bytes compared | Vector4.subtract | Lua native Vector4.subtract implementation |
| 0x428df0 | 0x428ed0 | +0xe0 | code | bytes compared | Vector4.multiply | Lua native Vector4.multiply implementation |
| 0x4290d0 | 0x4291b0 | +0xe0 | code | bytes compared | Vector4.divide | Lua native Vector4.divide implementation |
| 0x429380 | 0x429460 | +0xe0 | code | bytes compared | Vector4.multiply_elements | Lua native Vector4.multiply_elements implementation |
| 0x429610 | 0x4296f0 | +0xe0 | code | bytes compared | Vector4.divide_elements | Lua native Vector4.divide_elements implementation |
| 0x429be0 | 0x429cc0 | +0xe0 | code | bytes compared | Vector4.element | Lua native Vector4.element implementation |
| 0x429d10 | 0x429df0 | +0xe0 | code | bytes compared | Vector4.x | Lua native Vector4.x implementation |
| 0x429de0 | 0x429ec0 | +0xe0 | code | bytes compared | Vector4.y | Lua native Vector4.y implementation |
| 0x429eb0 | 0x429f90 | +0xe0 | code | bytes compared | Vector4.z | Lua native Vector4.z implementation |
| 0x429f40 | 0x42a020 | +0xe0 | code | bytes compared |  | Start of the second code block holding Vector4 Lua natives |
| 0x429f80 | 0x42a060 | +0xe0 | code | bytes compared | Vector4.w | Lua native Vector4.w implementation |
| 0x42a0b0 | 0x42a190 | +0xe0 | code | bytes compared | Vector4.to_elements | Lua native Vector4.to_elements implementation |
| 0x42a650 | 0x42a730 | +0xe0 | code | bytes compared | Vector4.set_element | Lua native Vector4.set_element implementation |
| 0x42a820 | 0x42a900 | +0xe0 | code | bytes compared | Vector4.set_x | Lua native Vector4.set_x implementation |
| 0x42a9a0 | 0x42aa80 | +0xe0 | code | bytes compared | Vector4.set_y | Lua native Vector4.set_y implementation |
| 0x42ab20 | 0x42ac00 | +0xe0 | code | bytes compared | Vector4.set_z | Lua native Vector4.set_z implementation |
| 0x42aca0 | 0x42ad80 | +0xe0 | code | bytes compared | Vector4.set_w | Lua native Vector4.set_w implementation |
| 0x42afa0 | 0x42b080 | +0xe0 | code | bytes compared | Vector4.set_xyzw | Lua native Vector4.set_xyzw implementation |
| 0x42b3a0 | 0x42b480 | +0xe0 | code | bytes compared | Vector4.length | Lua native Vector4.length implementation |
| 0x42b5d0 | 0x42b6b0 | +0xe0 | code | bytes compared | Vector4.normalize | Lua native Vector4.normalize implementation |
| 0x42b800 | 0x42b8e0 | +0xe0 | code | bytes compared | Vector4.dot | Lua native Vector4.dot implementation |
| 0x42b9c0 | 0x42baa0 | +0xe0 | code | bytes compared | Vector4.distance | Lua native Vector4.distance implementation |
| 0x42bb90 | 0x42bc70 | +0xe0 | code | bytes compared | Vector4.distance_squared | Lua native Vector4.distance_squared implementation |
| 0x42c0d0 | 0x42c1b0 | +0xe0 | code | bytes compared | Vector4.lerp | Lua native Vector4.lerp implementation |
| 0x42c230 | 0x42c310 | +0xe0 | code | bytes compared | Vector4.min | Lua native Vector4.min implementation |
| 0x42c4c0 | 0x42c5a0 | +0xe0 | code | bytes compared | Vector4.max | Lua native Vector4.max implementation |
| 0x42c6b0 | 0x42c790 | +0xe0 | code | bytes compared | Vector4.is_valid | Lua native Vector4.is_valid implementation |
| 0x42c740 | 0x42c820 | +0xe0 | code | bytes compared |  | End of the second code block holding Vector4 Lua natives |
| 0x48f290 | 0x48f370 | +0xe0 | code | bytes compared |  | Lua native returning the temporary-pool byte counts (temp count callback) |
| 0x48f2e5 | 0x48f3c5 | +0xe0 | code | bytes compared |  | End of the temporary-pool count Lua native |
| 0x48f3a0 | 0x48f480 | +0xe0 | code | bytes compared |  | Lua native restoring the temporary-pool cursor (set temp count callback) |
| 0x48f431 | 0x48f511 | +0xe0 | code | bytes compared |  | End of the temporary-pool set-count Lua native |
| 0x4a3726 | 0x4a3806 | +0xe0 | code | bytes compared | preview_registration_ref | Inside Lua Material API registration: loads the Material.set_resource entry thunk address |
| 0x4a4060 | 0x4a4140 | +0xe0 | code | predicted | PreviewBindingProof.preview_wrapper | Lua C wrapper of Material.set_resource (reads arguments, calls the engine setter) |
| 0x4a42d0 | 0x4a43b0 | +0xe0 | code | predicted | preview_entry | Entry thunk of Lua native Material.set_resource (jumps to its wrapper) |
| 0x4d8282 | 0x4d8362 | +0xe0 | code | bytes compared |  | Inside the camera projection implementation: loads the scene camera entry and calls a helper |
| 0x4ec360 | 0x4ec430 | +0xd0 | code | bytes compared |  | LuaEnvironment resource loader insertion, called by the constructor |
| 0x4ec690 | 0x4ec760 | +0xd0 | code | bytes compared |  | LuaEnvironment setup (standard libraries and API), called by the constructor |
| 0x4ecc90 | 0x4ecd60 | +0xd0 | code | bytes compared |  | Helper that attaches a Lua module table to the stingray global namespace |
| 0x4ece51 | 0x4ecf21 | +0xd0 | code | bytes compared |  | End of the global-namespace module attach helper |
| 0x4ece60 | 0x4ecf30 | +0xd0 | code | bytes compared |  | Helper that creates or reuses a Lua module table in the registry |
| 0x4ed005 | 0x4ed0d5 | +0xd0 | code | bytes compared |  | End of the registry module table helper |
| 0x4ed1d0 | 0x4ed2a0 | +0xd0 | code | bytes compared |  | LuaEnvironment constructor (creates the Lua state) |
| 0x4ed20e | 0x4ed2de | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: first allocator init call |
| 0x4ed227 | 0x4ed2f7 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: second allocator init call |
| 0x4ed2f2 | 0x4ed3c2 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: call that creates the Lua state |
| 0x4ed492 | 0x4ed562 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: call to environment setup |
| 0x4ed49a | 0x4ed56a | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: call to resource loader insertion |
| 0x4ed49f | 0x4ed56f | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment constructor: first instruction after Lua state setup |
| 0x4ed4bd | 0x4ed58d | +0xd0 | code | bytes compared |  | End of the LuaEnvironment constructor |
| 0x4ed4c0 | 0x4ed590 | +0xd0 | code | bytes compared |  | LuaEnvironment destructor (closes the Lua state) |
| 0x4ed4cd | 0x4ed59d | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: call clearing temporary overflow pages |
| 0x4ed4d2 | 0x4ed5a2 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: loads the state and calls lua_close |
| 0x4ed4d5 | 0x4ed5a5 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: lua_close call |
| 0x4ed4da | 0x4ed5aa | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: first instruction after lua_close |
| 0x4ed4f1 | 0x4ed5c1 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: call releasing the overflow page array (unsure) |
| 0x4ed517 | 0x4ed5e7 | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: call destroying the Lua VM allocator |
| 0x4ed52a | 0x4ed5fa | +0xd0 | code | bytes compared |  | Inside the LuaEnvironment destructor: tail jump destroying the environment allocator |
| 0x4ed52f | 0x4ed5ff | +0xd0 | code | bytes compared |  | End of the LuaEnvironment destructor |
| 0x4f03a0 | 0x4f0470 | +0xd0 | code | bytes compared |  | Per-frame cleanup of the Lua temporary pool (resets ring and overflow) |
| 0x4f04c6 | 0x4f0596 | +0xd0 | code | bytes compared |  | End of the checked prefix of the Lua temporary pool frame cleanup |
| 0x4f06d0 | 0x4f07a0 | +0xd0 | code | bytes compared |  | Releases the Lua temporary pool overflow pages |
| 0x4f073e | 0x4f080e | +0xd0 | code | bytes compared |  | End of the temporary pool overflow page release function |
| 0x4f9d40 | 0x4f9e10 | +0xd0 | code | bytes compared |  | Allocated-size method of the temporary pool page allocator |
| 0x4f9d4b | 0x4f9e1b | +0xd0 | code | bytes compared |  | End of the temporary pool allocator size method |
| 0x4f9df0 | 0x4f9ec0 | +0xd0 | code | bytes compared |  | Destructor of the Lua VM allocator |
| 0x5039b0 | 0x503a80 | +0xd0 | code | bytes compared | preview_setter | Material resource setter: binds a resource to a material slot by name hash |
| 0x51fdb0 | 0x51fe80 | +0xd0 | code | bytes compared | mesh_visibility_impl | Engine implementation that sets the visibility of a unit's meshes |
| 0x51fdda | 0x51feaa | +0xd0 | code | bytes compared |  | Inside the mesh visibility setter: sets or clears pass-mask bits at mesh +0xDC |
| 0x523310 | 0x5233e0 | +0xd0 | code | bytes compared |  | Skinning palette builder function |
| 0x55be6e | 0x55bf0e | +0xa0 | code | bytes compared |  | Inside animation state exit: fires the state's exit events and parameters |
| 0x55c0c0 | 0x55c160 | +0xa0 | code | bytes compared |  | Animation state machine enter-state function |
| 0x55c12a | 0x55c1ca | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: writes the new state record |
| 0x55c265 | 0x55c305 | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: dispatch on the state type |
| 0x55c490 | 0x55c530 | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: looks up the state's animation resource (unsure) |
| 0x55c53f | 0x55c5df | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: copies the resolved animation entry (unsure) |
| 0x55cf39 | 0x55cfd9 | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: counts and runs entry behaviour callbacks |
| 0x55d18e | 0x55d22e | +0xa0 | code | bytes compared |  | Inside the animation enter-state function: applies entry parameters in precedence order |
| 0x565080 | 0x565120 | +0xa0 | code | bytes compared |  | Sets animation state machine layer states synchronously on a unit's animator |
| 0x5650b0 | 0x565150 | +0xa0 | code | bytes compared |  | Inside the animation set-states routine: skips unset layers and dispatches each state |
| 0x565109 | 0x5651a9 | +0xa0 | code | bytes compared |  | Inside the animation state setter: early-exit branch target for a zero count |
| 0x56696d | 0x5669fd | +0x90 | code | bytes compared |  | Inside the animation batch manager: initialises a batch completion flag |
| 0x56698b | 0x566a1b | +0x90 | code | bytes compared |  | Inside the animation batch manager: grows the batch array (count and capacity) |
| 0x566c88 | 0x566d18 | +0x90 | code | bytes compared |  | Inside the animation batch manager: waits on the batch inputs |
| 0x566dc1 | 0x566e51 | +0x90 | code | bytes compared |  | Inside the animation batch manager: clears the batch count |
| 0x566dea | 0x566e7a | +0x90 | code | bytes compared |  | Inside the animation batch manager: searches the instance group at +0x90 |
| 0x566e49 | 0x566ed8 | +0x8f | code | bytes compared |  | Inside the animation batch manager: searches the instance group at +0xA8 |
| 0x566ef5 | 0x566f84 | +0x8f | code | bytes compared |  | Inside the animation batch manager: vector push (count, capacity, pointer) |
| 0x56ad9e | 0x56ae2e | +0x90 | code | bytes compared |  | Inside the animation update: polls a batch completion flag |
| 0x56d819 | 0x56d8a9 | +0x90 | code | bytes compared |  | Inside animation evaluation: copies blend flags into the evaluation frame (unsure) |
| 0x5adf31 | 0x5adfd1 | +0xa0 | code | bytes compared |  | Inside the animation-to-scene-graph pose writer: node link type check |
| 0x5ae648 | 0x5ae6e8 | +0xa0 | code | bytes compared |  | Inside the animation-to-scene-graph pose writer: copies a node's local translation |
| 0x5eb2b0 | 0x5eb340 | +0x90 | code | bytes compared |  | Timed per-frame Lua garbage collection scheduler |
| 0x5eb2bc | 0x5eb34c | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: first instruction after the prologue |
| 0x5eb2fb | 0x5eb38b | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: records a GC profiler statistic |
| 0x5eb30e | 0x5eb39e | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: records a GC profiler statistic |
| 0x5eb373 | 0x5eb403 | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: records a GC profiler statistic |
| 0x5eb390 | 0x5eb420 | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: lua_gc full collection call |
| 0x5eb3e9 | 0x5eb479 | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: records a GC profiler statistic |
| 0x5eb473 | 0x5eb503 | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: incremental collector step call |
| 0x5eb4d5 | 0x5eb565 | +0x90 | code | bytes compared |  | Inside the timed Lua GC scheduler: final return instruction |
| 0x5eb4d6 | 0x5eb566 | +0x90 | code | bytes compared |  | End of the timed Lua GC scheduler function |
| 0x5f21f9 | 0x5f2299 | +0xa0 | code | bytes compared |  | Inside the type-1 animation state evaluator: reads its pose controls |
| 0x5f289c | 0x5f293c | +0xa0 | code | bytes compared |  | Inside the type-1 animation state evaluator: tests the axis flag at +0x25 |
| 0x5f291c | 0x5f29bc | +0xa0 | code | bytes compared |  | Inside the type-1 animation state evaluator: tests the axis flags at +0x26/+0x27 |
| 0x5f2bdd | 0x5f2c7d | +0xa0 | code | bytes compared |  | Inside the type-1 animation state evaluator: multiplies by the feedback factor (+0xB4) |
| 0x5f2f7f | 0x5f301f | +0xa0 | code | bytes compared |  | Type-1 animation state feedback routine: enabled-flag and index check |
| 0x601f40 | 0x601fe0 | +0xa0 | code | bytes compared |  | Engine allocator initializer (name, parent, flag) |
| 0x602070 | 0x602110 | +0xa0 | code | bytes compared |  | Engine allocator destructor (environment and game allocators) |
| 0x602110 | 0x6021b0 | +0xa0 | code | bytes compared | armory.allocate | Engine allocator allocate(allocator, out, size, alignment) |
| 0x6021ce | 0x60226e | +0xa0 | code | bytes compared |  | End of the temporary pool page allocator allocate method |
| 0x6021d0 | 0x602270 | +0xa0 | code | bytes compared | armory.release | Engine allocator release (frees a block obtained from allocate) |
| 0x60222b | 0x6022cb | +0xa0 | code | bytes compared |  | End of the temporary pool page allocator release method |
| 0x632070 | 0x632110 | +0xa0 | code | bytes compared |  | Resource manager check that a resource of given type and name is present |
| 0x6321a0 | 0x632240 | +0xa0 | code | bytes compared |  | Resource manager fetch of a resource by type and name |
| 0x6322ef | 0x63238f | +0xa0 | code | bytes compared |  | Inside the resource manager's unit resource fetch: hash-map probe |
| 0x6323cc | 0x63246c | +0xa0 | code | bytes compared |  | Inside the resource manager's unit resource fetch: returns the found resource |
| 0x6333f0 | 0x633490 | +0xa0 | code | bytes compared |  | Resource manager query returning a loaded resource by type and name |
| 0x6349a0 | 0x634a40 | +0xa0 | code | bytes compared |  | Resource manager request to load a resource for a package |
| 0x635640 | 0x6356e0 | +0xa0 | code | bytes compared |  | Resource manager release of a resource by type and name |
| 0x635b43 | 0x635be3 | +0xa0 | code | bytes compared |  | Inside resource release: fatal check that a live unit still holds the resource |
| 0x638490 | 0x638540 | +0xb0 | code | bytes compared |  | Resource manager finalization of a list of loaded type/name pairs |
| 0x6386a2 | 0x638752 | +0xb0 | code | bytes compared |  | Inside resource finalization: early-exit branch target for a zero count |
| 0x638ad0 | 0x638b80 | +0xb0 | code | bytes compared |  | Resource manager code using the live-unit hold map at manager+0x350 (unsure) |
| 0x63bf20 | 0x63bfd0 | +0xb0 | code | bytes compared |  | Resource manager code using the live-unit hold map at manager+0x350 (unsure) |
| 0x63e0d0 | 0x63e180 | +0xb0 | code | bytes compared |  | Hash-map index lookup over 0xD0-byte entries used by the resource manager |
| 0x63eee0 | 0x63ef90 | +0xb0 | code | bytes compared |  | Resource manager code using the live-unit hold map at manager+0x350 (unsure) |
| 0x643570 | 0x643620 | +0xb0 | code | bytes compared |  | Package loader request body reached from the application API thunk at slot +0x2F0 |
| 0x643980 | 0x643a30 | +0xb0 | code | bytes compared |  | Package loader body reached from the application API thunk at slot +0x300 (unsure) |
| 0x64d230 | 0x64d2e0 | +0xb0 | code | bytes compared |  | Resource package loader: group lookup function |
| 0x6693a0 | 0x669480 | +0xe0 | code | bytes compared |  | String hash function returning a 32-bit id (behind the hash API) |
| 0x66a090 | 0x66a170 | +0xe0 | code | bytes compared |  | Virtual method (vtable +0x38) looking up a property entry on a render-data object (unsure) |
| 0x66c950 | 0x66ca30 | +0xe0 | code | bytes compared |  | Helper called by the camera projection implementation with the scene camera entry (unsure) |
| 0x674100 | 0x6741e0 | +0xe0 | code | bytes compared |  | Pre-update hook of a secondary engine service, called by the game update |
| 0x6cd1e0 | 0x6cd170 | -0x70 | code | bytes compared |  | Wrapper that forwards the LuaEnvironment GC context to the timed GC scheduler |
| 0x6cd1ec | 0x6cd17c | -0x70 | code | bytes compared |  | End of the GC scheduler forwarding wrapper |
| 0x6cd510 | 0x6cd4a0 | -0x70 | code | bytes compared |  | Game destructor (shutdown routine) |
| 0x6cd54d | 0x6cd4dd | -0x70 | code | bytes compared |  | Inside the game destructor: start of the Lua shutdown callback call |
| 0x6cd564 | 0x6cd4f4 | -0x70 | code | bytes compared |  | Inside the game destructor: Lua temporary pool cleanup call |
| 0x6cd569 | 0x6cd4f9 | -0x70 | code | bytes compared |  | Inside the game destructor: start of the inline full Lua collection |
| 0x6cd5a3 | 0x6cd533 | -0x70 | code | bytes compared |  | Inside the game destructor: first collector helper call of the full collection |
| 0x6cd5b1 | 0x6cd541 | -0x70 | code | bytes compared |  | Inside the game destructor: second collector helper call of the full collection |
| 0x6cd5c3 | 0x6cd553 | -0x70 | code | bytes compared |  | Inside the game destructor: third collector helper call of the full collection |
| 0x6cd5fa | 0x6cd58a | -0x70 | code | bytes compared |  | Inside the game destructor: native hook comparison after the full collection |
| 0x6cd601 | 0x6cd591 | -0x70 | code | bytes compared |  | Inside the game destructor: store of the Lua GC threshold |
| 0x6cd605 | 0x6cd595 | -0x70 | code | bytes compared |  | Inside the game destructor: branch following the GC threshold store |
| 0x6cd73a | 0x6cd6ca | -0x70 | code | bytes compared |  | Inside the game destructor: global cleanup call |
| 0x6cd755 | 0x6cd6e5 | -0x70 | code | bytes compared |  | Inside the game destructor: Steam voice manager destructor call |
| 0x6cd77f | 0x6cd70f | -0x70 | code | bytes compared |  | Inside the game destructor: Steam friends service destructor call |
| 0x6cd801 | 0x6cd791 | -0x70 | code | bytes compared |  | Inside the game destructor: Steam cloud service destructor call |
| 0x6cd8a0 | 0x6cd830 | -0x70 | code | bytes compared |  | Inside the game destructor: call made after all services are released |
| 0x6cd8b5 | 0x6cd845 | -0x70 | code | bytes compared |  | Inside the game destructor: game buffer cleanup call |
| 0x6cd8ce | 0x6cd85e | -0x70 | code | bytes compared |  | Inside the game destructor: LuaEnvironment destructor call |
| 0x6cd8da | 0x6cd86a | -0x70 | code | bytes compared |  | Inside the game destructor: first allocator destructor call |
| 0x6cd8e6 | 0x6cd876 | -0x70 | code | bytes compared |  | Inside the game destructor: second allocator destructor call |
| 0x6cd8ef | 0x6cd87f | -0x70 | code | bytes compared |  | Inside the game destructor: third allocator destructor call |
| 0x6cd90b | 0x6cd89b | -0x70 | code | bytes compared |  | End of the game destructor |
| 0x6cde10 | 0x6cded0 | +0xc0 | code | bytes compared |  | Game boot routine (registers Lua APIs, applies config, runs the boot script) |
| 0x6cde4d | 0x6cdf0d | +0xc0 | code | bytes compared |  | Inside the game boot routine: start of the initial Lua stack setup |
| 0x6cde92 | 0x6cdf52 | +0xc0 | code | bytes compared |  | Inside the game boot routine: end of the initial Lua stack setup |
| 0x6cdfec | 0x6ce0ac | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the core Lua registrar |
| 0x6cdff1 | 0x6ce0b1 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the core registrar call |
| 0x6ce05c | 0x6ce11c | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Steam Lua registrar |
| 0x6ce061 | 0x6ce121 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Steam registrar call |
| 0x6ce06b | 0x6ce12b | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Leaderboard Lua registrar |
| 0x6ce070 | 0x6ce130 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Leaderboard registrar call |
| 0x6ce076 | 0x6ce136 | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Achievement and Stats Lua registrar |
| 0x6ce07b | 0x6ce13b | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Achievement and Stats registrar call |
| 0x6ce07e | 0x6ce13e | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Cloud Lua registrar |
| 0x6ce083 | 0x6ce143 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Cloud registrar call |
| 0x6ce0a1 | 0x6ce161 | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Network Lua registrar |
| 0x6ce0a6 | 0x6ce166 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Network registrar call |
| 0x6ce0ac | 0x6ce16c | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the Friends and Presence Lua registrar |
| 0x6ce0b1 | 0x6ce171 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the Friends and Presence registrar call |
| 0x6ce0bb | 0x6ce17b | +0xc0 | code | bytes compared |  | Inside the game boot routine: call to the SteamVoip Lua registrar |
| 0x6ce0c0 | 0x6ce180 | +0xc0 | code | bytes compared |  | Inside the game boot routine: instruction after the SteamVoip registrar call |
| 0x6ce190 | 0x6ce250 | +0xc0 | code | bytes compared |  | Inside the game boot routine: start of the loop setting config globals |
| 0x6ce196 | 0x6ce256 | +0xc0 | code | bytes compared |  | Inside the game boot routine: stores the network flag byte from config |
| 0x6ce38d | 0x6ce44d | +0xc0 | code | bytes compared |  | Inside the game boot routine: end of the config globals loop |
| 0x6ce4b8 | 0x6ce578 | +0xc0 | code | bytes compared |  | Inside the game boot routine: boot script name setup before require |
| 0x6ce4bb | 0x6ce57b | +0xc0 | code | bytes compared |  | Inside the game boot routine: branch target when boot_script is missing |
| 0x6ce4c1 | 0x6ce581 | +0xc0 | code | bytes compared |  | Inside the game boot routine: start of boot script require and init |
| 0x6ce5f9 | 0x6ce6b9 | +0xc0 | code | bytes compared |  | Inside the game boot routine: end of boot script require and error path |
| 0x6ce601 | 0x6ce6c1 | +0xc0 | code | bytes compared |  | Inside the game boot routine: Lua stack access before the epilogue |
| 0x6ce605 | 0x6ce6c5 | +0xc0 | code | bytes compared |  | Inside the game boot routine: start of the epilogue |
| 0x6ce614 | 0x6ce6d4 | +0xc0 | code | bytes compared |  | Inside the game boot routine: return instruction |
| 0x6ce61a | 0x6ce6da | +0xc0 | code | bytes compared |  | Padding byte after the game boot routine |
| 0x6ce61b | 0x6ce6db | +0xc0 | code | bytes compared |  | End of the game boot routine |
| 0x6ce620 | 0x6ce6e0 | +0xc0 | code | bytes compared |  | Game update routine (per-frame Lua update, GC and temporary cleanup) |
| 0x6ce657 | 0x6ce717 | +0xc0 | code | bytes compared |  | Inside the game update routine: secondary service pre-update hook call |
| 0x6ce65f | 0x6ce71f | +0xc0 | code | bytes compared |  | Inside the game update routine: pre-update hook call (delta time) |
| 0x6ce664 | 0x6ce724 | +0xc0 | code | bytes compared |  | Inside the game update routine: start of the Lua update call section |
| 0x6ce6a1 | 0x6ce761 | +0xc0 | code | bytes compared |  | Inside the game update routine: timed Lua GC scheduler call |
| 0x6ce709 | 0x6ce7c9 | +0xc0 | code | bytes compared |  | Inside the game update routine: Lua temporary pool cleanup call |
| 0x6ce70e | 0x6ce7ce | +0xc0 | code | bytes compared |  | Inside the game update routine: first instruction after the Lua update section |
| 0x6ce720 | 0x6ce7e0 | +0xc0 | code | bytes compared |  | Inside the game update routine: tail call to the post-update hook |
| 0x6ce725 | 0x6ce7e5 | +0xc0 | code | bytes compared |  | End of the game update routine |
| 0x6ce730 | 0x6ce7f0 | +0xc0 | code | bytes compared |  | Game render routine (per-frame Lua render call) |
| 0x6ce734 | 0x6ce7f4 | +0xc0 | code | bytes compared |  | Inside the game render routine: start of the Lua render call section |
| 0x6ce76b | 0x6ce82b | +0xc0 | code | bytes compared |  | Inside the game render routine: Lua temporary pool cleanup call |
| 0x6ce770 | 0x6ce830 | +0xc0 | code | bytes compared |  | Inside the game render routine: first instruction after the Lua render section |
| 0x6ce790 | 0x6ce850 | +0xc0 | code | bytes compared |  | End of the game render routine |
| 0x6cf010 | 0x6cf0d0 | +0xc0 | code | bytes compared |  | Game buffer cleanup called by the game destructor |
| 0x792c00 | 0x792c50 | +0x50 | code | bytes compared | luaL_argerror (LuaApi slot 91) | Lua C API luaL_argerror (engine LuaApi table slot 91) |
| 0x792e00 | 0x792e50 | +0x50 | code | bytes compared | luaL_where (LuaApi slot 103) | Lua C API luaL_where (engine LuaApi table slot 103) |
| 0x792f20 | 0x792f70 | +0x50 | code | bytes compared | luaL_error (LuaApi slot 104) | Lua C API luaL_error (engine LuaApi table slot 104) |
| 0x7930a0 | 0x7930f0 | +0x50 | code | bytes compared | luaL_newmetatable (LuaApi slot 101) | Lua C API luaL_newmetatable (engine LuaApi table slot 101) |
| 0x793170 | 0x7931c0 | +0x50 | code | bytes compared | luaL_checkudata (LuaApi slot 102) | Lua C API luaL_checkudata (engine LuaApi table slot 102) |
| 0x793270 | 0x7932c0 | +0x50 | code | bytes compared | luaL_checktype (LuaApi slot 99) | Lua C API luaL_checktype (engine LuaApi table slot 99) |
| 0x7932c0 | 0x793310 | +0x50 | code | bytes compared | luaL_checkany (LuaApi slot 100) | Lua C API luaL_checkany (engine LuaApi table slot 100) |
| 0x793300 | 0x793350 | +0x50 | code | bytes compared | luaL_checklstring (LuaApi slot 92) | Lua C API luaL_checklstring (engine LuaApi table slot 92) |
| 0x793480 | 0x7934d0 | +0x50 | code | bytes compared | luaL_checknumber (LuaApi slot 94) | Lua C API luaL_checknumber (engine LuaApi table slot 94) |
| 0x7935d0 | 0x793620 | +0x50 | code | bytes compared | luaL_checkinteger (LuaApi slot 96) | Lua C API luaL_checkinteger (engine LuaApi table slot 96) |
| 0x7936d0 | 0x793720 | +0x50 | code | bytes compared | luaL_optinteger (LuaApi slot 97) | Lua C API luaL_optinteger (engine LuaApi table slot 97) |
| 0x7938b0 | 0x793900 | +0x50 | code | bytes compared | luaL_register (LuaApi slot 87) | Lua C API luaL_register (engine LuaApi table slot 87) |
| 0x7943e0 | 0x794430 | +0x50 | code | bytes compared | luaL_ref (LuaApi slot 106) | Lua C API luaL_ref (engine LuaApi table slot 106) |
| 0x794520 | 0x794570 | +0x50 | code | bytes compared | luaL_unref (LuaApi slot 107) | Lua C API luaL_unref (engine LuaApi table slot 107) |
| 0x7967f0 | 0x796840 | +0x50 | code | bytes compared |  | lua_checkstack of the statically linked Lua 5.1 C API |
| 0x796930 | 0x796980 | +0x50 | code | bytes compared |  | lua_newthread of the statically linked Lua 5.1 C API |
| 0x796a60 | 0x796ab0 | +0x50 | code | bytes compared | lua_gettop (LuaApi slot 13) | Lua C API lua_gettop (engine LuaApi table slot 13) |
| 0x796a70 | 0x796ac0 | +0x50 | code | bytes compared | lua_settop (LuaApi slot 14) | Lua C API lua_settop (engine LuaApi table slot 14) |
| 0x796ad0 | 0x796b20 | +0x50 | code | bytes compared |  | lua_remove of the statically linked Lua 5.1 C API |
| 0x796b20 | 0x796b70 | +0x50 | code | bytes compared | lua_insert (LuaApi slot 17) | Lua C API lua_insert (engine LuaApi table slot 17) |
| 0x796b70 | 0x796bc0 | +0x50 | code | bytes compared | lua_replace (LuaApi slot 18) | Lua C API lua_replace (engine LuaApi table slot 18) |
| 0x796cb0 | 0x796d00 | +0x50 | code | bytes compared | lua_pushvalue (LuaApi slot 15) | Lua C API lua_pushvalue (engine LuaApi table slot 15) |
| 0x796ce0 | 0x796d30 | +0x50 | code | bytes compared | lua_type (LuaApi slot 25) | Lua C API lua_type (engine LuaApi table slot 25) |
| 0x796d10 | 0x796d60 | +0x50 | code | bytes compared | lua_typename (LuaApi slot 26) | Lua C API lua_typename (engine LuaApi table slot 26) |
| 0x796d30 | 0x796d80 | +0x50 | code | bytes compared |  | lua_iscfunction of the statically linked Lua 5.1 C API |
| 0x796d60 | 0x796db0 | +0x50 | code | bytes compared | lua_isnumber (LuaApi slot 21) | Lua C API lua_isnumber (engine LuaApi table slot 21) |
| 0x796da0 | 0x796df0 | +0x50 | code | bytes compared | lua_isstring (LuaApi slot 22) | Lua C API lua_isstring (engine LuaApi table slot 22) |
| 0x796de0 | 0x796e30 | +0x50 | code | bytes compared | lua_isuserdata (LuaApi slot 24) | Lua C API lua_isuserdata (engine LuaApi table slot 24) |
| 0x796e10 | 0x796e60 | +0x50 | code | bytes compared | lua_rawequal (LuaApi slot 28) | Lua C API lua_rawequal (engine LuaApi table slot 28) |
| 0x796f10 | 0x796f60 | +0x50 | code | bytes compared | lua_tonumber (LuaApi slot 30) | Lua C API lua_tonumber (engine LuaApi table slot 30) |
| 0x796f70 | 0x796fc0 | +0x50 | code | bytes compared | lua_tointeger (LuaApi slot 31) | Lua C API lua_tointeger (engine LuaApi table slot 31) |
| 0x796fd0 | 0x797020 | +0x50 | code | bytes compared | lua_toboolean (LuaApi slot 32) | Lua C API lua_toboolean (engine LuaApi table slot 32) |
| 0x797000 | 0x797050 | +0x50 | code | bytes compared | lua_tolstring (LuaApi slot 33) | Lua C API lua_tolstring (engine LuaApi table slot 33) |
| 0x7970a0 | 0x7970f0 | +0x50 | code | bytes compared | lua_objlen (LuaApi slot 34) | Lua C API lua_objlen (engine LuaApi table slot 34) |
| 0x797120 | 0x797170 | +0x50 | code | bytes compared |  | lua_tocfunction of the statically linked Lua 5.1 C API |
| 0x797150 | 0x7971a0 | +0x50 | code | bytes compared | lua_touserdata (LuaApi slot 36) | Lua C API lua_touserdata (engine LuaApi table slot 36) |
| 0x7971b0 | 0x797200 | +0x50 | code | bytes compared |  | lua_topointer of the statically linked Lua 5.1 C API |
| 0x797220 | 0x797270 | +0x50 | code | bytes compared | lua_pushnil (LuaApi slot 39) | Lua C API lua_pushnil (engine LuaApi table slot 39) |
| 0x797240 | 0x797290 | +0x50 | code | bytes compared | lua_pushnumber (LuaApi slot 40) | Lua C API lua_pushnumber (engine LuaApi table slot 40) |
| 0x797260 | 0x7972b0 | +0x50 | code | bytes compared | lua_pushinteger (LuaApi slot 41) | Lua C API lua_pushinteger (engine LuaApi table slot 41) |
| 0x797280 | 0x7972d0 | +0x50 | code | bytes compared | lua_pushlstring (LuaApi slot 42) | Lua C API lua_pushlstring (engine LuaApi table slot 42) |
| 0x7972f0 | 0x797340 | +0x50 | code | bytes compared | lua_pushstring (LuaApi slot 43) | Lua C API lua_pushstring (engine LuaApi table slot 43) |
| 0x797370 | 0x7973c0 | +0x50 | code | bytes compared | lua_pushfstring (LuaApi slot 45) | Lua C API lua_pushfstring (engine LuaApi table slot 45) |
| 0x7973c0 | 0x797410 | +0x50 | code | bytes compared | lua_pushcclosure (LuaApi slot 46) | Lua C API lua_pushcclosure (engine LuaApi table slot 46) |
| 0x797490 | 0x7974e0 | +0x50 | code | bytes compared | lua_pushboolean (LuaApi slot 47) | Lua C API lua_pushboolean (engine LuaApi table slot 47) |
| 0x7974b0 | 0x797500 | +0x50 | code | bytes compared | lua_pushlightuserdata (LuaApi slot 48) | Lua C API lua_pushlightuserdata (engine LuaApi table slot 48) |
| 0x797500 | 0x797550 | +0x50 | code | bytes compared | lua_gettable (LuaApi slot 50) | Lua C API lua_gettable (engine LuaApi table slot 50) |
| 0x797530 | 0x797580 | +0x50 | code | bytes compared | lua_getfield (LuaApi slot 51) | Lua C API lua_getfield (engine LuaApi table slot 51) |
| 0x7975a0 | 0x7975f0 | +0x50 | code | bytes compared | lua_rawget (LuaApi slot 52) | Lua C API lua_rawget (engine LuaApi table slot 52) |
| 0x7975e0 | 0x797630 | +0x50 | code | bytes compared | lua_rawgeti (LuaApi slot 53) | Lua C API lua_rawgeti (engine LuaApi table slot 53) |
| 0x797620 | 0x797670 | +0x50 | code | bytes compared | lua_createtable (LuaApi slot 54) | Lua C API lua_createtable (engine LuaApi table slot 54) |
| 0x797690 | 0x7976e0 | +0x50 | code | bytes compared | lua_getmetatable (LuaApi slot 56) | Lua C API lua_getmetatable (engine LuaApi table slot 56) |
| 0x797770 | 0x7977c0 | +0x50 | code | bytes compared |  | lua_settable of the statically linked Lua 5.1 C API |
| 0x7977a0 | 0x7977f0 | +0x50 | code | bytes compared | lua_setfield (LuaApi slot 59) | Lua C API lua_setfield (engine LuaApi table slot 59) |
| 0x797810 | 0x797860 | +0x50 | code | bytes compared |  | lua_rawset of the statically linked Lua 5.1 C API |
| 0x7978b0 | 0x797900 | +0x50 | code | bytes compared |  | lua_rawseti of the statically linked Lua 5.1 C API |
| 0x797980 | 0x7979d0 | +0x50 | code | bytes compared | lua_setmetatable (LuaApi slot 62) | Lua C API lua_setmetatable (engine LuaApi table slot 62) |
| 0x797b40 | 0x797b90 | +0x50 | code | bytes compared | lua_call (LuaApi slot 64) | Lua C API lua_call (engine LuaApi table slot 64) |
| 0x797ba0 | 0x797bf0 | +0x50 | code | bytes compared | lua_pcall (LuaApi slot 65) | Lua C API lua_pcall (engine LuaApi table slot 65) |
| 0x797e50 | 0x797ea0 | +0x50 | code | bytes compared |  | lua_gc of the statically linked Lua 5.1 C API |
| 0x798090 | 0x7980e0 | +0x50 | code | bytes compared | lua_error (LuaApi slot 73) | Lua C API lua_error (engine LuaApi table slot 73) |
| 0x7980a0 | 0x7980f0 | +0x50 | code | bytes compared |  | lua_next of the statically linked Lua 5.1 C API |
| 0x7980e0 | 0x798130 | +0x50 | code | bytes compared | lua_concat (LuaApi slot 75) | Lua C API lua_concat (engine LuaApi table slot 75) |
| 0x7981b0 | 0x798200 | +0x50 | code | bytes compared | lua_newuserdata (LuaApi slot 55) | Lua C API lua_newuserdata (engine LuaApi table slot 55) |
| 0x7989a0 | 0x7989f0 | +0x50 | code | bytes compared |  | Lua state creation (lua_newstate) called by the LuaEnvironment constructor |
| 0x798b70 | 0x798bc0 | +0x50 | code | bytes compared |  | lua_close of the statically linked Lua 5.1 runtime |
| 0x7a0bc0 | 0x7a0c10 | +0x50 | code | bytes compared |  | Lua collector helper called once by the inline full collection at shutdown (unsure) |
| 0x7a0f30 | 0x7a0f80 | +0x50 | code | bytes compared |  | Lua collector helper called twice by the inline full collection at shutdown (unsure) |
| 0x7a1130 | 0x7a1180 | +0x50 | code | bytes compared |  | Lua incremental garbage collector step (luaC_step) |
| 0x7cb790 | 0x7cba30 | +0x2a0 | code | bytes compared |  | Steam friends service destructor |
| 0x7cb9b0 | 0x7cbc50 | +0x2a0 | code | bytes compared |  | Friends service helper returning a friend display name |
| 0x7cba23 | 0x7cbcc3 | +0x2a0 | code | bytes compared |  | End of the friends service helper (returning a friend display name) |
| 0x7cbe70 | 0x7cc110 | +0x2a0 | code | bytes compared |  | Friends service helper reading the game a friend is playing |
| 0x7cbfbb | 0x7cc25b | +0x2a0 | code | bytes compared |  | End of the friends service helper (reading the game a friend is playing) |
| 0x7cc020 | 0x7cc2c0 | +0x2a0 | code | bytes compared |  | Friends service helper inviting a friend to a lobby |
| 0x7cc323 | 0x7cc5c3 | +0x2a0 | code | bytes compared |  | End of the friends service helper (inviting a friend to a lobby) |
| 0x7cc330 | 0x7cc5d0 | +0x2a0 | code | bytes compared |  | Friends service helper inviting a friend to a game server |
| 0x7cc633 | 0x7cc8d3 | +0x2a0 | code | bytes compared |  | End of the friends service helper (inviting a friend to a game server) |
| 0x7cc690 | 0x7cc930 | +0x2a0 | code | bytes compared |  | Friends service helper popping the next pending invite |
| 0x7cc73a | 0x7cc9da | +0x2a0 | code | bytes compared |  | End of the friends service helper (popping the next pending invite) |
| 0x7ce390 | 0x7ce630 | +0x2a0 | code | bytes compared |  | Presence helper advertising the current lobby |
| 0x7ce683 | 0x7ce923 | +0x2a0 | code | bytes compared |  | End of the presence helper (advertising the current lobby) |
| 0x7ce690 | 0x7ce930 | +0x2a0 | code | bytes compared |  | Presence helper advertising the current game server |
| 0x7ce983 | 0x7cec23 | +0x2a0 | code | bytes compared |  | End of the presence helper (advertising the current game server) |
| 0x7d09b0 | 0x7d0c50 | +0x2a0 | code | bytes compared |  | Steam cloud service destructor |
| 0x7d1c20 | 0x7d1ec0 | +0x2a0 | code | bytes compared |  | Voice client helper setting outgoing voice for all members |
| 0x7d1c8c | 0x7d1f2c | +0x2a0 | code | bytes compared |  | End of the voice client helper (setting outgoing voice for all members) |
| 0x7d1c90 | 0x7d1f30 | +0x2a0 | code | bytes compared |  | Voice client helper setting outgoing voice for one member |
| 0x7d1d09 | 0x7d1fa9 | +0x2a0 | code | bytes compared |  | End of the voice client helper (setting outgoing voice for one member) |
| 0x7d1d10 | 0x7d1fb0 | +0x2a0 | code | bytes compared |  | Voice client helper setting incoming voice for all members |
| 0x7d1d7c | 0x7d201c | +0x2a0 | code | bytes compared |  | End of the voice client helper (setting incoming voice for all members) |
| 0x7d1d80 | 0x7d2020 | +0x2a0 | code | bytes compared |  | Voice client helper setting incoming voice for one member |
| 0x7d1df9 | 0x7d2099 | +0x2a0 | code | bytes compared |  | End of the voice client helper (setting incoming voice for one member) |
| 0x7d4530 | 0x7d47d0 | +0x2a0 | code | bytes compared |  | Steam voice manager destructor |
| 0x7d48f0 | 0x7d4b90 | +0x2a0 | code | bytes compared |  | Steam voice manager helper that destroys a voice room |
| 0x7d4a20 | 0x7d4cc0 | +0x2a0 | code | bytes compared |  | Steam voice manager helper that joins a voice room |
| 0x7eb510 | 0x7eb7c0 | +0x2b0 | code | bytes compared |  | Achievement and Stats Lua API registrar called by the game boot routine |
| 0x7edac0 | 0x7edd70 | +0x2b0 | code | bytes compared |  | Network Lua API registrar called by the game boot routine |
| 0x7ef620 | 0x7ef8d0 | +0x2b0 | code | bytes compared | Friends.num_friends | Lua native Friends.num_friends implementation |
| 0x7ef6e4 | 0x7ef994 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.num_friends function body |
| 0x7ef6f0 | 0x7ef9a0 | +0x2b0 | code | bytes compared | Friends.id | Lua native Friends.id implementation |
| 0x7ef7d1 | 0x7efa81 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.id function body |
| 0x7ef7e0 | 0x7efa90 | +0x2b0 | code | bytes compared | Friends.name | Lua native Friends.name implementation |
| 0x7ef894 | 0x7efb44 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.name function body |
| 0x7ef8a0 | 0x7efb50 | +0x2b0 | code | bytes compared | Friends.relationship | Lua native Friends.relationship implementation |
| 0x7ef956 | 0x7efc06 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.relationship function body |
| 0x7ef960 | 0x7efc10 | +0x2b0 | code | bytes compared | Friends.status | Lua native Friends.status implementation |
| 0x7efa16 | 0x7efcc6 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.status function body |
| 0x7efa20 | 0x7efcd0 | +0x2b0 | code | bytes compared | Friends.in_category | Lua native Friends.in_category implementation |
| 0x7efb41 | 0x7efdf1 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.in_category function body |
| 0x7efb50 | 0x7efe00 | +0x2b0 | code | bytes compared | Friends.playing_game | Lua native Friends.playing_game implementation |
| 0x7eff35 | 0x7f01e5 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.playing_game function body |
| 0x7eff40 | 0x7f01f0 | +0x2b0 | code | bytes compared | Friends.invite | Lua native Friends.invite implementation |
| 0x7f0466 | 0x7f0716 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.invite function body |
| 0x7f0470 | 0x7f0720 | +0x2b0 | code | bytes compared | Friends.next_invite | Lua native Friends.next_invite implementation |
| 0x7f05e6 | 0x7f0896 | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.next_invite function body |
| 0x7f05f0 | 0x7f08a0 | +0x2b0 | code | bytes compared | Friends.boot_invite | Lua native Friends.boot_invite implementation |
| 0x7f06eb | 0x7f099b | +0x2b0 | code | bytes compared |  | End of the Lua native Friends.boot_invite function body |
| 0x7f06f0 | 0x7f09a0 | +0x2b0 | code | bytes compared | Presence.advertise_playing | Lua native Presence.advertise_playing implementation |
| 0x7f0bb4 | 0x7f0e64 | +0x2b0 | code | bytes compared |  | End of the Lua native Presence.advertise_playing function body |
| 0x7f0bc0 | 0x7f0e70 | +0x2b0 | code | bytes compared | Presence.stop_advertise_playing | Lua native Presence.stop_advertise_playing implementation |
| 0x7f0bee | 0x7f0e9e | +0x2b0 | code | bytes compared |  | End of the Lua native Presence.stop_advertise_playing function body |
| 0x7f0bf0 | 0x7f0ea0 | +0x2b0 | code | bytes compared | Presence.set_presence | Lua native Presence.set_presence implementation |
| 0x7f0cce | 0x7f0f7e | +0x2b0 | code | bytes compared |  | End of the Lua native Presence.set_presence function body |
| 0x7f0cd0 | 0x7f0f80 | +0x2b0 | code | bytes compared | Presence.presence | Lua native Presence.presence implementation |
| 0x7f0e02 | 0x7f10b2 | +0x2b0 | code | bytes compared |  | End of the Lua native Presence.presence function body |
| 0x7f0e10 | 0x7f10c0 | +0x2b0 | code | bytes compared |  | Friends and Presence Lua API registrar (14 natives, 28 constants) |
| 0x7f16b0 | 0x7f1960 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: start of the constant registration section |
| 0x7f1706 | 0x7f19b6 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the NO_INVITE constant (0) |
| 0x7f176a | 0x7f1a1a | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the INVITE_SERVER constant (2) |
| 0x7f17ca | 0x7f1a7a | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the INVITE_LOBBY constant (1) |
| 0x7f181b | 0x7f1acb | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the NONE constant (0) |
| 0x7f187a | 0x7f1b2a | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the BLOCKED constant (1) |
| 0x7f18d0 | 0x7f1b80 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the REQUEST_RECIPIENT constant (2) |
| 0x7f1930 | 0x7f1be0 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the FRIEND constant (3) |
| 0x7f1990 | 0x7f1c40 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the REQUEST_INITIATOR constant (4) |
| 0x7f19f0 | 0x7f1ca0 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the IGNORED constant (5) |
| 0x7f1a50 | 0x7f1d00 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the IGNORED_FRIEND constant (6) |
| 0x7f1aab | 0x7f1d5b | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the SUGGESTED constant (7) |
| 0x7f1b06 | 0x7f1db6 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the OFFLINE constant (0) |
| 0x7f1b60 | 0x7f1e10 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the ONLINE constant (1) |
| 0x7f1bb6 | 0x7f1e66 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the BUSY constant (2) |
| 0x7f1c0c | 0x7f1ebc | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the AWAY constant (3) |
| 0x7f1c62 | 0x7f1f12 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the SNOOZE constant (4) |
| 0x7f1cb8 | 0x7f1f68 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the TRADING constant (5) |
| 0x7f1d0e | 0x7f1fbe | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the LOOKING_TO_PLAY constant (6) |
| 0x7f1d64 | 0x7f2014 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the BLOCKED_FLAG constant (1) |
| 0x7f1dba | 0x7f206a | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the FRIENDSHIP_REQUESTED_FLAG constant (2) |
| 0x7f1e10 | 0x7f20c0 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the FRIEND_FLAG constant (4) |
| 0x7f1e6b | 0x7f211b | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the CLAN_MEMBER_FLAG constant (8) |
| 0x7f1ecb | 0x7f217b | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the ON_GAME_SERVER_FLAG constant (16) |
| 0x7f1f2b | 0x7f21db | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the REQUESTING_FRIENDSHIP_FLAG constant (128) |
| 0x7f1f8b | 0x7f223b | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the REQUESTING_INFO_FLAG constant (256) |
| 0x7f1feb | 0x7f229b | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the IGNORED_FLAG constant (512) |
| 0x7f2050 | 0x7f2300 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the IGNORED_FRIEND_FLAG constant (1024) |
| 0x7f20b0 | 0x7f2360 | +0x2b0 | code | bytes compared |  | Inside the Friends Lua registrar: stores the SUGGESTED_FLAG constant (2048) |
| 0x7f20f3 | 0x7f23a3 | +0x2b0 | code | bytes compared |  | End of the Friends and Presence Lua registrar |
| 0x7f23c0 | 0x7f2670 | +0x2b0 | code | bytes compared | SteamVoip.update | Lua native SteamVoip.update implementation |
| 0x7f2460 | 0x7f2710 | +0x2b0 | code | bytes compared | SteamVoipRoom.members | Lua native SteamVoipRoom.members implementation |
| 0x7f2a8e | 0x7f2d3e | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipRoom.members function body |
| 0x7f2d30 | 0x7f2fe0 | +0x2b0 | code | bytes compared | SteamVoipRoom.broken_members | Lua native SteamVoipRoom.broken_members implementation |
| 0x7f3306 | 0x7f35b6 | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipRoom.broken_members function body |
| 0x7f3310 | 0x7f35c0 | +0x2b0 | code | bytes compared | SteamVoipClient.room_id | Lua native SteamVoipClient.room_id implementation |
| 0x7f3387 | 0x7f3637 | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipClient.room_id function body |
| 0x7f3390 | 0x7f3640 | +0x2b0 | code | bytes compared | SteamVoipClient.members | Lua native SteamVoipClient.members implementation |
| 0x7f391e | 0x7f3bce | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipClient.members function body |
| 0x7f3920 | 0x7f3bd0 | +0x2b0 | code | bytes compared | SteamVoipClient.select_out | Lua native SteamVoipClient.select_out implementation |
| 0x7f3a2f | 0x7f3cdf | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipClient.select_out function body |
| 0x7f3a30 | 0x7f3ce0 | +0x2b0 | code | bytes compared | SteamVoipClient.select_in | Lua native SteamVoipClient.select_in implementation |
| 0x7f3b3f | 0x7f3def | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipClient.select_in function body |
| 0x7f3b40 | 0x7f3df0 | +0x2b0 | code | bytes compared | SteamVoipClient.broken_host | Lua native SteamVoipClient.broken_host implementation |
| 0x7f3b9a | 0x7f3e4a | +0x2b0 | code | bytes compared |  | End of the Lua native SteamVoipClient.broken_host function body |
| 0x7f3ba0 | 0x7f3e50 | +0x2b0 | code | bytes compared |  | SteamVoip Lua API registrar (room and client natives) |
| 0x7f444e | 0x7f46fe | +0x2b0 | code | bytes compared |  | End of the SteamVoip Lua registrar |
| 0x7f4500 | 0x7f47b0 | +0x2b0 | code | bytes compared | Steam.connected | Lua native Steam.connected implementation |
| 0x7f453c | 0x7f47ec | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.connected function body |
| 0x7f4540 | 0x7f47f0 | +0x2b0 | code | bytes compared | Steam.client_running | Lua native Steam.client_running implementation |
| 0x7f457c | 0x7f482c | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.client_running function body |
| 0x7f4580 | 0x7f4830 | +0x2b0 | code | bytes compared | Steam.overlay_active | Lua native Steam.overlay_active implementation |
| 0x7f45bc | 0x7f486c | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.overlay_active function body |
| 0x7f45c0 | 0x7f4870 | +0x2b0 | code | bytes compared | Steam.user_id | Lua native Steam.user_id implementation |
| 0x7f4618 | 0x7f48c8 | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.user_id function body |
| 0x7f4620 | 0x7f48d0 | +0x2b0 | code | bytes compared | Steam.user_name | Lua native Steam.user_name implementation |
| 0x7f4700 | 0x7f49b0 | +0x2b0 | code | bytes compared | Steam.language | Lua native Steam.language implementation |
| 0x7f485c | 0x7f4b0c | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.language function body |
| 0x7f4860 | 0x7f4b10 | +0x2b0 | code | bytes compared | Steam.is_installed | Lua native Steam.is_installed implementation |
| 0x7f48f5 | 0x7f4ba5 | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.is_installed function body |
| 0x7f4900 | 0x7f4bb0 | +0x2b0 | code | bytes compared | Steam.owns_app | Lua native Steam.owns_app implementation |
| 0x7f4998 | 0x7f4c48 | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.owns_app function body |
| 0x7f49a0 | 0x7f4c50 | +0x2b0 | code | bytes compared | Steam.install_event | Lua native Steam.install_event implementation |
| 0x7f4a02 | 0x7f4cb2 | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.install_event function body |
| 0x7f4a10 | 0x7f4cc0 | +0x2b0 | code | bytes compared | Steam.app_id | Lua native Steam.app_id implementation |
| 0x7f4a50 | 0x7f4d00 | +0x2b0 | code | bytes compared | Steam.open_url | Lua native Steam.open_url implementation |
| 0x7f4abe | 0x7f4d6e | +0x2b0 | code | bytes compared |  | End of the Lua native Steam.open_url function body |
| 0x7f4ac0 | 0x7f4d70 | +0x2b0 | code | bytes compared |  | Steam Lua API registrar (stores the Steam service, registers Steam natives) |
| 0x7f519d | 0x7f544d | +0x2b0 | code | bytes compared |  | End of the Steam Lua registrar |
| 0x7f72a0 | 0x7f7550 | +0x2b0 | code | bytes compared |  | Leaderboard Lua API registrar called by the game boot routine |
| 0x7f9490 | 0x7f9740 | +0x2b0 | code | bytes compared |  | Cloud Lua API registrar called by the game boot routine |
| 0x7fad60 | 0x7fae50 | +0xf0 | code | bytes compared |  | Pre-update hook called by the game update routine with delta time |
| 0x805010 | 0x8051b0 | +0x1a0 | code | bytes compared |  | Physics world script API function at table slot +0x68 (unsure) |
| 0x806640 | 0x8067e0 | +0x1a0 | code | bytes compared |  | Actor script API: enables or disables a list of physics actors (queued) |
| 0x81e4d0 | 0x81e670 | +0x1a0 | code | bytes compared |  | Actor script API: checks that a physics actor handle is valid |
| 0x8205b0 | 0x820750 | +0x1a0 | code | bytes compared |  | Actor script API: returns a physics actor's flags |
| 0x820720 | 0x8208c0 | +0x1a0 | code | bytes compared |  | Actor script API: reads a physics actor's linear and angular velocity |
| 0x820af0 | 0x820c90 | +0x1a0 | code | bytes compared |  | Actor script API: sets a physics actor's position (queued physics command) |
| 0x820e10 | 0x820fb0 | +0x1a0 | code | bytes compared |  | Actor script API: sets a physics actor's rotation (queued physics command) |
| 0x826bc0 | 0x826d60 | +0x1a0 | code | bytes compared |  | Physics world script API: returns the index (0-3) of a world |
| 0x8557b0 | 0x855950 | +0x1a0 | code | bytes compared |  | Mover script API: returns a unit's mover handle by name |
| 0x8565e0 | 0x856780 | +0x1a0 | code | bytes compared |  | Mover script API: reads a mover's position |
| 0x8573a0 | 0x857540 | +0x1a0 | code | bytes compared |  | Mover script API: returns a mover's dimensions record |
| 0x87bb20 | 0x87bcc0 | +0x1a0 | code | bytes compared |  | Physics world raycast: start of the function |
| 0x87bb80 | 0x87bd20 | +0x1a0 | code | bytes compared |  | Inside the physics world raycast: loads the world's physics scene slot |
| 0x880600 | 0x8807a0 | +0x1a0 | code | bytes compared |  | Physics world script API: overlap/shape query against a world |
| 0x9561b0 | 0x956330 | +0x180 | code | bytes compared |  | Inside the PlayFab lobby update: reads the lobby record layout |
| 0x956232 | 0x9563b2 | +0x180 | code | bytes compared |  | Inside the PlayFab lobby update: reads the lobby member count and array |
| 0xd65790 | 0xd65950 | +0x1c0 | code | bytes compared |  | Physics world vtable method returning the world's body array |
| 0x12aee70 | 0x12af030 | +0x1c0 | code | bytes compared |  | Cleanup routine called by the game destructor after services are released |
| 0x148d340 | 0x148d348 | +0x8 | data | bytes compared |  | Import-table slot for QueryPerformanceFrequency |
| 0x148d368 | 0x148d370 | +0x8 | data | bytes compared |  | Import-table slot for QueryPerformanceCounter |
| 0x16f48b0 | 0x16f5350 | +0xaa0 | data | bytes compared |  | Render texture format table (bits-per-texel entries) |
| 0x16f8b70 | 0x16f9610 | +0xaa0 | data | bytes compared | preview_wrapper.rdata_0x16f8b70 | 256-entry byte lookup table of integer log2 values, used by Lua natives |
| 0x16f9e10 | 0x16fa8b0 | +0xaa0 | data | bytes compared |  | Steam language table: 20 pairs of language name and code string pointers |
| 0x1714b70 | 0x1714b50 | -0x20 | data | bytes compared | unit_vtable | Vtable of the engine Unit class |
| 0x1715bb8 | 0x1715c40 | +0x88 | data | bytes compared | blur optic vtable (.rdata) | Vtable of the camera lens (depth of field) provider |
| 0x1726a10 | 0x17269b0 | -0x60 | data | bytes compared | allocator vtable | Vtable of an engine allocator class (allocate at +0x30, release at +0x40) |
| 0x172b360 | 0x172b320 | -0x40 | data | bytes compared | allocator vtable | Vtable of a second engine allocator class with the same allocate and release |
| 0x17430a8 | 0x1743030 | -0x78 | data | bytes compared |  | Vtable of the physics character controller behind a mover |
| 0x174d4e0 | 0x174d4d8 | -0x8 | data | bytes compared | half_constant | Float constant 0.5 in read-only data |
| 0x174d754 | 0x174d74c | -0x8 | data | bytes compared |  | Lua GC maximum time budget per frame in ms (float, default 10) |
| 0x174d758 | 0x174d750 | -0x8 | data | bytes compared |  | End of the Lua GC maximum time budget constant |
| 0x174dac0 | 0x174dab0 | -0x10 | data | bytes compared |  | Lua GC schedule settings: four floats (start growth, range, full growth, min ms) |
| 0x174dad0 | 0x174dac0 | -0x10 | data | bytes compared |  | End of the Lua GC schedule settings block |
| 0x1ab77e0 | 0x1ab7800 | +0x20 | data | bytes compared | armory.allocator | Engine allocator global (allocator object) |
| 0x2870c00 | 0x2870bf0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x170) |
| 0x2870d00 | 0x2870cf0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x20): Camera API |
| 0x2870e30 | 0x2870e20 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x28) |
| 0x2870f30 | 0x2870f20 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xC0): string hash API |
| 0x2870f60 | 0x2870f50 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x0) |
| 0x2871030 | 0x2871020 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x140) |
| 0x2871120 | 0x2871110 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x178) |
| 0x28711b0 | 0x28711a0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x138) |
| 0x2871350 | 0x2871340 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x10): Application API |
| 0x2871aa0 | 0x2871a90 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xF0) |
| 0x2871ce0 | 0x2871cd0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x50) |
| 0x2871ed8 | 0x2871ec8 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x48) |
| 0x2871f68 | 0x2871f58 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xB8) |
| 0x2871fc8 | 0x2871fb8 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x180) |
| 0x2871ff0 | 0x2871fe0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xE0) |
| 0x2872030 | 0x2872020 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x8) |
| 0x28727d8 | 0x28727c8 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x58) |
| 0x2872830 | 0x2872820 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xD0) |
| 0x2872b88 | 0x2872b78 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x100) |
| 0x2872ba0 | 0x2872b90 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xE8) |
| 0x2872c60 | 0x2872c50 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x168) |
| 0x2872c90 | 0x2872c80 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x128) |
| 0x2872e90 | 0x2872e80 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x110) |
| 0x2872ee0 | 0x2872ed0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xD8) |
| 0x2872f20 | 0x2872f10 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x30) |
| 0x2873050 | 0x2873040 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x120) |
| 0x2873080 | 0x2873070 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x40) |
| 0x2873200 | 0x28731f0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xC8) |
| 0x2873270 | 0x2873260 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x130) |
| 0x2873310 | 0x2873300 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x38) |
| 0x2873460 | 0x2873450 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x118) |
| 0x2873ad0 | 0x2873ac0 | -0x10 | data | bytes compared | blur query table | Function table for entity property queries (slot +0x28 packs two ids) (unsure) |
| 0x2873b28 | 0x2873b18 | -0x10 | data | bytes compared | blur setter table | Function table holding the entity property setter (+0x0) and getter (+0x8) (unsure) |
| 0x2874180 | 0x2874170 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x188) |
| 0x28741c0 | 0x28741b0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x190) |
| 0x2874278 | 0x2874268 | -0x10 | data | bytes compared |  | Engine C API function table (root +0x198) |
| 0x28746b0 | 0x28746e0 | +0x30 | data | bytes compared |  | Engine C API function table (root +0x148) |
| 0x2874858 | 0x2874840 | -0x18 | data | bytes compared |  | Engine C API function table (root +0x150) |
| 0x2874ed0 | 0x2874e40 | -0x90 | data | bytes compared |  | Actor script API function table (Stingray physics actor natives) |
| 0x2875080 | 0x2875070 | -0x10 | data | bytes compared |  | Physics world script API function table |
| 0x2875170 | 0x2875160 | -0x10 | data | bytes compared |  | Mover script API function table |
| 0x28753b0 | 0x28753a0 | -0x10 | data | bytes compared |  | Engine C API function table (root +0xF8) |
| 0x28756d0 | 0x28756c8 | -0x8 | data | bytes compared |  | Engine C API function table (root +0x158) |
| 0x2875ac4 | 0x2875ac8 | +0x4 | data | bytes compared | head context word | Mesh visibility context name hash global holding 0x3100C3D2 (shadow caster pass) (unsure) |
| 0x2875ac8 | 0x2875ac0 | -0x8 | data | bytes compared | head context word | Mesh visibility context name hash global holding 0xF2760503 (default pass) (unsure) |

### game.dll

| Old | New | Shift | Kind | Check | Name | Description |
|---|---|---|---|---|---|---|
| 0x988c20 | 0x988c50 | +0x30 | code | bytes compared |  | Pickup typed zone initialisation function |
| 0x9896f0 | 0x989720 | +0x30 | code | bytes compared |  | Pickup zone creation function |
| 0x989b20 | 0x989b50 | +0x30 | code | bytes compared |  | Pickup timed-open caller function |
| 0x989ce0 | 0x989d10 | +0x30 | code | bytes compared |  | Pickup zone acknowledgement function |
| 0x98a190 | 0x98a1c0 | +0x30 | code | bytes compared |  | Opens an interaction zone on a pickup entity (pickup component manager) |
| 0x99b400 | 0x99b430 | +0x30 | code | bytes compared | terminal_arrow_update | Update function of the terminal arrow-code minigame (reads the arrow inputs) |
| 0x9a9450 | 0x9a9480 | +0x30 | code | bytes compared |  | Starts the ship's arcade minigame |
| 0x9bc670 | 0x9bc6a0 | +0x30 | code | bytes compared |  | Inventory function selecting an avatar's active equipment slot |
| 0x9bd850 | 0x9bd880 | +0x30 | code | bytes compared |  | Inventory: sets an avatar's held carryable item |
| 0x9be500 | 0x9be530 | +0x30 | code | bytes compared |  | Inventory: sets the held carryable's mode (held or put away) |
| 0x9befd0 | 0x9bf000 | +0x30 | code | bytes compared |  | Inventory function refilling an avatar's ammunition |
| 0x9bfc50 | 0x9bfc80 | +0x30 | code | bytes compared |  | Inventory function equipping an entity into an avatar's equipment slot |
| 0x9c0300 | 0x9c0330 | +0x30 | code | bytes compared |  | Inventory function dropping the item in an avatar's equipment slot |
| 0x9c6420 | 0x9c6450 | +0x30 | code | bytes compared | hover_9c6420 | Hover pack update function |
| 0x9c6942 | 0x9c6972 | +0x30 | code | bytes compared |  | Inside the hover pack update: reads the definition's hover height (+0x9C) |
| 0x9c6a97 | 0x9c6ac7 | +0x30 | code | bytes compared |  | Inside the hover pack update: compares hover values against a float constant |
| 0x9c6d8a | 0x9c6dba | +0x30 | code | bytes compared |  | Inside the hover pack update: a float division in the height calculation |
| 0x9c6db7 | 0x9c6de7 | +0x30 | code | bytes compared |  | Inside the hover pack update: two float divisions by the same divisor |
| 0x9d7c10 | 0x9d7c40 | +0x30 | code | bytes compared |  | Materializes an entity's effective loadout package component (unsure) |
| 0x9dc7ab | 0x9dc7db | +0x30 | code | bytes compared |  | Code site writing a locomotion row byte (+0x93) |
| 0x9dd544 | 0x9dd574 | +0x30 | code | bytes compared |  | Function prologue reading a locomotion row's flag byte (+0x94) |
| 0x9de25c | 0x9de28c | +0x30 | code | bytes compared |  | Code site loading the locomotion component pool global (0x2CE1EB8) |
| 0x9de2d9 | 0x9de309 | +0x30 | code | bytes compared |  | Code site writing a locomotion row's flag byte (+0x94) |
| 0xa23710 | 0xa23740 | +0x30 | code | bytes compared | scramble_effect | Queries the stratagem scramble effect active for a player and stratagem kind |
| 0xa5c41b | 0xa5c44b | +0x30 | code | bytes compared |  | Inside input handling: compares the desired aim state, calls controller enter or exit |
| 0xa5ced3 | 0xa5cf03 | +0x30 | code | bytes compared |  | Inside the aim input handler: reads the aim-mode setting (+0xF0) |
| 0xa5cfc5 | 0xa5cff5 | +0x30 | code | bytes compared |  | Inside the aim input handler: reads the per-weapon aim-mode byte |
| 0xa5d083 | 0xa5d0b3 | +0x30 | code | bytes compared |  | Inside the aim input handler: reads the per-input aim-mode byte (player +0x2EC rows) |
| 0xa6be81 | 0xa6beb1 | +0x30 | code | bytes compared |  | Code site testing avatar action flags before the hip-fire start animation event |
| 0xa6bec9 | 0xa6bef9 | +0x30 | code | bytes compared | fixture-derived literal | Call instruction triggering the hip-fire start animation event (Unit API +0x370) |
| 0xa6bed0 | 0xa6bf00 | +0x30 | code | bytes compared | held fire caller | Return address of that hip-fire start animation event call |
| 0xa6c4b0 | 0xa6c4e0 | +0x30 | code | bytes compared |  | Input cancellation member of the drop-item menu input handler |
| 0xa6ca00 | 0xa6ca30 | +0x30 | code | bytes compared |  | Close action handler of the drop-item menu input |
| 0xa74821 | 0xa74851 | +0x30 | code | bytes compared |  | Function tail returning the avatar firing flag (bit 102 of its action flags) |
| 0xaaa2b0 | 0xaaa2e0 | +0x30 | code | bytes compared | open_input | Opens the stratagem input menu for an avatar's input component |
| 0xaab5b0 | 0xaab5e0 | +0x30 | code | bytes compared | close_input | Closes the stratagem input menu for an avatar's input component |
| 0xaabb30 | 0xaabb60 | +0x30 | code | bytes compared | input_handler | Stratagem input handler: takes arrow inputs and matches stratagem codes |
| 0xaaf960 | 0xaaf990 | +0x30 | code | bytes compared | request_slot | Requests a switch of the avatar's weapon to a given equipment slot |
| 0xab5ba0 | 0xab5bd0 | +0x30 | code | bytes compared |  | Vault/climb driver: advances an avatar's vault by a time step |
| 0xab7ec0 | 0xab7ef0 | +0x30 | code | bytes compared |  | Vault detection: checks for a vaultable obstacle ahead of the avatar |
| 0xab9040 | 0xab9070 | +0x30 | code | bytes compared |  | Vault exit validator: classifies the landing spot of a vault |
| 0xab9870 | 0xab98a0 | +0x30 | code | bytes compared |  | Vault approach geometry: computes the approach points for an obstacle |
| 0xabc240 | 0xabc270 | +0x30 | code | bytes compared |  | Close action handler of the weapon-function wheel input |
| 0xabc580 | 0xabc5b0 | +0x30 | code | bytes compared |  | Adds a role mask to a player's input control context |
| 0xabc690 | 0xabc6c0 | +0x30 | code | bytes compared |  | Removes a role mask from a player's input control context |
| 0xabc930 | 0xabc960 | +0x30 | code | bytes compared |  | Function called from code on game.dll page 0x117e000: not identified (unsure) |
| 0xacecd0 | 0xaced00 | +0x30 | code | bytes compared |  | Game state transition function (switches the game state/scene value) |
| 0xacedcc | 0xacedfc | +0x30 | code | bytes compared | 6-byte row `mov [rdi+0xac29c],ebx` at +0xfc of the function | Inside the game state transition: stores the new state value at +0xac29c |
| 0xb467b0 | 0xb46920 | +0x170 | code | bytes compared | compat.armory_registration | Function that registers the Armory UI controller (type 0xE2) with the UI manager |
| 0xb7bd77 | 0xb7bee7 | +0x170 | code | bytes compared |  | Inside the player-left handler: re-arms the SOS beacon if it was requested |
| 0xbb1d94 | 0xbb1f04 | +0x170 | code | bytes compared | compat.manager | Site that loads the UI manager global and scans its controllers for a type |
| 0xbfcbd0 | 0xbfcd40 | +0x170 | code | bytes compared | compat.extra_booster_notify_transport | Generic network RPC send: sends a hashed event message with arguments to peers |
| 0xc008b0 | 0xc00a20 | +0x170 | code | bytes compared |  | Sends rpc_set_held_carryable (peer, avatar entity, item, mode) |
| 0xc04770 | 0xc048e0 | +0x170 | code | bytes compared | compat.extra_booster_notify | Sends the booster-selected notification message for a player to the squad |
| 0xc09ac3 | 0xc09c33 | +0x170 | code | predicted |  | Inside the chat send: builds the rpc_ingame_chat_message RPC |
| 0xc0f380 | 0xc0f4f0 | +0x170 | code | bytes compared |  | Publishes a loadout equip event for a player's equipment slot |
| 0xc12380 | 0xc124f0 | +0x170 | code | bytes compared |  | Sends the kick message to a peer (without removing the peer) |
| 0xe696b0 | 0xe69810 | +0x160 | code | bytes compared |  | Spawns an entity in the world from a type hash and spawn descriptor |
| 0xe69780 | 0xe698e0 | +0x160 | code | bytes compared |  | Queues an entity's networked field for replication (network id, field hash, address) |
| 0xe699e0 | 0xe69b40 | +0x160 | code | bytes compared | compat.extra_booster_notify_player | Returns per-player data for a player ID, used when sending squad messages (unsure) |
| 0xe69b40 | 0xe69ca0 | +0x160 | code | bytes compared | editor INPUT_PIN len 0xdc | Function (220 bytes) used on the aim input path, purpose not established (unsure) |
| 0xe6c660 | 0xe6c7c0 | +0x160 | code | bytes compared |  | Constructor of the spawn actor object |
| 0xe6c6e0 | 0xe6c840 | +0x160 | code | bytes compared |  | Constructor of the spawn actor's inner object |
| 0xe6c8b0 | 0xe6ca10 | +0x160 | code | bytes compared |  | Removes an entity from the world by entity id |
| 0xe6cdc0 | 0xe6cf20 | +0x160 | code | bytes compared |  | Removes an entity from the world by its descriptor record |
| 0xe6d39e | 0xe6d4fe | +0x160 | code | bytes compared |  | Inside world entity removal by descriptor: early-exit target for a null descriptor |
| 0xe9aaeb | 0xe9ac4b | +0x160 | code | bytes compared | blur CALL site | Call site invoking the entity property setter (weapon depth-of-field values) |
| 0xec56e0 | 0xec5840 | +0x160 | code | bytes compared | compat.weapon_mods_select | Selects the active customisation configuration slot of a weapon |
| 0xec5df0 | 0xec5f50 | +0x160 | code | bytes compared | compat.weapon_mods_flush | Flushes pending weapon customisation configuration changes, called by the slot selector (unsure) |
| 0xec6df0 | 0xec6f50 | +0x160 | code | bytes compared | compat.weapon_mods_read | Reads a weapon's active saved customisation configuration into an output record |
| 0xecfd0d | 0xecfe6d | +0x160 | code | bytes compared |  | Inside the online config download: replaces overrides when the checksum differs |
| 0xf13853 | 0xf139b3 | +0x160 | code | bytes compared |  | Inside the client synchronizer: sets the party-join flag |
| 0xf13d3d | 0xf13e9d | +0x160 | code | bytes compared |  | Inside host-left handling: checks the game mode before the host migration event |
| 0xf179f7 | 0xf17b57 | +0x160 | code | bytes compared |  | Inside the new-host handler: re-arms the SOS beacon if it was requested |
| 0xf1aa8c | 0xf1abec | +0x160 | code | bytes compared |  | Inside host migration: sends the new-host notice RPC to every peer |
| 0xf1d8f0 | 0xf1da50 | +0x160 | code | predicted |  | Kicks a peer: sends the kick message and removes the peer |
| 0xf206f0 | 0xf20850 | +0x160 | code | bytes compared |  | Starts joining a lobby |
| 0xf22c96 | 0xf22df6 | +0x160 | code | bytes compared |  | Inside the lobby key setter: writes the key's text cache and changed bits |
| 0xf22d80 | 0xf22ee0 | +0x160 | code | bytes compared |  | Lobby: sets an integer lobby key |
| 0xf2496d | 0xf24acd | +0x160 | code | bytes compared |  | Inside the lobby update: counts down and restarts the lobby post timer |
| 0xf24f60 | 0xf250c0 | +0x160 | code | bytes compared |  | Lobby browser: starts a lobby search |
| 0xf24fd0 | 0xf25130 | +0x160 | code | bytes compared |  | Lobby browser: returns whether a search is still running |
| 0xf25070 | 0xf251d0 | +0x160 | code | bytes compared |  | Lobby browser: returns the number of search results |
| 0xf250e0 | 0xf25240 | +0x160 | code | bytes compared |  | Lobby browser: returns one search result |
| 0xf25640 | 0xf257a0 | +0x160 | code | bytes compared |  | Lobby browser: adds a string filter to the search |
| 0xf27db0 | 0xf27f10 | +0x160 | code | predicted |  | Text chat: sends a chat message |
| 0xf282cc | 0xf2842c | +0x160 | code | predicted |  | Inside the text chat: reads the 64-line chat history (first line, count) |
| 0x106b380 | 0x106b4e0 | +0x160 | code | bytes compared | compat.character_body_catalog | Finds the progression catalog entry matching an offer ID |
| 0x106d320 | 0x106d480 | +0x160 | code | bytes compared | compat.character_pose_catalog | Finds a victory pose or emote record by ID and returns its info |
| 0x106d4d0 | 0x106d630 | +0x160 | code | bytes compared | compat.character_pose_ownership | Builds the list of owned victory poses and victory-capable emotes |
| 0x10794a0 | 0x1079600 | +0x160 | code | bytes compared |  | Function scanning the weapon definition table global (0x2CE1BA0) |
| 0x107aea0 | 0x107b000 | +0x160 | code | bytes compared | serializer_entry | Mission report JSON serializer function (entry) |
| 0x107aed5 | 0x107b035 | +0x160 | code | bytes compared | int_guard | Inside the mission report serializer prologue: saves the report argument |
| 0x107b235 | 0x107b395 | +0x160 | code | bytes compared | serializer float_guard | Inside the mission report serializer: call site that writes a float reward value |
| 0x107b250 | 0x107b3b0 | +0x160 | code | bytes compared | serializer float_return | Inside the mission report serializer: return address after the float writer call |
| 0x107b608 | 0x107b768 | +0x160 | code | bytes compared | serializer samples_guard | Inside the mission report serializer: call site that writes a sample's integer amount |
| 0x107b62a | 0x107b78a | +0x160 | code | bytes compared | serializer samples_return | Inside the mission report serializer: return address after the integer amount writer call |
| 0x1083907 | 0x1083a67 | +0x160 | code | bytes compared |  | Code site storing the stratagem buffer pointer global (0x2E4A228) |
| 0x1083cb0 | 0x1083e10 | +0x160 | code | bytes compared | compat.stratagem_catalog_lookup | Maps a stratagem item ID to its index in the stratagem definition table |
| 0x1085a80 | 0x1085be0 | +0x160 | code | bytes compared | compat.paint_catalog_lookup | Finds a vehicle skin record by category and skin ID |
| 0x10f7ce0 | 0x10f7e40 | +0x160 | code | bytes compared | compat.extra_title_available | Checks whether a player title record is unlocked for the local player |
| 0x1107b90 | 0x1107cf0 | +0x160 | code | bytes compared | comment: near constant loader | Code loading the 0.05 near-clip constant before setting the camera near range |
| 0x1108fb0 | 0x1109110 | +0x160 | code | bytes compared | editor INPUT_PIN len 1328 | Code span (1328 bytes) consuming camera input gain presets (unsure) |
| 0x11094e0 | 0x1109640 | +0x160 | code | bytes compared | editor INPUT_PIN len 0x1a0 | Code span (416 bytes) consuming camera input gain presets (unsure) |
| 0x110aa20 | 0x110ab80 | +0x160 | code | bytes compared |  | Weapon zoom change event handler |
| 0x110ac6f | 0x110adcf | +0x160 | code | bytes compared |  | Inside the zoom event handler: call to the optic selector |
| 0x110ac74 | 0x110add4 | +0x160 | code | bytes compared | zoom caller | Return address of the optic selector call in the zoom event handler |
| 0x110ac80 | 0x110ade0 | +0x160 | code | bytes compared | aim_weapon_distance | Computes the weapon's distance in front of the camera while aiming |
| 0x110b37b | 0x110b4db | +0x160 | code | bytes compared |  | Inside the camera update: call dispatching the camera request evaluation |
| 0x110b6d0 | 0x110b830 | +0x160 | code | bytes compared | editor INPUT_PIN len 0x5b0 | Camera update code span (1456 bytes) with a jump table (unsure) |
| 0x110be7a | 0x110bfda | +0x160 | code | bytes compared | fov CALL site | Call instruction setting the camera vertical FOV (Camera API +0x80) |
| 0x110be87 | 0x110bfe7 | +0x160 | code | bytes compared |  | Final camera dispatch: sets camera position and rotation (Camera API +0x20/+0x28) |
| 0x110be95 | 0x110bff5 | +0x160 | code | bytes compared |  | Call instruction setting the camera position (Camera API +0x20), rotation follows |
| 0x110beb2 | 0x110c012 | +0x160 | code | bytes compared |  | Inside the final camera dispatch: engine API calls after the pose is set |
| 0x110bee7 | 0x110c047 | +0x160 | code | bytes compared |  | Inside the final camera dispatch: copies the world matrix into the camera context |
| 0x110dc8c | 0x110ddec | +0x160 | code | bytes compared |  | Code site loading 0.05 and calling the camera near-range setter |
| 0x110dcab | 0x110de0b | +0x160 | code | bytes compared | near clip call site | Call instruction setting the camera near range (Camera API +0x68) |
| 0x110dcae | 0x110de0e | +0x160 | code | bytes compared | fixture-derived literal | Return address of that camera near-range setter call |
| 0x110fb20 | 0x110fc80 | +0x160 | code | bytes compared |  | ADS camera enter wrapper function |
| 0x110fb62 | 0x110fcc2 | +0x160 | code | bytes compared |  | Inside the ADS camera enter wrapper: call to the evaluator |
| 0x110fb90 | 0x110fcf0 | +0x160 | code | bytes compared |  | ADS camera request constructor |
| 0x110fe9e | 0x110fffe | +0x160 | code | bytes compared |  | Inside the ADS camera constructor: call to the presentation mode switch |
| 0x1110740 | 0x11108a0 | +0x160 | code | bytes compared |  | ADS camera exit function |
| 0x11107af | 0x111090f | +0x160 | code | bytes compared | comment: near constant loader | Inside the ADS camera exit: loads the 0.05 near-clip constant |
| 0x111088b | 0x11109eb | +0x160 | code | bytes compared |  | Inside the ADS camera exit: argument setup for the presentation mode switch |
| 0x11108e3 | 0x1110a43 | +0x160 | code | bytes compared |  | Inside the ADS camera exit: call to the presentation mode switch |
| 0x11147f0 | 0x1114950 | +0x160 | code | bytes compared | editor INPUT_PIN len 1724 | Code span (1724 bytes) on the camera input gain path (unsure) |
| 0x1118210 | 0x1118370 | +0x160 | code | bytes compared |  | ADS camera evaluator function |
| 0x1118215 | 0x1118375 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator prologue: register saves and stack frame |
| 0x11184dc | 0x111863c | +0x160 | code | bytes compared | fixture-derived literal | Call in the ADS camera evaluator reading a unit world pose (Unit API +0x90) |
| 0x11184de | 0x111863e | +0x160 | code | bytes compared | editor input return | Return address of that world pose call |
| 0x1118731 | 0x1118891 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: scales look sensitivity by lens angle over third-person FOV |
| 0x1119293 | 0x11193f3 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: loads operands for the sight depth calculation |
| 0x11192b9 | 0x1119419 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: sight depth calculation (subtract, absolute value, divide) |
| 0x1119921 | 0x1119a81 | +0x160 | code | bytes compared | editor OBSERVE_CALL | Call in the ADS camera evaluator reading a node local position (Unit API +0x0) |
| 0x1119924 | 0x1119a84 | +0x160 | code | bytes compared | fixture-derived literal | Return address of that local position call |
| 0x1119971 | 0x1119ad1 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: sight depth calculation (add step) |
| 0x1119a23 | 0x1119b83 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: sight depth calculation (multiply step) |
| 0x1119acb | 0x1119c2b | +0x160 | code | bytes compared | comment: evaluator near-clip return | Return address in the ADS camera evaluator after a camera near-range setter call |
| 0x1119ae4 | 0x1119c44 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: stores the computed depth values (+0x4C, +0x50) |
| 0x111a300 | 0x111a460 | +0x160 | code | bytes compared |  | Call in the ADS camera evaluator setting the arms branch position (Unit API +0x38) |
| 0x111a66b | 0x111a7cb | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: prepares the viewmodel root position argument |
| 0x111a6a9 | 0x111a809 | +0x160 | code | bytes compared |  | Call in the ADS camera evaluator setting the viewmodel root position (Unit API +0x38) |
| 0x111a6ad | 0x111a80d | +0x160 | code | bytes compared | alignment position return | Return address of the viewmodel root position call |
| 0x111a6b4 | 0x111a814 | +0x160 | code | bytes compared |  | Inside the ADS camera evaluator: prepares the viewmodel root rotation argument |
| 0x111a6c9 | 0x111a829 | +0x160 | code | bytes compared |  | Call in the ADS camera evaluator setting the viewmodel root rotation (Unit API +0x48) |
| 0x111a6cd | 0x111a82d | +0x160 | code | bytes compared | alignment rotation return | Return address of the viewmodel root rotation call |
| 0x111a7e8 | 0x111a948 | +0x160 | code | bytes compared | editor INPUT_PIN len 24 | Jump table of the ADS camera evaluator (24 bytes) |
| 0x111afbb | 0x111b11b | +0x160 | code | bytes compared | editor ROTATION_CALL | Call instruction setting a viewmodel branch rotation (Unit API +0x40) |
| 0x111b8fe | 0x111ba5e | +0x160 | code | bytes compared |  | Inside camera input: reads the stored lens angle (request +0x3C) |
| 0x111b910 | 0x111ba70 | +0x160 | code | bytes compared |  | Inside camera input: scans the request ring for the first kind-4 request |
| 0x111b91a | 0x111ba7a | +0x160 | code | bytes compared | fixture-derived literal | Inside that request ring scan: compares the request kind with 4 |
| 0x111b931 | 0x111ba91 | +0x160 | code | bytes compared |  | Inside camera input: reads the selected request's lens angle (+0x23C) |
| 0x111b942 | 0x111baa2 | +0x160 | code | bytes compared |  | Inside camera input: scales sensitivity by lens degrees over third-person FOV |
| 0x111b955 | 0x111bab5 | +0x160 | code | bytes compared | fixture-derived literal | Inside that sensitivity scaling: divides by the third-person FOV setting |
| 0x111e26e | 0x111e3ce | +0x160 | code | bytes compared |  | Code site storing the lens angle into the camera request (+0xC4 and +0x3C) |
| 0x111e278 | 0x111e3d8 | +0x160 | code | bytes compared | fixture-derived literal | Second store of that pair: lens angle into the camera request (+0x3C) |
| 0x111f700 | 0x111f860 | +0x160 | code | bytes compared | editor INPUT_PIN len 0x124 | Code span (292 bytes) on the camera input gain path (unsure) |
| 0x1131050 | 0x11311b0 | +0x160 | code | bytes compared | status_queue | Queues a status effect on a target (for example a stun) |
| 0x1144580 | 0x11446e0 | +0x160 | code | bytes compared |  | ADS camera controller update function |
| 0x1144783 | 0x11448e3 | +0x160 | code | bytes compared |  | Inside the ADS controller update: aim gate testing an avatar action flag |
| 0x1144890 | 0x11449f0 | +0x160 | code | bytes compared |  | ADS camera controller enter function |
| 0x1144971 | 0x1144ad1 | +0x160 | code | bytes compared | comment: near constant loader | Inside the ADS controller enter: loads the 0.05 near-clip constant |
| 0x11449c0 | 0x1144b20 | +0x160 | code | bytes compared |  | ADS camera controller exit function |
| 0x1144c00 | 0x1144d60 | +0x160 | code | bytes compared |  | Function deciding whether first-person aiming is allowed |
| 0x1144cdb | 0x1144e3b | +0x160 | code | bytes compared |  | Inside the aim-allowed check: reads the weapon's allow-first-person field (+0x180) |
| 0x11543c0 | 0x1154520 | +0x160 | code | predicted | mission_end_builder | Builds the end-of-mission result data (unsure) |
| 0x1178120 | 0x1178280 | +0x160 | code | bytes compared |  | Initialiser of a spawn event record |
| 0x117a7a0 | 0x117a900 | +0x160 | code | bytes compared |  | Online override config: looks a key up (peer-synced table first) |
| 0x117c72d | 0x117c88d | +0x160 | code | bytes compared |  | Code site addressing the HUD crosshair widget (HUD root +0x19A678) |
| 0x117cddc | 0x117cf3c | +0x160 | code | bytes compared |  | Inside mission HUD initialize: constructs the widget at HUD+0x18e98 |
| 0x117d6e7 | 0x117d847 | +0x160 | code | bytes compared |  | Inside mission HUD destroy: destroys the widgets at HUD+0x18e98 and +0x171a0 |
| 0x117ef73 | 0x117f0d3 | +0x160 | code | bytes compared |  | Inside the mission HUD data update: updates the widget at HUD+0x18e98 |
| 0x11822f0 | 0x1182450 | +0x160 | code | bytes compared | context_push | Pushes a UI resource context onto the context stack |
| 0x1182310 | 0x1182470 | +0x160 | code | bytes compared | context_pop | Pops the UI resource context stack |
| 0x11843a0 | 0x1184500 | +0x160 | code | bytes compared |  | Common UI destroy function |
| 0x118480f | 0x118496f | +0x160 | code | bytes compared |  | Inside common UI destroy: early-exit branch target when not initialized |
| 0x118c4e0 | 0x118c640 | +0x160 | code | bytes compared | radial_binding | Queries the control binding for an input action id |
| 0x11901f0 | 0x1190350 | +0x160 | code | bytes compared |  | Input manager function suppressing an action pair with mode and duration |
| 0x1190350 | 0x11904b0 | +0x160 | code | bytes compared |  | Input manager function releasing a suppressed action pair |
| 0x11907c0 | 0x1190920 | +0x160 | code | bytes compared |  | Input manager query returning the suppression row for an action pair |
| 0x1190e30 | 0x1190f90 | +0x160 | code | bytes compared | grid_pattern.consume | Consumes a menu input action (clears its state fields) |
| 0x11912f0 | 0x1191450 | +0x160 | code | bytes compared | packages.package_acquire | Acquires package leases: counts up package ids and loads new packages |
| 0x1191301 | 0x1191461 | +0x160 | code | bytes compared |  | Inside the resource package acquire routine: body after the entry check |
| 0x119146e | 0x11915ce | +0x160 | code | bytes compared |  | Return instruction ending the resource package acquire routine |
| 0x119146f | 0x11915cf | +0x160 | code | bytes compared |  | Inside the resource package acquire routine: out-of-line tail after its return |
| 0x1191480 | 0x11915e0 | +0x160 | code | bytes compared | packages.package_release | Releases package leases: unloads packages whose count reaches zero |
| 0x1191491 | 0x11915f1 | +0x160 | code | bytes compared |  | Inside the resource package release routine: body after the entry check |
| 0x11915e9 | 0x1191749 | +0x160 | code | bytes compared |  | Return instruction ending the resource package release routine |
| 0x11bbaf0 | 0x11bbc50 | +0x160 | code | bytes compared | ui_sound | Plays a UI sound event by id |
| 0x11cc7be | 0x11cc91e | +0x160 | code | bytes compared |  | Inside the matchmaking update: decrements the scanner recharge countdown each frame |
| 0x11cd05c | 0x11cd1bc | +0x160 | code | bytes compared |  | Inside the matchmaking update: reads the quickplay request state |
| 0x11cd238 | 0x11cd398 | +0x160 | code | bytes compared |  | Inside the matchmaking update: loads the scanner recharge time from the online config |
| 0x11cd3ba | 0x11cd51a | +0x160 | code | bytes compared |  | Inside the matchmaking update: reads the Galactic Map scanner request state |
| 0x11d0443 | 0x11d05a3 | +0x160 | code | predicted |  | Inside the lobby search builder: adds the continent filter keys |
| 0x11d04c9 | 0x11d0629 | +0x160 | code | predicted |  | Inside the lobby search builder: checks a continent's config flag |
| 0x11d27a0 | 0x11d2900 | +0x160 | code | bytes compared |  | Fetches the lobby browser handle from the network context |
| 0x11d3d30 | 0x11d3e90 | +0x160 | code | bytes compared |  | Setter that writes a matchmaking scanner flag through the matchmaking global |
| 0x11da689 | 0x11da7e9 | +0x160 | code | bytes compared | ai_11da689 | Inside a mission routine: loads game state and its mission faction record |
| 0x11da6de | 0x11da83e | +0x160 | code | bytes compared | ai_11da6de | Inside a mission routine: reads the mission faction byte |
| 0x11e5430 | 0x11e5590 | +0x160 | code | bytes compared |  | Walks the session peer list (count and 32-byte entries) |
| 0x11f2c4f | 0x11f2daf | +0x160 | code | bytes compared | compat.primary_field | Inside the loadout text formatter: formats the primary weapon entry |
| 0x11f2c83 | 0x11f2de3 | +0x160 | code | bytes compared | compat.secondary_field | Inside the loadout text formatter: formats the secondary weapon entry |
| 0x11f2cb8 | 0x11f2e18 | +0x160 | code | bytes compared | compat.throwable_field | Inside the loadout text formatter: formats the throwable entry |
| 0x11f2ce8 | 0x11f2e48 | +0x160 | code | bytes compared | compat.stratagem_debug_names | Inside the loadout text formatter: formats stratagem entries via the name table |
| 0x11f7a01 | 0x11f7b61 | +0x160 | code | bytes compared | compat.loadout_payload | Inside the loadout payload copy loop: copies one 0xA00-byte player payload |
| 0x11fb080 | 0x11fb1e0 | +0x160 | code | pattern match in game | armory_equip | Armory: equips an item into a loadout slot |
| 0x11fb880 | 0x11fb9e0 | +0x160 | code | bytes compared | compat.weapon_select | Loadout weapon setter: equips a weapon with its customisation into a loadout slot |
| 0x11fb8c0 | 0x11fba20 | +0x160 | code | bytes compared | compat.weapon_catalog | Inside the loadout weapon setter: finds the weapon in the item table |
| 0x11fb91d | 0x11fba7d | +0x160 | code | bytes compared | compat.weapon_mods_source | Inside the loadout weapon setter: reads the weapon's saved customisation configuration |
| 0x11fb9db | 0x11fbb3b | +0x160 | code | bytes compared | compat.weapon_mods_native_filter | Inside the loadout weapon setter: filters attachment categories valid for the weapon |
| 0x11fbe16 | 0x11fbf76 | +0x160 | code | bytes compared | compat.weapon_mods_payload | Inside the loadout weapon setter: writes chosen attachments into the loadout payload |
| 0x11fc0b9 | 0x11fc219 | +0x160 | code | bytes compared | weapon_null_return | Inside the loadout weapon setter: its final return instruction |
| 0x1205cd0 | 0x1205e30 | +0x160 | code | bytes compared | compat.progression_owned_layout | Progression lookup that checks an offer's owned state |
| 0x1205fe0 | 0x1206140 | +0x160 | code | bytes compared | compat.stratagem_available | Checks whether a stratagem is unlocked for the player (progression lookup) |
| 0x1206066 | 0x12061c6 | +0x160 | code | bytes compared | compat.stratagem_owned_parent | Inside the stratagem unlock check: follows the parent progression row for ownership |
| 0x1206170 | 0x12062d0 | +0x160 | code | bytes compared | compat.extra_booster_offer_owned | Checks whether a booster's progression offer is owned |
| 0x12067fc | 0x120695c | +0x160 | code | bytes compared | compat.weapon_mods_catalog_filter | Inside the weapon attachment query: filters the attachment catalog by weapon and category |
| 0x1214090 | 0x12141f0 | +0x160 | code | bytes compared |  | Ship HUD destroy function |
| 0x12145f9 | 0x1214759 | +0x160 | code | bytes compared |  | Inside ship HUD destroy: releases a member widget (unsure) |
| 0x1214779 | 0x12148d9 | +0x160 | code | bytes compared |  | Inside ship HUD destroy: early-exit branch target when not initialized |
| 0x121e980 | 0x121eae0 | +0x160 | code | bytes compared | compat.material | Site in UI text drawing that loads the font material owner global |
| 0x121e994 | 0x121eaf4 | +0x160 | code | bytes compared | compat.font | Site in UI text drawing that loads the font hash global |
| 0x121e9a4 | 0x121eb04 | +0x160 | code | bytes compared | compat.atlas | Site in UI text drawing that loads the font atlas hash global |
| 0x1226ed4 | 0x1227034 | +0x160 | code | bytes compared | render.ui_update_gate_branch | Inside the UI scene manager update: gate branch that skips the UI world simulation |
| 0x1226f60 | 0x12270c0 | +0x160 | code | bytes compared | render.ui_render | UI scene manager render routine |
| 0x1226f66 | 0x12270c6 | +0x160 | code | bytes compared | render.ui_render_gate_branch | Inside the UI scene manager render: gate branch that skips automatic rendering |
| 0x1227097 | 0x12271f7 | +0x160 | code | bytes compared | render.ui_render_world_update_call | Inside the UI scene manager render: call of the render-world update |
| 0x1227230 | 0x1227390 | +0x160 | code | bytes compared | render.actor_visibility | Shows or hides a preview actor slot |
| 0x12276f0 | 0x1227850 | +0x160 | code | bytes compared | thumb.thumb_allocate | Allocates a free thumbnail render group in the preview manager |
| 0x1227f75 | 0x12280d5 | +0x160 | code | bytes compared | thumb.thumb_resource | Inside thumbnail manager setup: stores the atlas render resource and registers it |
| 0x1228090 | 0x12281f0 | +0x160 | code | bytes compared | thumb.thumb_enqueue | Queues a model thumbnail job in a render group, returns its job index |
| 0x1228250 | 0x12283b0 | +0x160 | code | bytes compared | thumb.thumb_submit | Submits a thumbnail render group for rendering |
| 0x12282a0 | 0x1228400 | +0x160 | code | bytes compared | compat.armory_preview_release | Releases a thumbnail render group and its model slots |
| 0x122844e | 0x12285ae | +0x160 | code | bytes compared | render.card_release | Inside the thumbnail manager: releases a card's actor lease when the card completes |
| 0x12287a0 | 0x1228900 | +0x160 | code | predicted | thumb.thumb_global | Checks whether a thumbnail job in a render group is rendered and valid |
| 0x12287e0 | 0x1228940 | +0x160 | code | bytes compared | thumb.thumb_uv | Returns the atlas UV rectangle of a rendered thumbnail job |
| 0x1228937 | 0x1228a97 | +0x160 | code | bytes compared | render.thumbnail_update_phase_branch | Inside the thumbnail manager update: render phase comparison that skips the work |
| 0x1229090 | 0x12291f0 | +0x160 | code | bytes compared | armory.register_image | Registers a UI image element with the thumbnail manager |
| 0x122a530 | 0x122a690 | +0x160 | code | bytes compared | render.pool_release | Releases a thumbnail actor slot (clears its lease bit) |
| 0x122a550 | 0x122a6b0 | +0x160 | code | bytes compared | render.pool_acquire | Acquires a free thumbnail actor slot for a card request |
| 0x122b4a0 | 0x122b600 | +0x160 | code | bytes compared | render.helmet_request_path | Request path the preview actor helmet setter goes through |
| 0x122eed0 | 0x122f030 | +0x160 | code | bytes compared | render.actor_ready | Tests whether a preview actor slot is ready |
| 0x1230790 | 0x12308f0 | +0x160 | code | bytes compared | render.at_0x1399ba0 | Thumbnail preview routine whose purpose is not established (unsure) |
| 0x1233360 | 0x12334c0 | +0x160 | code | bytes compared | render.actor_set_body | Sets a preview actor's body type |
| 0x12333e0 | 0x1233540 | +0x160 | code | bytes compared | render.actor_set_helmet | Sets a preview actor's helmet from a kit id |
| 0x1233a70 | 0x1233bd0 | +0x160 | code | bytes compared | render.offer_to_kit | Reads the progression offer table to map an offer to its kit |
| 0x12573a0 | 0x1257500 | +0x160 | code | bytes compared |  | Requests completion of a corpse (ragdoll to corpse) for an entity |
| 0x12874b0 | 0x1287610 | +0x160 | code | bytes compared |  | Returns whether a peer is a platform friend |
| 0x12890db | 0x128923b | +0x160 | code | bytes compared | comment/metadata: rotation call site | Call site applying an immediate local rotation (Unit API +0x40) |
| 0x128ebe4 | 0x128ed44 | +0x160 | code | bytes compared |  | Inside the per-frame network update: updates the host, client, lobby and join components |
| 0x12945f0 | 0x1294750 | +0x160 | code | bytes compared | compat.armory_preview_open | Armory overview grid: rebuilds its previews when the dirty flag is set |
| 0x12d1a50 | 0x12d1bb0 | +0x160 | code | bytes compared | grid_pattern.animation_stop | Stops a UI widget's animation block |
| 0x12d1e00 | 0x12d1f60 | +0x160 | code | bytes compared |  | UI text widget: clears its format arguments |
| 0x12d3ca0 | 0x12d3e00 | +0x160 | code | bytes compared | timer_label | Sets the localized template key of a UI text control |
| 0x12d4110 | 0x12d4270 | +0x160 | code | bytes compared |  | UI text widget: enables marquee scrolling for text wider than a width |
| 0x12d4660 | 0x12d47c0 | +0x160 | code | bytes compared | armory.text_param | Sets a string parameter on a UI text control |
| 0x12d46e0 | 0x12d4840 | +0x160 | code | bytes compared | timer_number | Sets a numeric parameter on a UI text control |
| 0x12d67c0 | 0x12d6920 | +0x160 | code | bytes compared | sprite_ctor | UI sprite (image) widget constructor |
| 0x12d6c00 | 0x12d6d60 | +0x160 | code | bytes compared | sprite_uv | Sets the UV rectangle of a UI image element |
| 0x12d9430 | 0x12d9590 | +0x160 | code | bytes compared | wheel_label | Sets the localized text key of a UI label widget |
| 0x12db000 | 0x12db160 | +0x160 | code | bytes compared | armory.text_plain | Copies plain text into a UI text control |
| 0x12de550 | 0x12de6b0 | +0x160 | code | bytes compared | widget_init | Base UI widget initializer (widget, type) |
| 0x12de7a0 | 0x12de900 | +0x160 | code | bytes compared |  | UI widget function testing the widget flag bits (unsure) |
| 0x12de806 | 0x12de966 | +0x160 | code | bytes compared |  | Inside a UI widget flag function: branch target when the flag is clear (unsure) |
| 0x12dee70 | 0x12defd0 | +0x160 | code | bytes compared | widget_size | Sets a UI widget's size |
| 0x12df3b0 | 0x12df510 | +0x160 | code | bytes compared | widget_position | Sets a UI widget's position |
| 0x12dfbe0 | 0x12dfd40 | +0x160 | code | bytes compared | widget_scale | Sets a UI widget's scale |
| 0x12dfeb0 | 0x12e0010 | +0x160 | code | bytes compared | rotation_pivot | Sets a UI widget's rotation pivot |
| 0x12e03a0 | 0x12e0500 | +0x160 | code | bytes compared | widget_colour | Sets a UI widget's colour (four floats) |
| 0x12e0580 | 0x12e06e0 | +0x160 | code | bytes compared |  | UI widget function comparing a float against the widget alpha (unsure) |
| 0x12e07e0 | 0x12e0940 | +0x160 | code | bytes compared | widget_opacity | Sets a UI widget's opacity (alpha) |
| 0x12e0816 | 0x12e0976 | +0x160 | code | bytes compared |  | Inside the UI widget opacity setter: branch target for an unordered compare |
| 0x12e0c00 | 0x12e0d60 | +0x160 | code | bytes compared | widget_rotation | Sets a UI widget's rotation |
| 0x12e0f00 | 0x12e1060 | +0x160 | code | bytes compared | widget_order | Sets a UI widget's draw order |
| 0x12e15d0 | 0x12e1730 | +0x160 | code | bytes compared | icon_parameter | Sets a float vector parameter on a UI element's material |
| 0x12e16f0 | 0x12e1850 | +0x160 | code | bytes compared | armory.set_texture | Sets a texture on a named slot of a UI image element |
| 0x12e3fd0 | 0x12e4130 | +0x160 | code | bytes compared | widget_finish | Finalizes a UI widget after construction and attachment |
| 0x12e4011 | 0x12e4171 | +0x160 | code | bytes compared |  | Inside the UI widget finish function: branch target when the child list is empty |
| 0x12e42d0 | 0x12e4430 | +0x160 | code | bytes compared | widget_attach | Attaches a UI widget to a parent widget |
| 0x12e433c | 0x12e449c | +0x160 | code | bytes compared |  | Inside the UI widget attach function: branch target when the child list is empty |
| 0x12e48d0 | 0x12e4a30 | +0x160 | code | bytes compared |  | Releases the children of a UI widget |
| 0x12e4cc0 | 0x12e4e20 | +0x160 | code | bytes compared | widget_visible | Sets a UI widget's visibility (also used for the HUD root) |
| 0x12e5a80 | 0x12e5be0 | +0x160 | code | predicted | widget_release | Releases a UI widget and its resources |
| 0x12e5eb0 | 0x12e6010 | +0x160 | code | bytes compared | armory.text_flush | Lays out a UI text control again after its text changed |
| 0x12e6630 | 0x12e6790 | +0x160 | code | predicted |  | Helper called first by the UI widget release function (unsure) |
| 0x12e6de0 | 0x12e6f40 | +0x160 | code | bytes compared | widget_pivot | Sets a UI widget's pivot |
| 0x12e6e70 | 0x12e6fd0 | +0x160 | code | bytes compared | widget_anchor | Sets a UI widget's anchor |
| 0x12e73f0 | 0x12e7550 | +0x160 | code | predicted | icon_material | Returns the material object of a UI element |
| 0x12e7510 | 0x12e7670 | +0x160 | code | bytes compared | sprite_asset | Assigns a material resource to a UI image element |
| 0x12e7f40 | 0x12e80a0 | +0x160 | code | bytes compared | icon_texture | Sets a UI picture's material and texture from resource ids |
| 0x12e85f0 | 0x12e8750 | +0x160 | code | bytes compared |  | UI widget: sets enabled or disabled |
| 0x12e8ae0 | 0x12e8c40 | +0x160 | code | bytes compared |  | UI widget open/close animation function |
| 0x12ed7a0 | 0x12ed900 | +0x160 | code | bytes compared | compat.armory_commit | Armory commit: copies candidate weapons and appearance to the profile and applies them |
| 0x12ed975 | 0x12edad5 | +0x160 | code | bytes compared | compat.armory_registration | Inside Armory screen setup: registers the Armory controller in the UI manager registry |
| 0x12eec00 | 0x12eed60 | +0x160 | code | bytes compared | compat.armory_preview_tabs | Armory screen: switches the active tab and refreshes its preview grid |
| 0x12ef060 | 0x12ef1c0 | +0x160 | code | bytes compared | compat.armory_selector_scope | Armory screen: opens or closes the item selector |
| 0x12efccb | 0x12efe2b | +0x160 | code | bytes compared | compat.extra_armory_appearance_select | Inside the Armory selection handler: stores the chosen helmet, cape or armor |
| 0x12eff0a | 0x12f006a | +0x160 | code | bytes compared | compat.extra_armory_weapons_select | Inside the Armory selection handler: stores the chosen weapon candidate and commits |
| 0x12eff12 | 0x12f0072 | +0x160 | code | bytes compared | category_branch.CATEGORY_BRANCH | Inside the Armory controller: category branch routing to the selection reader (first site) |
| 0x12efffe | 0x12f015e | +0x160 | code | bytes compared | grid_pattern.selection | Inside the Armory controller: looks up the selected offer in progression |
| 0x12f0098 | 0x12f01f8 | +0x160 | code | bytes compared | category_branch.CATEGORY_BRANCH | Inside the Armory controller: category branch routing to the selection reader (second site) |
| 0x12f0e20 | 0x12f0f80 | +0x160 | code | predicted | compat.armory_preview_refresh | Armory screen: refreshes the weapon/armor overview preview of the current tab |
| 0x12fd4d7 | 0x12fd637 | +0x160 | code | bytes compared | compat.session | Inside Equipment screen setup: loads the session global and resets transition flags |
| 0x12fd4e1 | 0x12fd641 | +0x160 | code | bytes compared | compat.loadout_flags | Inside Equipment screen setup: clears the transition flag bytes |
| 0x12fd501 | 0x12fd661 | +0x160 | code | bytes compared | compat.root | Inside loadout screen setup: reads game-state flags and resets screen fields |
| 0x12fd6d0 | 0x12fd830 | +0x160 | code | bytes compared | compat.loadout_state | Inside Equipment screen setup: resets picker state, then loads the players global |
| 0x12fdbfd | 0x12fdd5d | +0x160 | code | bytes compared | compat.loadout_registration | Inside Equipment screen setup: registers the controller (type 0xE7) with the UI manager |
| 0x1303f96 | 0x13040f6 | +0x160 | code | bytes compared | compat.loadout_view_stratagems | Inside the Equipment screen update: tests for the Equipment view before listing stratagems |
| 0x1306231 | 0x1306391 | +0x160 | code | bytes compared | stratagem_ui_caller | Inside the loadout selection handler: calls the stratagem slot setter, then rebuild |
| 0x130632e | 0x130648e | +0x160 | code | bytes compared | compat.extra_booster_notify_ui | Inside the loadout selection handler: requests the booster and sends its notification |
| 0x13063d7 | 0x1306537 | +0x160 | code | bytes compared | compat.gear_select_ui | Inside the Equipment screen: Apply switch that stores helmet, cape or armor by category |
| 0x1306439 | 0x1306599 | +0x160 | code | bytes compared | compat.weapon_ui_arguments | Inside the loadout selection handler: calls the weapon setter for the chosen category |
| 0x1307a2f | 0x1307b8f | +0x160 | code | bytes compared | compat.local_slot | Inside the Equipment screen: reads the local player's slot and checks the session peer |
| 0x1307a49 | 0x1307ba9 | +0x160 | code | bytes compared | compat.paint_loadout_cache_copy | Inside the loadout screen update: copies the local loadout into the slot cache |
| 0x1307c3a | 0x1307d9a | +0x160 | code | bytes compared | compat.record_peer | Inside the Equipment screen: looks up a peer's player record in a hash map |
| 0x1307c3e | 0x1307d9e | +0x160 | code | bytes compared | compat.extra_player_pending | Inside the loadout screen update: looks up a player's pending equipment state |
| 0x1307d6e | 0x1307ece | +0x160 | code | bytes compared | compat.gear_payload | Inside the Equipment screen: compares gear words and applies changed helmet, cape, armor |
| 0x1307def | 0x1307f4f | +0x160 | code | bytes compared | compat.extra_payload_layout | Inside the loadout screen update: syncs booster and cosmetic selections to player state |
| 0x130810c | 0x130826c | +0x160 | code | bytes compared | compat.player_card_address | Inside the Equipment screen: computes a player card's address (stride 0x1EE18) |
| 0x13089d3 | 0x1308b33 | +0x160 | code | bytes compared | compat.loadout_view_setter | Inside the Equipment view setter: stores the new view and rebuilds its widgets |
| 0x130a1e0 | 0x130a340 | +0x160 | code | bytes compared | compat.deployment_picker_grid | Equipment controller function that forwards to the item picker grid while it is open |
| 0x130c3e6 | 0x130c546 | +0x160 | code | bytes compared |  | Inside the escape screen update: dispatches to the GAME tab content |
| 0x135b4f0 | 0x135b650 | +0x160 | code | bytes compared |  | Enters a menu presenter (pushes it on the UI presenter stack) |
| 0x15a35f0 | 0x15a3750 | +0x160 | code | bytes compared |  | Spawn entity map insertion function |
| 0x15ae780 | 0x15ae8e0 | +0x160 | code | bytes compared |  | Converts a 3x3 basis to a rotation quaternion |
| 0x15b3180 | 0x15b32e0 | +0x160 | code | bytes compared |  | Builds an orientation basis from two direction vectors |
| 0x15c48a3 | 0x15c4a03 | +0x160 | code | bytes compared | compat.paint_profile_base | Inside the profile loadout validation: loads the local profile save buffer |
| 0x15c4f66 | 0x15c50c6 | +0x160 | code | bytes compared | compat.paint_profile_owned | Inside the profile loadout validation: checks ownership of each saved vehicle skin |
| 0x15c5259 | 0x15c53b9 | +0x160 | code | bytes compared | compat.paint_profile_limit | Inside the profile loadout validation: end of the twelve-category skin loop |
| 0x15c52f0 | 0x15c5450 | +0x160 | code | bytes compared | compat.profile_commit | Commits a loadout payload to the local profile save buffer |
| 0x15c53ba | 0x15c551a | +0x160 | code | bytes compared | compat.paint_profile_commit | Inside the profile loadout commit: copies the vehicle skin block into the profile |
| 0x15d945d | 0x15d95bd | +0x160 | code | bytes compared | heat_division | Inside a weapon heat routine: reads a heat definition field before the division |
| 0x15f4620 | 0x15f4780 | +0x160 | code | bytes compared | compat.extra_localized_text | Returns the localized text for a string id through the engine API |
| 0x1608bd0 | 0x1608d30 | +0x160 | code | bytes compared |  | Weapon optic (zoom level) selector function |
| 0x1609f70 | 0x160a0d0 | +0x160 | code | predicted | thumb.reward_label | Builds reward display metadata (type and label) for an item ID |
| 0x1609fa2 | 0x160a102 | +0x160 | code | bytes compared |  | Code site indexing an image-relative lookup table, purpose not established (unsure) |
| 0x160f290 | 0x160f3f0 | +0x160 | code | bytes compared | direction.DIRECTION | Menu direction reader: reads directional navigation input for menus |
| 0x160f3e0 | 0x160f540 | +0x160 | code | bytes compared | thumb.thumb_generate | Creates the thumbnail for a reward item, dispatching by reward type |
| 0x160f557 | 0x160f6b7 | +0x160 | code | bytes compared | thumb.thumb_skin_call | Inside the reward thumbnail generator: vehicle skin branch queuing a model job |
| 0x160fa31 | 0x160fb91 | +0x160 | code | bytes compared | compat.player_title_catalog | Inside the player title renderer: finds the title in the title catalog |
| 0x160faa9 | 0x160fc09 | +0x160 | code | bytes compared | compat.player_title_texture | Inside the player title renderer: gets the title material's texture resource |
| 0x160fb11 | 0x160fc71 | +0x160 | code | bytes compared | compat.title_atlas_query | Inside the player title renderer: queries the GUI atlas for the title texture |
| 0x160fb75 | 0x160fcd5 | +0x160 | code | bytes compared | compat.player_title_tints | Inside the player title renderer: sets the three tint colours on the material |
| 0x16151f0 | 0x1615350 | +0x160 | code | bytes compared |  | UI scroll list: positions the scrollbar thumb |
| 0x16157c0 | 0x1615920 | +0x160 | code | bytes compared |  | UI scroll list: sets the scroll offset (clamped) |
| 0x1615800 | 0x1615960 | +0x160 | code | bytes compared |  | UI scroll list: resets the scroll position |
| 0x1615890 | 0x16159f0 | +0x160 | code | bytes compared |  | UI scroll list: sets the scrollable extent |
| 0x161e00a | 0x161e16a | +0x160 | code | bytes compared | compat.extra_card_label | Inside an item label builder: finds a player card in the card catalog |
| 0x161ef6c | 0x161f0cc | +0x160 | code | bytes compared | compat.extra_title_label | Inside an item label builder: finds a player title in the title catalog |
| 0x1621080 | 0x16211e0 | +0x160 | code | bytes compared |  | UI confirmation dialog: sets up labels and hold-to-confirm |
| 0x162bee0 | 0x162c040 | +0x160 | code | bytes compared |  | UI tab bar: sets the tab labels from a list of string ids |
| 0x1635ac0 | 0x1635c20 | +0x160 | code | bytes compared |  | Constructor of the sibling widget built alongside the weapon-function wheel (unsure) |
| 0x1635b6f | 0x1635ccf | +0x160 | code | bytes compared |  | HUD code addressing the fixed crosshair widget group (+0x110) |
| 0x1635c01 | 0x1635d61 | +0x160 | code | bytes compared |  | HUD code addressing the moving aiming-circle widget group (+0x220) |
| 0x16377f0 | 0x1637950 | +0x160 | code | bytes compared |  | Per-frame update of the sibling widget of the weapon-function wheel (unsure) |
| 0x167be30 | 0x167bf90 | +0x160 | code | bytes compared |  | Options screen: shows or hides the setting description panel |
| 0x167d560 | 0x167d6c0 | +0x160 | code | bytes compared |  | Options row: sets the slider value |
| 0x167fa80 | 0x167fbe0 | +0x160 | code | bytes compared |  | Options row: sets the selected choice index |
| 0x167fb70 | 0x167fcd0 | +0x160 | code | bytes compared |  | Options row: initializes a row widget (position, size, setting) |
| 0x1680750 | 0x16808b0 | +0x160 | code | bytes compared |  | Options row: releases a row widget |
| 0x16809a0 | 0x1680b00 | +0x160 | code | bytes compared |  | Options row: resets a row's layout |
| 0x1682280 | 0x16823e0 | +0x160 | code | predicted |  | Options row: finishes building an accessibility-type row (unsure) |
| 0x1688300 | 0x1688460 | +0x160 | code | bytes compared |  | Options row: finishes building a simple row |
| 0x1693b90 | 0x1693cf0 | +0x160 | code | bytes compared |  | Key bindings page: builds the binding rows |
| 0x1695020 | 0x1695180 | +0x160 | code | bytes compared |  | Key bindings page: resets the row list |
| 0x1697cb0 | 0x1697e10 | +0x160 | code | bytes compared |  | Constructor of the HUD health bar widget |
| 0x169acc0 | 0x169ae20 | +0x160 | code | bytes compared |  | Per-frame update of the HUD health bar widget |
| 0x169f0a0 | 0x169f200 | +0x160 | code | bytes compared |  | Constructor of the HUD stamina bar widget |
| 0x169fde0 | 0x169ff40 | +0x160 | code | bytes compared |  | Per-frame update of the HUD stamina bar widget |
| 0x16a4800 | 0x16a4960 | +0x160 | code | bytes compared |  | Constructor of the weapon-function wheel HUD widget |
| 0x16a6e30 | 0x16a6f90 | +0x160 | code | bytes compared |  | Per-frame update of the weapon-function wheel HUD widget |
| 0x16a9960 | 0x16a9ac0 | +0x160 | code | bytes compared |  | Closes the weapon-function wheel HUD widget |
| 0x16a9a6f | 0x16a9bcf | +0x160 | code | bytes compared |  | Inside the weapon-function wheel close: early-exit target when already closed |
| 0x16aa7e0 | 0x16aa940 | +0x160 | code | bytes compared | wheel_ctor | Constructor of the eight-sector radial (emote) wheel widget |
| 0x16aaa3c | 0x16aab9c | +0x160 | code | bytes compared |  | Inside the radial wheel widget constructor: builds a child primitive widget |
| 0x16aab09 | 0x16aac69 | +0x160 | code | bytes compared |  | Inside the radial wheel widget constructor: branch target skipping material attachment |
| 0x16ab440 | 0x16ab5a0 | +0x160 | code | bytes compared |  | Per-frame update of the radial (drop-item) wheel HUD widget |
| 0x16ac4b0 | 0x16ac610 | +0x160 | code | bytes compared | radial_reader | Radial wheel direction reader: turns pointer input into a selected sector |
| 0x16adfa0 | 0x16ae100 | +0x160 | code | bytes compared |  | Closes or cancels the radial (drop-item) wheel HUD widget |
| 0x16b67c0 | 0x16b6920 | +0x160 | code | bytes compared | card_init | Constructor of a HUD stratagem card widget |
| 0x16b7400 | 0x16b7560 | +0x160 | code | bytes compared | card_update | Per-frame update of a HUD stratagem card widget |
| 0x16ba420 | 0x16ba580 | +0x160 | code | bytes compared | dock_create | Constructor of a HUD stratagem dock card widget (unsure) |
| 0x16baed0 | 0x16bb030 | +0x160 | code | bytes compared | dock_tick | Per-frame tick of a HUD stratagem dock card widget (unsure) |
| 0x16de9d0 | 0x16deb30 | +0x160 | code | pattern match in game | chat_add_line | Adds a line to the HUD chat ring (channel, name colour, name, text colour, text) |
| 0x16e0840 | 0x16e09a0 | +0x160 | code | pattern match in game | chat_show_line | Puts a chat line on screen for a given time (HUD chat feed) |
| 0x16e163d | 0x16e179d | +0x160 | code | bytes compared |  | Inside the chat box: passes the typed text to the chat send |
| 0x17121d8 | 0x1712338 | +0x160 | code | bytes compared | compat.equipment_button_size | Inside equipment button construction: sets the button's size and scale |
| 0x1714820 | 0x1714980 | +0x160 | code | bytes compared | compat.stratagem_icon_layout | Loadout stratagem tile setter: shows a stratagem's icon and colours on a tile |
| 0x171482a | 0x171498a | +0x160 | code | bytes compared | compat.stratagem_slot_value | Inside the loadout stratagem tile setter: stores the stratagem index on the tile |
| 0x1714f60 | 0x17150c0 | +0x160 | code | bytes compared | compat.extra_booster_widget | Sets the booster shown by the loadout card's booster widget |
| 0x1716c40 | 0x1716da0 | +0x160 | code | bytes compared | compat.extra_widget_payload | Loadout card widget payload setter: fills stratagem tiles and booster from a loadout |
| 0x17174fc | 0x171765c | +0x160 | code | bytes compared | compat.stratagem_payload_filter | Inside the loadout widget payload setter: loop over the four stratagem slots |
| 0x1717562 | 0x17176c2 | +0x160 | code | bytes compared | compat.stratagem_slot_address | Inside the loadout widget payload setter: locates a stratagem tile and sets it |
| 0x17175d3 | 0x1717733 | +0x160 | code | bytes compared | compat.extra_widget_booster_call | Inside the loadout widget payload setter: calls the booster widget setter |
| 0x1717770 | 0x17178d0 | +0x160 | code | bytes compared | compat.stratagem_slot_stride | Sets one of four stratagem tiles in the loadout widget from an item ID |
| 0x17178d0 | 0x1717a30 | +0x160 | code | bytes compared | compat.stratagem_rebuild_layout | Rebuilds the loadout widget's stratagem tiles from a loadout payload |
| 0x1719ce0 | 0x1719e40 | +0x160 | code | bytes compared | compat.equipment_tile_render | Repaints the equipment tiles (weapon/armor thumbnails) of a loadout card |
| 0x171a3d0 | 0x171a530 | +0x160 | code | bytes compared | compat.equipment_tile_set | Sets the loadout payload shown by a card's equipment tiles (caches its address) |
| 0x171b605 | 0x171b765 | +0x160 | code | bytes compared | compat.equipment_tile_page | Inside the loadout card page setter: renders equipment tiles when that page opens |
| 0x171c5f9 | 0x171c759 | +0x160 | code | bytes compared | compat.equipment_button_owner | Inside the player card widget: updates the equipment button (card +0x1B820) |
| 0x171c67f | 0x171c7df | +0x160 | code | bytes compared | compat.equipment_button_top_attachment | Inside the player card widget: sets the equipment button's top-centre attachment |
| 0x171d9b0 | 0x171db10 | +0x160 | code | bytes compared | compat.card_refresh | Refreshes a player's loadout card from its loadout payload |
| 0x171dc64 | 0x171ddc4 | +0x160 | code | bytes compared | compat.player_card_payload | Inside the player card payload setter: stores payload, player id and slot |
| 0x171de27 | 0x171df87 | +0x160 | code | bytes compared | compat.extra_card_title_layout | Inside the loadout card refresh: finds the payload's player card in the catalog |
| 0x171e260 | 0x171e3c0 | +0x160 | code | bytes compared | compat.stratagem_set | Loadout card stratagem setter: puts a stratagem in one of four slots |
| 0x171e325 | 0x171e485 | +0x160 | code | bytes compared | stratagem_return | Inside the loadout card stratagem setter: its return instruction |
| 0x171e330 | 0x171e490 | +0x160 | code | bytes compared | compat.stratagem_commit | Rebuilds the loadout card's stratagem widgets after slot changes |
| 0x171e45d | 0x171e5bd | +0x160 | code | bytes compared | compat.stratagem_payload_rebuild | Inside the loadout card stratagem rebuild: calls the widget's tile rebuild |
| 0x171f4a2 | 0x171f602 | +0x160 | code | predicted | compat.equipment_tile_layout | Inside a loadout card update: repaints equipment tiles if their page is visible |
| 0x174fd8c | 0x174feec | +0x160 | code | bytes compared | grid_pattern.header_text | Inside the equipment grid: sets a group header's text template and parameters |
| 0x1750d61 | 0x1750ec1 | +0x160 | code | bytes compared | grid_pattern.equip_audio_source | Inside the equipment grid: compares an offer with the equipped marker for equip sound |
| 0x175248c | 0x17525ec | +0x160 | code | bytes compared | grid_pattern.logical_groups | Inside the equipment grid's logical solver: compares the selected row with group rows |
| 0x17524e0 | 0x1752640 | +0x160 | code | bytes compared | grid_pattern.highlight | Equipment grid function that updates the highlighted item |
| 0x1753a10 | 0x1753b70 | +0x160 | code | bytes compared | grid_pattern.list_clear | Clears the equipment grid's item list and logical model |
| 0x1753dc0 | 0x1753f20 | +0x160 | code | bytes compared | grid_pattern.logical_solver | Equipment grid logical solver: works out rows, groups and selection |
| 0x1755601 | 0x1755761 | +0x160 | code | bytes compared | grid_pattern.list_append | Appends an offer to the equipment grid's item list |
| 0x1755710 | 0x1755870 | +0x160 | code | bytes compared | grid_pattern.list_finish | Finishes the equipment grid's list after items were appended |
| 0x175599c | 0x1755afc | +0x160 | code | bytes compared | compat.extra_booster_selectable_ui | Inside the booster picker UI: calls the selectable predicate for a booster |
| 0x1758400 | 0x1758560 | +0x160 | code | bytes compared | grid_pattern.preview_notify | Notifies the Armory preview manager that the grid selection changed |
| 0x1759617 | 0x1759777 | +0x160 | code | bytes compared | grid_pattern.category_text | Inside the Armory preview manager: sets the category caption for the selected group |
| 0x17597e2 | 0x1759942 | +0x160 | code | bytes compared | compat.extra_booster_offer_lookup | Inside the booster picker UI: looks up a booster's offer in the progression catalog |
| 0x175e7f0 | 0x175e950 | +0x160 | code | bytes compared | compat.extra_armory_character_commit | Applies the Armory's whole character appearance block through the per-field setters |
| 0x175e8ab | 0x175ea0b | +0x160 | code | bytes compared |  | Inside the armour kit loader: handles kit type 1 (helmet) rows |
| 0x175e8f9 | 0x175ea59 | +0x160 | code | bytes compared |  | Inside the armour kit loader: handles kit type 2 (cape) rows |
| 0x175e93d | 0x175ea9d | +0x160 | code | bytes compared |  | Inside the armour kit loader: handles rows of the remaining kit type (unsure) |
| 0x175e956 | 0x175eab6 | +0x160 | code | bytes compared | compat.extra_character_flags | Inside the Armory appearance apply: sets voice pack and locates the player state |
| 0x175ea19 | 0x175eb79 | +0x160 | code | bytes compared | compat.extra_character_selection | Inside the Armory appearance apply: finds the player card index and sets it |
| 0x175ea7c | 0x175ebdc | +0x160 | code | bytes compared | compat.armory_character_profile | Inside the Armory appearance apply: copies the appearance block into the profile |
| 0x1763190 | 0x17632f0 | +0x160 | code | bytes compared | compat.armory_preview_rebuild | Rebuilds the Armory overview's weapon/armor preview thumbnails |
| 0x17789c9 | 0x1778b29 | +0x160 | code | bytes compared |  | Inside the player menu update: advances the KICK hold timer |
| 0x1778aa2 | 0x1778c02 | +0x160 | code | bytes compared |  | Inside the player menu update: kicks the selected card's peer |
| 0x1778f10 | 0x1779070 | +0x160 | code | bytes compared |  | Escape menu GAME tab: updates a player card's state |
| 0x177b6da | 0x177b83a | +0x160 | code | bytes compared |  | Inside the GAME tab update: closes the escape menu on Esc |
| 0x177b705 | 0x177b865 | +0x160 | code | bytes compared |  | Inside the GAME tab update: sets the escape menu presenter's pending-close byte |
| 0x177b7b3 | 0x177b913 | +0x160 | code | bytes compared |  | Inside the GAME tab update: checks the dialog fade before input |
| 0x177b7d6 | 0x177b936 | +0x160 | code | bytes compared |  | Inside the GAME tab update: checks the hidden and dialog flags |
| 0x177b80f | 0x177b96f | +0x160 | code | bytes compared |  | Inside the GAME tab update: checks the panel state |
| 0x177b895 | 0x177b9f5 | +0x160 | code | bytes compared |  | Inside the GAME tab update: handles the focused card's player menu |
| 0x177be35 | 0x177bf95 | +0x160 | code | bytes compared |  | Inside the GAME tab update: handles the confirmation dialog result |
| 0x177bf56 | 0x177c0b6 | +0x160 | code | bytes compared |  | Inside the GAME tab select handler: reads the selected button's type |
| 0x177bfc7 | 0x177c127 | +0x160 | code | bytes compared |  | Inside the GAME tab select handler: switch over the button types |
| 0x177c04c | 0x177c1ac | +0x160 | code | bytes compared |  | Inside the GAME tab select handler: opens the confirmation dialog |
| 0x177c420 | 0x177c580 | +0x160 | code | bytes compared |  | Escape menu GAME tab: focuses a card or button (opens a card's player menu) |
| 0x177c69e | 0x177c7fe | +0x160 | code | bytes compared |  | Inside the GAME tab rebuild: fills the button label table |
| 0x177c6e0 | 0x177c840 | +0x160 | code | bytes compared |  | Inside the GAME tab rebuild: attaches the buttons to the list container |
| 0x177d140 | 0x177d2a0 | +0x160 | code | bytes compared |  | Escape menu GAME tab: rebuilds the button list |
| 0x1797166 | 0x17972c6 | +0x160 | code | bytes compared |  | Inside the Armory armor stat display routine that computes shown stat values (unsure) |
| 0x179d4c0 | 0x179d620 | +0x160 | code | bytes compared | grid_pattern.detail_input | Input handler of the Armory detail view |
| 0x17a26f0 | 0x17a2850 | +0x160 | code | bytes compared | armory.compare_pair | Fills the two panes of the Armory Compare widget from a pair of offers |
| 0x17aaff0 | 0x17ab150 | +0x160 | code | bytes compared | render.model_widget_update | Update of the Armory model widget (sets its image UV every update) |
| 0x17ab0e9 | 0x17ab249 | +0x160 | code | bytes compared | render.model_widget_update_at_0xf9 | Inside the Armory model widget update: call that sets the image UV |
| 0x17ac340 | 0x17ac4a0 | +0x160 | code | bytes compared | armory.show_model | Shows or hides the large Armory preview model |
| 0x17ef5ba | 0x17ef71a | +0x160 | code | bytes compared | compat.gear_catalog_categories | Inside an armor catalog routine: loads the catalog global and reads a kit's category |
| 0x1819740 | 0x18198a0 | +0x160 | code | bytes compared |  | Options screen: hides or shows the content area |
| 0x1819810 | 0x1819970 | +0x160 | code | bytes compared |  | Options screen: updates the content's visual state (opacity) |
| 0x181ac40 | 0x181ada0 | +0x160 | code | bytes compared |  | Options screen: selects a settings category |
| 0x1864110 | 0x1864270 | +0x160 | code | bytes compared | compat.paint_player_selection | Vehicle customisation UI: selects a skin category and loads the player's selection |
| 0x1881236 | 0x1881396 | +0x160 | code | bytes compared | COMPAT_SPEC.weapon_mods_ui_select | Inside the weapon customisation UI: switches the weapon's configuration slot |
| 0x1f8fe10 | 0x1f8ff70 | +0x160 | code | bytes compared | editor exp() and INPUT_PIN | exp() math library function (1013 bytes) |
| 0x205d100 | 0x205d3f0 | +0x2f0 | data | bytes compared |  | Continent id table for the lobby search (7 ids of 4 bytes) |
| 0x205d590 | 0x205d8e0 | +0x350 | data | bytes compared | stratagem_names table | Stratagem internal name pointer table (154 entries) |
| 0x2070f20 | 0x2070f30 | +0x10 | data | bytes compared |  | Constant RGBA float vector: shared second colour of stratagem icons |
| 0x2070f50 | 0x2070f60 | +0x10 | data | bytes compared |  | Constant RGBA float vector: shared third colour of stratagem icons |
| 0x20ea71c | 0x20ea72c | +0x10 | data | bytes compared | amount_key | String constant "amount" (JSON key of the mission report) |
| 0x218d650 | 0x218d660 | +0x10 | data | predicted | wheel_sound_ids | Table of radial wheel sound event ids |
| 0x218d670 | 0x218d680 | +0x10 | data | predicted | wheel_sound_ids_move | Radial wheel move sound event ids (later rows of the same table) |
| 0x2245eec | 0x2245efc | +0x10 | data | bytes compared | near 0.05 constant | Float constant 0.05: the gameplay camera near-clip distance |
| 0x2246230 | 0x2246240 | +0x10 | data | bytes compared |  | Float constant: crouch stance value used by the stance code |
| 0x224650c | 0x224651c | +0x10 | data | bytes compared |  | Float constant: prone stance value used by the stance code |
| 0x22465b4 | 0x22465c4 | +0x10 | data | bytes compared | float 1.0 | Float constant 1.0 used as the UI animation endpoint |
| 0x2246764 | 0x2246774 | +0x10 | data | bytes compared | float pi/2 | Float constant pi/2 (1.5707964) in .rdata |
| 0x22468d8 | 0x22468e8 | +0x10 | data | bytes compared |  | Block of float constants around the dive timeout (movement tuning) |
| 0x22468f0 | 0x2246900 | +0x10 | data | bytes compared | double 1.0 | Double constant 1.0 in .rdata |
| 0x2246958 | 0x2246968 | +0x10 | data | bytes compared |  | Float constant 2.0 near the dive timeout (alternate dive timeout slot) |
| 0x2246968 | 0x2246978 | +0x10 | data | bytes compared |  | Float constant: dive timeout in seconds (2.0) |
| 0x2246fa0 | 0x2246fb0 | +0x10 | data | bytes compared | float 57.2958 | Float constant 57.2958 (radians to degrees) |
| 0x2247884 | 0x2247894 | +0x10 | data | bytes compared | float -1.0 | Float constant -1.0 in .rdata |
| 0x22478b8 | 0x22478c8 | +0x10 | data | bytes compared | float -pi/2 | Float constant -pi/2 (-1.5707964) in .rdata |
| 0x2247aa0 | 0x2247ab0 | +0x10 | data | bytes compared | float -75 | Float constant -75.0 in .rdata |

