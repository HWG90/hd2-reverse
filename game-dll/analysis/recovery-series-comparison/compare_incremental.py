#!/usr/bin/env python3
"""Check pages added after an exact coverage snapshot against retained research."""
import argparse,json,hashlib
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('previous_series',type=Path);p.add_argument('current_series',type=Path);p.add_argument('baseline_coverage',type=Path);p.add_argument('older_research',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
def load(d):
 c=json.loads((d/'coverage.json').read_text());b=(d/'game-merged.bin').read_bytes();assert hashlib.sha256(b).hexdigest()==c['merged_sha256'];return c,b
oc,old=load(a.previous_series);c,new=load(a.current_series);baseline=json.loads(a.baseline_coverage.read_text());prior=a.older_research.read_bytes();assert baseline['base']==c['base'] and baseline['build']==c['build']==oc['build'];added=[i for i,v in enumerate(c['pages']) if v is not None and baseline['pages'][i] is None];rows=[]
for i in added:
 p=i*4096;s=new[p:p+4096];rows.append({'rva':hex(p),'sha256':hashlib.sha256(s).hexdigest(),'capture_source':c['pages'][i],'present_in_previous_series':oc['pages'][i] is not None,'same_bytes_as_previous_series':oc['pages'][i] is not None and s==old[p:p+4096],'same_bytes_as_older_research':s==prior[p:p+4096]})
r={'baseline_pages':baseline['recovered_pages'],'baseline_image_sha256':baseline['merged_sha256'],'current_pages':c['recovered_pages'],'current_image_sha256':c['merged_sha256'],'previous_image_sha256':oc['merged_sha256'],'older_research_sha256':hashlib.sha256(prior).hexdigest(),'added_pages':len(rows),'pages':rows,'normalization':'None required for equality reported here: exact page-byte comparison. No cross-base merge.'};a.output.write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'added_pages':len(rows),'same_as_previous':sum(v['same_bytes_as_previous_series'] for v in rows),'same_as_older_research':sum(v['same_bytes_as_older_research'] for v in rows)}))
