#!/usr/bin/env python3
"""Read-only, coverage-aware material/shader evidence extraction. Requires capstone 5.x."""
import argparse,gzip,hashlib,json,re,struct
from pathlib import Path
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
from capstone.x86_const import X86_OP_MEM,X86_REG_RIP
ap=argparse.ArgumentParser();ap.add_argument('image',type=Path);ap.add_argument('coverage',type=Path);ap.add_argument('--output',type=Path,default=Path('material-shader-evidence'));ap.add_argument('--prior',type=Path,help='Optional older mapped research image');args=ap.parse_args()
b=gzip.decompress(args.image.read_bytes()) if args.image.suffix=='.gz' else args.image.read_bytes();c=json.loads(args.coverage.read_text());assert hashlib.sha256(b).hexdigest()==c['merged_sha256'],'Image and coverage mismatch'
out=args.output;out.mkdir(parents=True,exist_ok=True);md=Cs(CS_ARCH_X86,CS_MODE_64);md.detail=True;md.skipdata=True
ranges={'material_variable_apply': (10392416, 10393184), 'material_variable_propagation': (10393184, 10393473), 'material_variable_growth': (10399168, 10399488), 'material_swap_apply': (10401088, 10401247), 'material_swap_growth_prefix': (10403760, 10403840), 'wind_parameter_submission': (15476464, 15477439), 'wind_update_callsite': (11351136, 11351196), 'brush_shader_type_registration': (27019584, 27019638), 'shader_effect_type_registration': (27452016, 27452070), 'shader_property_binding': (26810642, 26810829)}
results={};targets={v[0] for k,v in ranges.items() if 'callsite' not in k};calls={hex(t):[] for t in targets}
for m in re.finditer(b'\xe8',b[0x1000:0x1f99000]):
 p=m.start()+0x1000
 if p+5>len(b) or any(c['pages'][x//4096] is None for x in (p,p+4)):continue
 t=p+5+struct.unpack_from('<i',b,p+1)[0]
 if t in targets:calls[hex(t)].append(hex(p))
for name,(lo,hi) in ranges.items():
 pages=range(lo//4096,(hi-1)//4096+1);missing=[hex(p*4096) for p in pages if c['pages'][p] is None];assert not missing,(name,missing)
 refs=[];lines=[];edges=[]
 for i in md.disasm(b[lo:hi],lo):
  lines.append(f'{i.address:08x}  {i.bytes.hex():<32} {i.mnemonic:<8} {i.op_str}')
  if not i.id:continue
  if i.mnemonic in ('call','jmp') and i.operands and i.operands[0].type==2:edges.append({'site':hex(i.address),'kind':i.mnemonic,'target':hex(i.operands[0].imm)})
  for op in i.operands:
   if op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP:refs.append({'site':hex(i.address),'target':hex(i.address+i.size+op.mem.disp)})
 (out/(name+'.asm')).write_text('\n'.join(lines)+'\n')
 results[name]={'start':hex(lo),'end_exclusive':hex(hi),'sha256':hashlib.sha256(b[lo:hi]).hexdigest(),'coverage_sources':{hex(p*4096):c['pages'][p] for p in pages},'direct_edges':edges,'rip_references':refs,'boundary_status':'candidate; no usable unwind metadata'}
if args.prior:
 prior=args.prior.read_bytes()
 for name,(lo,hi) in ranges.items():results[name]['identical_to_prior_research']=prior[lo:hi]==b[lo:hi]
(out/'evidence.json').write_text(json.dumps({'image_sha256':hashlib.sha256(b).hexdigest(),'recovered_pages':c['recovered_pages'],'ranges':results,'direct_call_byte_candidates':calls,'call_scan_limit':'E8 byte scan; callers require instruction-boundary inspection; indirect and tail calls are not included'},indent=2)+'\n')
print(json.dumps({'ranges':len(results),'recovered_pages':c['recovered_pages'],'image_sha256':hashlib.sha256(b).hexdigest()}))
