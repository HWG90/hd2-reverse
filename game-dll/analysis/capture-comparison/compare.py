from pathlib import Path
import json,re,struct,sys,collections
sys.path.insert(0,'/home/goose/Documents/Codex/2026-10-22/a-2/work/ffi-comparison/python-deps')
from capstone import *
r=Path(__file__).resolve().parent.parent;a=(r/'game-live-20261023T2142.bin').read_bytes();b=(r/'game-live-20261023T2148.bin').read_bytes();e=Path('/home/goose/Documents/ChatGPT/Linux HD2/native-work/evidence/game-26088801.dll').read_bytes()
def holes(name):return {int(x,16)for x in re.findall('unreadable_rva=0x([0-9a-f]+)',(r/(name+'.pages.txt')).read_text())}
x=holes('game-live-20261023T2142.bin');y=holes('game-live-20261023T2148.bin');g=sorted(x-y)
p=struct.unpack_from('<I',b,60)[0];o=p+24;secs=[]
for i in range(struct.unpack_from('<H',b,p+6)[0]):
 at=o+struct.unpack_from('<H',b,p+20)[0]+i*40;name=b[at:at+8].split(b'\0')[0].decode();size,base=struct.unpack_from('<II',b,at+8);secs.append((name,base,base+size))
def section(at):return next((name for name,lo,hi in secs if lo<=at<hi),'headers')
def ranges(pages):
 out=[]
 for v in pages:
  if out and v==out[-1][1]:out[-1][1]+=4096
  else:out.append([v,v+4096])
 return out
changed=[v for v in range(0,len(b),4096)if v not in x and v not in y and a[v:v+4096]!=b[v:v+4096]]
md=Cs(CS_ARCH_X86,CS_MODE_64);md.skipdata=True
calls=collections.Counter();newins=0;strings=[]
with (r/'dump-analysis/newly-readable.asm').open('w')as out:
 for lo,hi in ranges(g):
  out.write(f'\n; NEWLY READABLE RVA {lo:08X}..{hi:08X}\n')
  for at,size,mn,ops in md.disasm_lite(b[lo:hi],lo):
   out.write(f'{at:08X}  {b[at:at+size].hex(" "):<44} {mn:<10} {ops}\n');newins+=mn!='.byte'
   if mn=='call' and ops.startswith('0x'):calls[int(ops,16)]+=1
  for m in re.finditer(rb'[ -~]{16,}',b[lo:hi]):
   s=m[0].decode()
   if re.search(r'[A-Za-z]{5}',s):strings.append({'rva':hex(lo+m.start()),'text':s[:180]})
previous_equal=[v for v in g if len(e)>=v+4096 and e[v:v+4096]==b[v:v+4096]]
previous_zero=[v for v in g if len(e)>=v+4096 and not any(e[v:v+4096])]
summary={'image_bytes':len(b),'gained_pages':len(g),'gained_bytes':len(g)*4096,'lost_pages':len(y-x),'remaining_unreadable_pages':len(y),'gained_sections':dict(collections.Counter(section(v)for v in g)),'changed_readable_sections':dict(collections.Counter(section(v)for v in changed)),'newly_readable_instructions':newins,'contiguous_new_ranges':len(ranges(g)),'largest_new_ranges':[{'start':hex(lo),'end':hex(hi),'bytes':hi-lo}for lo,hi in sorted(ranges(g),key=lambda v:v[1]-v[0],reverse=True)[:15]],'compared_with_prior_evidence':{'file':'/home/goose/Documents/ChatGPT/Linux HD2/native-work/evidence/game-26088801.dll','identical_pages':len(previous_equal),'previously_zero_pages':len(previous_zero),'nonzero_but_different_pages':len(g)-len(previous_equal)-len(previous_zero)},'top_call_targets':[{'rva':hex(v),'calls':n,'newly_readable_target':v-v%4096 in g}for v,n in calls.most_common(20)],'new_ascii_candidates':strings[:30]}
(r/'dump-analysis/summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
