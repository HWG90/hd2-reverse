; preloader.dll 0xA0CF546E, base relocation pass used by the Wine path
; RVA 0x2170-0x238B (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .text:

0000000180002170 <.text+0x1170>:
   180002170:	41 57                	push   r15
   180002172:	41 56                	push   r14
   180002174:	41 55                	push   r13
   180002176:	41 54                	push   r12
   180002178:	56                   	push   rsi
   180002179:	57                   	push   rdi
   18000217a:	55                   	push   rbp
   18000217b:	53                   	push   rbx
   18000217c:	48 83 ec 68          	sub    rsp,0x68
   180002180:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   180002184:	31 c0                	xor    eax,eax
   180002186:	49 89 cf             	mov    r15,rcx
   180002189:	4c 2b 7c 11 30       	sub    r15,QWORD PTR [rcx+rdx*1+0x30]
   18000218e:	0f 84 e6 01 00 00    	je     0x18000237a
   180002194:	4c 8d 04 11          	lea    r8,[rcx+rdx*1]
   180002198:	45 8b 88 b4 00 00 00 	mov    r9d,DWORD PTR [r8+0xb4]
   18000219f:	4d 85 c9             	test   r9,r9
   1800021a2:	0f 84 d2 01 00 00    	je     0x18000237a
   1800021a8:	48 8d 04 11          	lea    rax,[rcx+rdx*1]
   1800021ac:	48 83 c0 30          	add    rax,0x30
   1800021b0:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   1800021b5:	45 8b a8 b0 00 00 00 	mov    r13d,DWORD PTR [r8+0xb0]
   1800021bc:	49 01 cd             	add    r13,rcx
   1800021bf:	4d 01 e9             	add    r9,r13
   1800021c2:	44 89 f8             	mov    eax,r15d
   1800021c5:	c1 e8 10             	shr    eax,0x10
   1800021c8:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
   1800021cc:	48 8d 54 24 34       	lea    rdx,[rsp+0x34]
   1800021d1:	48 8b 1d 70 1e 00 00 	mov    rbx,QWORD PTR [rip+0x1e70]        # 0x180004048
   1800021d8:	48 89 4c 24 60       	mov    QWORD PTR [rsp+0x60],rcx
   1800021dd:	4c 89 4c 24 58       	mov    QWORD PTR [rsp+0x58],r9
   1800021e2:	eb 1a                	jmp    0x1800021fe
   1800021e4:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nop WORD PTR [rax+rax*1+0x0]
   1800021f0:	89 c0                	mov    eax,eax
   1800021f2:	49 01 c5             	add    r13,rax
   1800021f5:	4d 39 cd             	cmp    r13,r9
   1800021f8:	0f 84 0a 01 00 00    	je     0x180002308
   1800021fe:	41 8b 45 04          	mov    eax,DWORD PTR [r13+0x4]
   180002202:	48 85 c0             	test   rax,rax
   180002205:	0f 84 fd 00 00 00    	je     0x180002308
   18000220b:	41 89 c4             	mov    r12d,eax
   18000220e:	41 83 e4 fe          	and    r12d,0xfffffffe
   180002212:	49 83 fc 08          	cmp    r12,0x8
   180002216:	74 d8                	je     0x1800021f0
   180002218:	45 8b 75 00          	mov    r14d,DWORD PTR [r13+0x0]
   18000221c:	49 01 ce             	add    r14,rcx
   18000221f:	be 08 00 00 00       	mov    esi,0x8
   180002224:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nop WORD PTR [rax+rax*1+0x0]
   180002230:	41 0f b7 6c 35 00    	movzx  ebp,WORD PTR [r13+rsi*1+0x0]
   180002236:	81 e5 ff 0f 00 00    	and    ebp,0xfff
   18000223c:	4c 01 f5             	add    rbp,r14
   18000223f:	c7 44 24 34 00 00 00 00 	mov    DWORD PTR [rsp+0x34],0x0
   180002247:	48 89 6c 24 40       	mov    QWORD PTR [rsp+0x40],rbp
   18000224c:	48 c7 44 24 38 01 00 00 00 	mov    QWORD PTR [rsp+0x38],0x1
   180002255:	48 89 d7             	mov    rdi,rdx
   180002258:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   18000225d:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002264:	48 8d 54 24 40       	lea    rdx,[rsp+0x40]
   180002269:	4c 8d 44 24 38       	lea    r8,[rsp+0x38]
   18000226e:	41 b9 04 00 00 00    	mov    r9d,0x4
   180002274:	ff d3                	call   rbx
   180002276:	85 c0                	test   eax,eax
   180002278:	0f 88 fc 00 00 00    	js     0x18000237a
   18000227e:	41 0f b7 4c 35 00    	movzx  ecx,WORD PTR [r13+rsi*1+0x0]
   180002284:	c1 e9 0c             	shr    ecx,0xc
   180002287:	b8 bb 00 00 c0       	mov    eax,0xc00000bb
   18000228c:	83 f9 0a             	cmp    ecx,0xa
   18000228f:	0f 87 e5 00 00 00    	ja     0x18000237a
   180002295:	48 8d 15 48 54 00 00 	lea    rdx,[rip+0x5448]        # 0x1800076e4
   18000229c:	48 63 0c 8a          	movsxd rcx,DWORD PTR [rdx+rcx*4]
   1800022a0:	48 01 d1             	add    rcx,rdx
   1800022a3:	ff e1                	jmp    rcx
   1800022a5:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   1800022a9:	66 01 45 00          	add    WORD PTR [rbp+0x0],ax
   1800022ad:	eb 11                	jmp    0x1800022c0
   1800022af:	44 01 7d 00          	add    DWORD PTR [rbp+0x0],r15d
   1800022b3:	eb 0b                	jmp    0x1800022c0
   1800022b5:	66 44 01 7d 00       	add    WORD PTR [rbp+0x0],r15w
   1800022ba:	eb 04                	jmp    0x1800022c0
   1800022bc:	4c 01 7d 00          	add    QWORD PTR [rbp+0x0],r15
   1800022c0:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   1800022c5:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   1800022ca:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   1800022d1:	48 8d 54 24 40       	lea    rdx,[rsp+0x40]
   1800022d6:	4c 8d 44 24 38       	lea    r8,[rsp+0x38]
   1800022db:	ff d3                	call   rbx
   1800022dd:	85 c0                	test   eax,eax
   1800022df:	0f 88 95 00 00 00    	js     0x18000237a
   1800022e5:	48 83 c6 02          	add    rsi,0x2
   1800022e9:	49 39 f4             	cmp    r12,rsi
   1800022ec:	48 89 fa             	mov    rdx,rdi
   1800022ef:	0f 85 3b ff ff ff    	jne    0x180002230
   1800022f5:	41 8b 45 04          	mov    eax,DWORD PTR [r13+0x4]
   1800022f9:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   1800022fe:	4c 8b 4c 24 58       	mov    r9,QWORD PTR [rsp+0x58]
   180002303:	e9 e8 fe ff ff       	jmp    0x1800021f0
   180002308:	48 89 ce             	mov    rsi,rcx
   18000230b:	48 8b 7c 24 50       	mov    rdi,QWORD PTR [rsp+0x50]
   180002310:	48 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],rdi
   180002315:	48 c7 44 24 38 08 00 00 00 	mov    QWORD PTR [rsp+0x38],0x8
   18000231e:	c7 44 24 34 00 00 00 00 	mov    DWORD PTR [rsp+0x34],0x0
   180002326:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   18000232b:	48 89 d3             	mov    rbx,rdx
   18000232e:	48 8d 54 24 40       	lea    rdx,[rsp+0x40]
   180002333:	4c 8d 44 24 38       	lea    r8,[rsp+0x38]
   180002338:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   18000233f:	41 b9 04 00 00 00    	mov    r9d,0x4
   180002345:	ff 15 fd 1c 00 00    	call   QWORD PTR [rip+0x1cfd]        # 0x180004048
   18000234b:	85 c0                	test   eax,eax
   18000234d:	78 2b                	js     0x18000237a
   18000234f:	48 89 37             	mov    QWORD PTR [rdi],rsi
   180002352:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   180002357:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   18000235c:	48 8d 54 24 40       	lea    rdx,[rsp+0x40]
   180002361:	4c 8d 44 24 38       	lea    r8,[rsp+0x38]
   180002366:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   18000236d:	ff 15 d5 1c 00 00    	call   QWORD PTR [rip+0x1cd5]        # 0x180004048
   180002373:	89 c1                	mov    ecx,eax
   180002375:	c1 f8 1f             	sar    eax,0x1f
   180002378:	21 c8                	and    eax,ecx
   18000237a:	48 83 c4 68          	add    rsp,0x68
   18000237e:	5b                   	pop    rbx
   18000237f:	5d                   	pop    rbp
   180002380:	5f                   	pop    rdi
   180002381:	5e                   	pop    rsi
   180002382:	41 5c                	pop    r12
   180002384:	41 5d                	pop    r13
   180002386:	41 5e                	pop    r14
   180002388:	41 5f                	pop    r15
   18000238a:	c3                   	ret
