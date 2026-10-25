; preloader.dll 0xA0CF546E, real export ordinal 1 target
; RVA 0x37E0-0x381A (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .text:

00000001800037e0 <.text+0x27e0>:
   1800037e0:	56                   	push   rsi
   1800037e1:	57                   	push   rdi
   1800037e2:	53                   	push   rbx
   1800037e3:	48 83 ec 20          	sub    rsp,0x20
   1800037e7:	4c 89 c6             	mov    rsi,r8
   1800037ea:	89 d7                	mov    edi,edx
   1800037ec:	48 89 cb             	mov    rbx,rcx
   1800037ef:	e8 9c eb ff ff       	call   0x180002390
   1800037f4:	4c 8d 0d 4d 68 00 00 	lea    r9,[rip+0x684d]        # 0x18000a048
   1800037fb:	48 8b 05 76 68 00 00 	mov    rax,QWORD PTR [rip+0x6876]        # 0x18000a078
   180003802:	81 cf 00 00 00 80    	or     edi,0x80000000
   180003808:	48 89 d9             	mov    rcx,rbx
   18000380b:	89 fa                	mov    edx,edi
   18000380d:	49 89 f0             	mov    r8,rsi
   180003810:	48 83 c4 20          	add    rsp,0x20
   180003814:	5b                   	pop    rbx
   180003815:	5f                   	pop    rdi
   180003816:	5e                   	pop    rsi
   180003817:	48 ff e0             	rex.W jmp rax
