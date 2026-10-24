"""Capture inside the game when idle; merge only newly readable pages with provenance."""
from pathlib import Path
import json,re,struct,hashlib,os,sys,datetime,fcntl,importlib.util,gzip,shutil
ROOT=Path(__file__).resolve().parent.parent
OUT=ROOT/'game-recovery';OUT.mkdir(exist_ok=True)
INBOX=Path('/mnt/WORMHOLE/SteamLibrary/steamapps/compatdata/553850/pfx/drive_c/users/steamuser/AppData/Local/LinksLinkToMemory')
def atomic(path,data):
 temp=path.with_suffix(path.suffix+'.tmp');temp.write_bytes(data);temp.replace(path)
def merge(path,retain=False):
 report=Path(str(path)+'.pages.txt');text=report.read_text();header=re.search(r'base=0x([0-9a-f]+) size=(\d+) stamp=([0-9a-f]+)',text);footer=re.search(r'complete_bytes=(\d+) zero_filled_bytes=(\d+)',text)
 assert header and footer,'Incomplete capture'
 base,size,stamp=int(header[1],16),int(header[2]),header[3];data=path.read_bytes();assert len(data)==size==int(footer[1]);pe=struct.unpack_from('<I',data,60)[0];assert data[pe:pe+4]==b'PE\0\0';assert struct.unpack_from('<I',data,pe+8)[0]==int(stamp,16)
 holes={int(x,16)//4096 for x in re.findall('unreadable_rva=0x([0-9a-f]+)',text)};assert len(holes)*4096==int(footer[2])
 series=OUT/(stamp+'-'+hex(base)[2:]);series.mkdir(exist_ok=True);statefile=series/'coverage.json';merged=series/'game-merged.bin';count=(size+4095)//4096
 state=json.loads(statefile.read_text())if statefile.exists()else {'build':stamp,'base':hex(base),'size':size,'pages':[None]*count,'captures':[],'note':'Composite of readable pages observed at different times, not a coherent runtime snapshot or proof of decryption. Never mixed across bases or builds.'}
 assert state['size']==size and len(state['pages'])==count
 image=bytearray(merged.read_bytes())if merged.exists()else bytearray(size);sha=hashlib.sha256(data).hexdigest()
 if any(x['sha256']==sha for x in state['captures']):return {'status':'already_merged','series':str(series)}
 source=len(state['captures']);gained=[]
 for i in range(count):
  if i in holes or state['pages'][i] is not None:continue
  image[i*4096:(i+1)*4096]=data[i*4096:(i+1)*4096];state['pages'][i]=source;gained.append(i)
 capture={'source':str(path),'sha256':sha,'captured_at':datetime.datetime.fromtimestamp(path.stat().st_mtime,datetime.timezone.utc).isoformat(),'gained_pages':len(gained),'readable_pages':count-len(holes),'report':str(report)}
 if retain and gained:
  archive=series/(path.name+'.gz')
  with gzip.open(archive,'wb',compresslevel=3)as dst:dst.write(data)
  capture['archive']=str(archive)
 state['captures'].append(capture);state['recovered_pages']=sum(x is not None for x in state['pages']);state['missing_pages']=count-state['recovered_pages'];state['merged_sha256']=hashlib.sha256(image).hexdigest()
 atomic(merged,image);atomic(statefile,(json.dumps(state,indent=2)+'\n').encode())
 missing=''.join('missing_rva=0x%X size=%d\n'%(i*4096,min(4096,size-i*4096))for i,x in enumerate(state['pages'])if x is None);atomic(series/'missing-pages.txt',missing.encode())
 return {'status':'merged','gained_pages':len(gained),'recovered_pages':state['recovered_pages'],'missing_pages':state['missing_pages'],'total_pages':count,'image':str(merged),'coverage':str(statefile)}
def capture():
 games=[]
 for d in Path('/proc').iterdir():
  if not d.name.isdigit():continue
  try:
   cmd=(d/'cmdline').read_bytes().split(b'\0')[0].decode(errors='replace')
   if cmd.lower().endswith('helldivers2.exe')and (d/'stat').read_text().split()[2]!='Z':games.append(d.name)
  except OSError:pass
 if len(games)!=1:return {'status':'quiet','reason':'No single active game process'}
 spec=importlib.util.spec_from_file_location('recovery_driver','/home/goose/.config/hd2arsenal/mods/Links-Link-to-Memory-0.5.1-CFFI-26088801/Tools/llm.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.FOLDER=str(INBOX)
 if not re.search(r'(done batch|loaded, waiting)',m.status()):return {'status':'quiet','reason':'Driver busy or disabled'}
 # Hold the shared driver lock from idle check through command completion.
 with m.command_lock(1):
  if not re.search(r'(done batch|loaded, waiting)',m.status()):return {'status':'quiet','reason':'Driver became busy'}
  now=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ');path=OUT/('capture-'+now+'.bin');windows='Z:'+str(path).replace('\\','/');dll='Z:'+str(ROOT/'relay-tools/dump_module_pages.dll')
  script="ffi.cdef('int GD_begin(const char *path); int GD_step(void); void GD_cancel(void);')\nlocal lib=ffi.load(%s);assert(lib.GD_begin(%s)==1,'Capture start failed');return function()local v=lib.GD_step();assert(v>=0,'Capture failed');return v==1 end,function()lib.GD_cancel()end\n"%(json.dumps(dll),json.dumps(windows))
  (INBOX/'scripts/recovery_capture.lua').write_text(script)
  # run() takes the same non-reentrant lock; use its underlying implementation here.
  result=m._run_commands(['run recovery_capture'],timeout=10)
  assert result is not None,'Driver internal runner unavailable'
  (OUT/('capture-'+now+'.log')).write_text(result)
  if ' error:' in result:raise RuntimeError(result)
 result=merge(path,retain=True);path.unlink();return result
lock=(OUT/'recovery.lock').open('a+')
try:fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
except BlockingIOError:print(json.dumps({'status':'quiet','reason':'Recovery already active'}));sys.exit(0)
if '--seed' in sys.argv:
 for p in sorted(ROOT.glob('game-live-*.bin')):
  if Path(str(p)+'.pages.txt').exists():print(json.dumps(merge(p)))
else:
 try:print(json.dumps(capture()))
 except TimeoutError as e:print(json.dumps({'status':'deferred','reason':str(e)}))
