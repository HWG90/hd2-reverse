"""Disassemble readable executable ranges in a mapped PE image; never decode dump holes."""
from pathlib import Path
import struct,json,re,hashlib,sys,csv,bisect
sys.path.insert(0,'/home/goose/Documents/Codex/2026-10-22/a-2/work/ffi-comparison/python-deps')
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
ROOT=Path(__file__).resolve().parent
src=ROOT.parent/'game-live-20261023T2142.bin';blob=src.read_bytes();report=Path(str(src)+'.pages.txt').read_text()
u16=lambda o:struct.unpack_from('<H',blob,o)[0]
u32=lambda o:struct.unpack_from('<I',blob,o)[0]
u64=lambda o:struct.unpack_from('<Q',blob,o)[0]
pe=u32(60);assert blob[pe:pe+4]==b'PE\0\0' and u16(pe+4)==0x8664
opt=pe+24;preferred=u64(opt+24);actual=int(re.search(r'base=0x([0-9a-f]+)',report)[1],16)
holes=[(int(a,16),int(a,16)+int(n))for a,n in re.findall(r'unreadable_rva=0x([0-9a-f]+) size=(\d+)',report)]
holes.sort();hole_starts=[x for x,y in holes];hole_ends=[y for x,y in holes]
def readable(a,z):
 i=bisect.bisect_right(hole_ends,a)
 return i==len(holes) or hole_starts[i]>=z
sections=[]
for i in range(u16(pe+6)):
 o=opt+u16(pe+20)+i*40
 name=blob[o:o+8].split(b'\0')[0].decode(errors='replace');size,rva=u32(o+8),u32(o+12)
 sections.append({'name':name,'rva':rva,'virtual_size':size,'characteristics':u32(o+36)})
functions=[];exception_rva,exception_size=u32(opt+112+24),u32(opt+112+28)
metadata_source='exception directory'
if exception_rva+exception_size>len(blob):
 pdata=next(x for x in sections if x['name']=='.pdata');exception_rva,exception_size=pdata['rva'],pdata['virtual_size'];metadata_source='.pdata section (exception directory points outside image)'
 print(metadata_source,flush=True)
for at in range(exception_rva,exception_rva+exception_size-11,12):
 if not readable(at,at+12):continue
 start,end,unwind=struct.unpack_from('<III',blob,at)
 if 0<start<end<=len(blob):functions.append((start,end,unwind))
with (ROOT/'functions.csv').open('w')as f:
 w=csv.writer(f);w.writerow(['start_rva','end_rva','unwind_rva','fully_readable'])
 for a,z,u in functions:w.writerow([hex(a),hex(z),hex(u),readable(a,z)])
startset=set(a for a,_,_ in functions);starts=sorted(startset);md=Cs(CS_ARCH_X86,CS_MODE_64);md.skipdata=True
results=[]
for section in sections:
 if not section['characteristics']&0x20000000:continue
 lo=section['rva'];hi=min(len(blob),lo+section['virtual_size']);cuts=sorted(set([lo,hi]+[max(lo,min(hi,x))for pair in holes for x in pair if lo<x<hi]))
 path=ROOT/(section['name'].strip('.')+'.asm');instructions=bytes_decoded=missing=0
 with path.open('w')as out:
  out.write('; x86-64 mapped-image disassembly. Addresses are RVAs, not file offsets.\n; Actual VA = '+hex(actual)+' + RVA; preferred VA = '+hex(preferred)+' + RVA.\n; Unwind metadata labels are boundaries, not recovered symbols.\n; Linear decoding can interpret embedded data as instructions. .byte means undecodable data.\n')
  for a,z in zip(cuts,cuts[1:]):
   if not readable(a,z):out.write(f'\n; UNREADABLE GAP RVA 0x{a:X}..0x{z:X} ({z-a} bytes); zero-filled in source dump.\n');missing+=z-a;continue
   points=[a]+starts[bisect.bisect_right(starts,a):bisect.bisect_left(starts,z)]+[z]
   out.write(f'\n; READABLE RVA 0x{a:X}..0x{z:X}\n')
   for begin,end in zip(points,points[1:]):
    if begin in startset:out.write(f'\nsub_{begin:08X}:\n')
    for addr,size,mnemonic,operands in md.disasm_lite(blob[begin:end],begin):
     raw=blob[addr:addr+size].hex(' ');out.write(f'{addr:08X}  {raw:<44}  {mnemonic:<10} {operands}\n');bytes_decoded+=size;instructions+=mnemonic!='.byte'
 row={**section,'file':path.name,'readable_bytes_disassembled':bytes_decoded,'unreadable_bytes_skipped':missing,'instructions':instructions};results.append(row);print(json.dumps(row),flush=True)
summary={'source':str(src),'sha256':hashlib.sha256(blob).hexdigest(),'actual_base':hex(actual),'preferred_base':hex(preferred),'function_records':len(functions),'function_metadata_source':metadata_source,'executable_sections':results,'limitations':['Mapped-image RVAs; not original PE disk offsets','Protected zero-filled pages excluded','Linear decoding may interpret embedded data as code','Function labels from readable x64 unwind metadata; no original symbols recovered']}
(ROOT/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
