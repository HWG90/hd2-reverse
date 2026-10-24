from pathlib import Path
import json,math,collections,sys,re
sys.path.insert(0,'/home/goose/Documents/Codex/2026-10-22/a-2/work/ffi-comparison/python-deps')
from capstone import *
from capstone.x86_const import X86_OP_MEM,X86_REG_RIP
r=Path(__file__).resolve().parent.parent;d=json.loads((r/'game-dump-comparison.json').read_text());a=Path('/home/goose/Documents/ChatGPT/Linux HD2/native-work/evidence/game-26088801.dll').read_bytes();b=(r/'game-live-20261023T2148.bin').read_bytes();pages=[int(x,16)for x in d['newly_readable_rvas']if a[int(x,16):int(x,16)+4096]!=b[int(x,16):int(x,16)+4096]]
def entropy(s):return -sum(n/len(s)*math.log2(n/len(s))for n in collections.Counter(s).values())
md=Cs(CS_ARCH_X86,CS_MODE_64);md.detail=True;md.skipdata=True
refs=[];stats=[];invalid=[0,0]
with (r/'dump-analysis/new-to-research.asm').open('w')as out:
 for p in pages:
  stats.append({'rva':hex(p),'old_entropy':round(entropy(a[p:p+4096]),3),'new_entropy':round(entropy(b[p:p+4096]),3)})
  out.write(f'\n; NEW TO PRIOR RESEARCH RVA {p:08X}\n')
  for ins in md.disasm(b[p:p+4096],p):
   out.write(f'{ins.address:08X} {ins.bytes.hex(" "):<44} {ins.mnemonic:<10} {ins.op_str}\n')
   if ins.id==0:invalid[1]+=ins.size;continue
   for op in ins.operands:
    if op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP:
     dest=ins.address+ins.size+op.mem.disp
     if 0<=dest<len(b):
      raw=b[dest:dest+180].split(b'\0')[0]
      if 5<=len(raw)<180 and all(32<=v<127 for v in raw)and re.search(rb'[A-Za-z]{4}',raw):refs.append({'instruction_rva':hex(ins.address),'target_rva':hex(dest),'text':raw.decode()})
  for _,size,mn,_ in md.disasm_lite(a[p:p+4096],p):
   if mn=='.byte':invalid[0]+=size
summary={'pages':len(pages),'bytes':len(pages)*4096,'old_mean_entropy':sum(v['old_entropy']for v in stats)/len(stats),'new_mean_entropy':sum(v['new_entropy']for v in stats)/len(stats),'undecodable_bytes_old_new':invalid,'page_stats':stats,'string_references':refs}
(r/'dump-analysis/new-code-details.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items()if k!='page_stats'},indent=2))
