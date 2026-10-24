#!/usr/bin/env python3
"""Offline extraction of bounded code witnesses from LLtM read-only captures."""
import argparse,re,json,hashlib,struct
from pathlib import Path
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
p=argparse.ArgumentParser();p.add_argument('logs',nargs='+',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args();a.output.mkdir(parents=True,exist_ok=True)
md=Cs(CS_ARCH_X86,CS_MODE_64);manifest={'note':'Raw pointer/table observations are session-specific. Code ranges are live witnesses, not full executable recovery.','captures':[],'chunks':[]}
ends={0x1401f50e0:0x1401f511a,0x1401f6b70:0x1401f6b8a,0x1401f6bc0:0x1401f6bfa,0x1402de660:0x1402de665,0x1402de670:0x1402de675,0x1402de680:0x1402de685,0x1402de690:0x1402de695,0x140503c00:0x140503cc6,0x140503db0:0x140503e7a,0x140503e80:0x140503f51,0x140503f60:0x140504028,0x140313780:0x1403137a3,0x1403137b0:0x1403137bb,0x140669450:0x1406694da}
for log in a.logs:
 text=log.read_text();manifest['captures'].append({'file':log.name,'sha256':hashlib.sha256(log.read_bytes()).hexdigest(),'targets':[{'interface_offset':int(g),'slot':int(o),'va':hex(int(v))} for g,o,v in re.findall(r'TARGET (\d+) (\d+) (\d+)',text)]})
 for va,h in re.findall(r'CODE (\d+) ([a-f0-9]+)',text):
  va=int(va);raw=bytes.fromhex(h);item={'va':hex(va),'exe_rva':hex(va-0x140000000),'read_bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'log':log.name}
  if va==0x140000000:
   assert raw[:2]==b'MZ';pe=struct.unpack_from('<I',raw,60)[0];assert raw[pe:pe+4]==b'PE\0\0';item['pe_timestamp']=hex(struct.unpack_from('<I',raw,pe+8)[0]);item['image_size']=hex(struct.unpack_from('<I',raw,pe+24+56)[0])
  if va in ends:
   size=ends[va]-va;assert size<=len(raw);lines=[f'{i.address-0x140000000:08x} {i.bytes.hex():<32} {i.mnemonic:<8} {i.op_str}' for i in md.disasm(raw[:size],va)];(a.output/(f'exe-{va-0x140000000:x}.asm')).write_text('\n'.join(lines)+'\n');item['listing_bytes']=size
  else:item['listing_status']='Not emitted: data table, header or unbounded witness'
  manifest['chunks'].append(item)
(a.output/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps([v for v in manifest['chunks'] if 'pe_timestamp' in v]))
