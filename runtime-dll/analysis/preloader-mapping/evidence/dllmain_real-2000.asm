; preloader.dll 0xA0CF546E, real DllMain target
; RVA 0x2000-0x2034 (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .text:

0000000180002000 <.text+0x1000>:
   180002000:	56                   	push   rsi
   180002001:	57                   	push   rdi
   180002002:	53                   	push   rbx
   180002003:	48 83 ec 20          	sub    rsp,0x20
   180002007:	4c 89 c6             	mov    rsi,r8
   18000200a:	89 d7                	mov    edi,edx
   18000200c:	48 89 cb             	mov    rbx,rcx
   18000200f:	e8 7c 03 00 00       	call   0x180002390
   180002014:	4c 8d 0d 2d 80 00 00 	lea    r9,[rip+0x802d]        # 0x18000a048
   18000201b:	48 8b 05 56 80 00 00 	mov    rax,QWORD PTR [rip+0x8056]        # 0x18000a078
   180002022:	48 89 d9             	mov    rcx,rbx
   180002025:	89 fa                	mov    edx,edi
   180002027:	49 89 f0             	mov    r8,rsi
   18000202a:	48 83 c4 20          	add    rsp,0x20
   18000202e:	5b                   	pop    rbx
   18000202f:	5f                   	pop    rdi
   180002030:	5e                   	pop    rsi
   180002031:	48 ff e0             	rex.W jmp rax
