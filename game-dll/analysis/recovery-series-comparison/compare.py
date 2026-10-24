#!/usr/bin/env python3
"""Compare same-build mapped images without merging different bases."""
import argparse,json,struct,hashlib,collections
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('previous',type=Path);p.add_argument('current',type=Path);p.add_argument('output',type=Path);a=p.parse_args();a.output.mkdir(parents=True,exist_ok=True)
def read(d):
 c=json.loads((d/'coverage.json').read_text());b=(d/'game-merged.bin').read_bytes();assert hashlib.sha256(b).hexdigest()==c['merged_sha256'];return c,b
oc,old=read(a.previous);nc,new=read(a.current);assert oc['build']==nc['build'] and len(old)==len(new)
pe=struct.unpack_from('<I',old,60)[0];ns=struct.unpack_from('<H',old,pe+6)[0];opt=struct.unpack_from('<H',old,pe+20)[0];sections=[]
for i in range(ns):
 s=pe+24+opt+i*40;name=old[s:s+8].split(b'\0')[0].decode();size,rva=struct.unpack_from('<II',old,s+8);flags=struct.unpack_from('<I',old,s+36)[0];sections.append((name,rva,size,bool(flags&0x20000000)))
def sec(p):return next((s[0] for s in sections if s[1]<=p<s[1]+s[2]),'headers/other')
def executable(p):return any(s[3] and s[1]<=p<s[1]+s[2] for s in sections)
gained=[i for i,v in enumerate(nc['pages']) if v is not None and oc['pages'][i] is None];not_current=[i for i,v in enumerate(oc['pages']) if v is not None and nc['pages'][i] is None];common=[i for i,v in enumerate(nc['pages']) if v is not None and oc['pages'][i] is not None]
# Parse only a fully readable relocation directory; normalize supported DIR64 slots.
rva,size=struct.unpack_from('<II',old,pe+24+112+5*8);relocs=[];complete=bool(size and rva+size<=len(old) and all(oc['pages'][i] is not None for i in range(rva//4096,(rva+size-1)//4096+1)))
if complete:
 pos=rva
 while pos<rva+size:
  page,block=struct.unpack_from('<II',old,pos)
  if block<8 or block%2 or pos+block>rva+size:complete=False;break
  for q in range(pos+8,pos+block,2):
   e=struct.unpack_from('<H',old,q)[0]
   if e>>12==10:relocs.append(page+(e&4095))
   elif e>>12 not in (0,):complete=False
  pos+=block
norm=bytearray(new);delta=int(nc['base'],16)-int(oc['base'],16)
if complete:
 for p in relocs:
  if p+8<=len(norm) and all(nc['pages'][i] is not None for i in range(p//4096,(p+7)//4096+1)):
   v=struct.unpack_from('<Q',norm,p)[0];struct.pack_into('<Q',norm,p,(v-delta)&((1<<64)-1))
changed=[i for i in common if old[i*4096:(i+1)*4096]!=new[i*4096:(i+1)*4096]];remaining=[i for i in common if old[i*4096:(i+1)*4096]!=norm[i*4096:(i+1)*4096]]
def group(xs):return dict(collections.Counter(sec(i*4096) for i in xs))
result={'previous':{'series':a.previous.name,'sha256':oc['merged_sha256'],'base':oc['base'],'recovered_pages':oc['recovered_pages']},'current':{'series':a.current.name,'sha256':nc['merged_sha256'],'base':nc['base'],'recovered_pages':nc['recovered_pages']},'newly_readable_pages':len(gained),'newly_readable_by_section':group(gained),'new_executable_pages':[hex(i*4096) for i in gained if executable(i*4096)],'new_page_rvas':[hex(i*4096) for i in gained],'previous_only_pages':len(not_current),'common_readable_pages':len(common),'raw_changed_common_pages':len(changed),'relocation_directory_complete':complete,'dir64_slots':len(relocs),'base_delta':hex(delta),'changed_after_dir64_normalization':len(remaining),'normalized_changed_by_section':group(remaining),'normalized_changed_executable_pages':[hex(i*4096) for i in remaining if executable(i*4096)],'limitations':['Different bases remain separate; no cross-series merge performed.','DIR64 normalization is not a general semantic equivalence test.','Dynamic values and runtime pointers may still differ.']}
(a.output/'comparison.json').write_text(json.dumps(result,indent=2)+'\n');(a.output/'previous.coverage.json').write_text(json.dumps(oc,indent=2)+'\n');(a.output/'current.coverage.json').write_text(json.dumps(nc,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if not isinstance(v,list)},indent=2))
