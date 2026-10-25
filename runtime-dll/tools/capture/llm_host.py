"""Shared LLtM host helpers for runtime.dll research (read-only toward the game)."""
import sys
sys.path.insert(0, "/home/goose/.config/hd2arsenal/mods/Links-Link-to-Memory-0.5.1-CFFI-26088801/Tools")
import llm  # noqa: E402
llm.FOLDER = "/mnt/WORMHOLE/SteamLibrary/steamapps/compatdata/553850/pfx/drive_c/users/steamuser/AppData/Local/LinksLinkToMemory"

def regions_lua(start, size):
    """One-line Lua that walks VirtualQuery regions over [start, start+size)."""
    return ("eval local a=%d local e=a+%d local t={} while a<e do local r=region(a) if not r then "
            "t[#t+1]=fmt('noinfo %%X',a) break end t[#t+1]=fmt('R %%X %%X %%X %%X %%X %%X',r.base,r.size,r.alloc,r.state,r.protection,r.type) "
            "if r.base+r.size<=a then break end a=r.base+r.size end return table.concat(t,' | ')") % (start, size)

def regions(start, size, timeout=30):
    import re
    text = llm.run([regions_lua(start, size)], timeout=timeout)
    out = []
    for m in re.finditer(r"R ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+) ([0-9A-F]+)", text):
        b, s, al, st, pr, ty = (int(x, 16) for x in m.groups())
        out.append(dict(base=b, size=s, alloc=al, state=st, protect=pr, type=ty))
    return out, text
