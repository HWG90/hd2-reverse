; preloader.dll 0xA0CF546E, initialisation: Wine check and runtime.dll mapping
; RVA 0x2390-0x3494 (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .text:

0000000180002390 <.text+0x1390>:
   180002390:	41 57                	push   r15
   180002392:	41 56                	push   r14
   180002394:	41 55                	push   r13
   180002396:	41 54                	push   r12
   180002398:	56                   	push   rsi
   180002399:	57                   	push   rdi
   18000239a:	55                   	push   rbp
   18000239b:	53                   	push   rbx
   18000239c:	48 81 ec 78 05 00 00 	sub    rsp,0x578
   1800023a3:	44 0f 29 84 24 60 05 00 00 	movaps XMMWORD PTR [rsp+0x560],xmm8
   1800023ac:	0f 29 bc 24 50 05 00 00 	movaps XMMWORD PTR [rsp+0x550],xmm7
   1800023b4:	0f 29 b4 24 40 05 00 00 	movaps XMMWORD PTR [rsp+0x540],xmm6
   1800023bc:	48 83 3d 7c 7c 00 00 00 	cmp    QWORD PTR [rip+0x7c7c],0x0        # 0x18000a040
   1800023c4:	75 58                	jne    0x18000241e
   1800023c6:	48 c7 84 24 40 01 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x140],0x0
   1800023d2:	65 48 8b 04 25 30 00 00 00 	mov    rax,QWORD PTR gs:0x30
   1800023db:	48 8b 40 60          	mov    rax,QWORD PTR [rax+0x60]
   1800023df:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   1800023e3:	48 8d 94 24 40 01 00 00 	lea    rdx,[rsp+0x140]
   1800023eb:	ff 15 bf 1c 00 00    	call   QWORD PTR [rip+0x1cbf]        # 0x1800040b0
   1800023f1:	48 8b 84 24 40 01 00 00 	mov    rax,QWORD PTR [rsp+0x140]
   1800023f9:	48 85 c0             	test   rax,rax
   1800023fc:	75 19                	jne    0x180002417
   1800023fe:	48 8b 0d ab 1c 00 00 	mov    rcx,QWORD PTR [rip+0x1cab]        # 0x1800040b0
   180002405:	48 8d 94 24 40 01 00 00 	lea    rdx,[rsp+0x140]
   18000240d:	ff d1                	call   rcx
   18000240f:	48 8b 84 24 40 01 00 00 	mov    rax,QWORD PTR [rsp+0x140]
   180002417:	48 89 05 22 7c 00 00 	mov    QWORD PTR [rip+0x7c22],rax        # 0x18000a040
   18000241e:	48 8b 35 3b 1c 00 00 	mov    rsi,QWORD PTR [rip+0x1c3b]        # 0x180004060
   180002425:	66 bf 01 00          	mov    di,0x1
   180002429:	eb 14                	jmp    0x18000243f
   18000242b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   180002430:	ff d6                	call   rsi
   180002432:	31 c0                	xor    eax,eax
   180002434:	66 f0 0f b1 3d 83 7d 00 00 	lock cmpxchg WORD PTR [rip+0x7d83],di        # 0x18000a1c0
   18000243d:	74 1a                	je     0x180002459
   18000243f:	0f b7 05 7a 7d 00 00 	movzx  eax,WORD PTR [rip+0x7d7a]        # 0x18000a1c0
   180002446:	66 83 f8 01          	cmp    ax,0x1
   18000244a:	74 e4                	je     0x180002430
   18000244c:	0f b7 c0             	movzx  eax,ax
   18000244f:	83 f8 02             	cmp    eax,0x2
   180002452:	75 de                	jne    0x180002432
   180002454:	e9 b9 0f 00 00       	jmp    0x180003412
   180002459:	48 c7 84 24 e8 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0xe8],0x0
   180002465:	48 8b 0d d4 7b 00 00 	mov    rcx,QWORD PTR [rip+0x7bd4]        # 0x18000a040
   18000246c:	0f 28 35 cd 2e 00 00 	movaps xmm6,XMMWORD PTR [rip+0x2ecd]        # 0x180005340
   180002473:	0f 29 b4 24 40 01 00 00 	movaps XMMWORD PTR [rsp+0x140],xmm6
   18000247b:	c6 84 24 50 01 00 00 00 	mov    BYTE PTR [rsp+0x150],0x0
   180002483:	c7 84 24 f0 00 00 00 10 00 11 00 	mov    DWORD PTR [rsp+0xf0],0x110010
   18000248e:	4c 8d a4 24 40 01 00 00 	lea    r12,[rsp+0x140]
   180002496:	4c 89 a4 24 f8 00 00 00 	mov    QWORD PTR [rsp+0xf8],r12
   18000249e:	48 c7 84 24 90 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   1800024aa:	48 8b 35 67 1b 00 00 	mov    rsi,QWORD PTR [rip+0x1b67]        # 0x180004018
   1800024b1:	48 8d 94 24 f0 00 00 00 	lea    rdx,[rsp+0xf0]
   1800024b9:	31 ed                	xor    ebp,ebp
   1800024bb:	4c 8d 8c 24 90 00 00 00 	lea    r9,[rsp+0x90]
   1800024c3:	45 31 c0             	xor    r8d,r8d
   1800024c6:	ff d6                	call   rsi
   1800024c8:	48 8b 9c 24 90 00 00 00 	mov    rbx,QWORD PTR [rsp+0x90]
   1800024d0:	48 8b 0d 69 7b 00 00 	mov    rcx,QWORD PTR [rip+0x7b69]        # 0x18000a040
   1800024d7:	0f 10 3d 2d 31 00 00 	movups xmm7,XMMWORD PTR [rip+0x312d]        # 0x18000560b
   1800024de:	0f 11 bc 24 4b 01 00 00 	movups XMMWORD PTR [rsp+0x14b],xmm7
   1800024e6:	44 0f 28 05 12 31 00 00 	movaps xmm8,XMMWORD PTR [rip+0x3112]        # 0x180005600
   1800024ee:	44 0f 29 84 24 40 01 00 00 	movaps XMMWORD PTR [rsp+0x140],xmm8
   1800024f7:	c7 84 24 f0 00 00 00 1a 00 1b 00 	mov    DWORD PTR [rsp+0xf0],0x1b001a
   180002502:	4c 89 a4 24 f8 00 00 00 	mov    QWORD PTR [rsp+0xf8],r12
   18000250a:	48 c7 84 24 90 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   180002516:	48 8d 94 24 f0 00 00 00 	lea    rdx,[rsp+0xf0]
   18000251e:	4c 8d 8c 24 90 00 00 00 	lea    r9,[rsp+0x90]
   180002526:	45 31 c0             	xor    r8d,r8d
   180002529:	ff d6                	call   rsi
   18000252b:	48 8b 84 24 90 00 00 00 	mov    rax,QWORD PTR [rsp+0x90]
   180002533:	48 85 c0             	test   rax,rax
   180002536:	74 59                	je     0x180002591
   180002538:	66 c7 84 24 80 00 00 00 00 00 	mov    WORD PTR [rsp+0x80],0x0
   180002542:	66 c7 84 24 c0 00 00 00 00 00 	mov    WORD PTR [rsp+0xc0],0x0
   18000254c:	48 8d 94 24 80 00 00 00 	lea    rdx,[rsp+0x80]
   180002554:	4c 8d 84 24 c0 00 00 00 	lea    r8,[rsp+0xc0]
   18000255c:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002563:	ff d0                	call   rax
   180002565:	0f b7 84 24 80 00 00 00 	movzx  eax,WORD PTR [rsp+0x80]
   18000256d:	3d 64 86 00 00       	cmp    eax,0x8664
   180002572:	0f 94 c1             	sete   cl
   180002575:	85 c0                	test   eax,eax
   180002577:	0f 94 c0             	sete   al
   18000257a:	08 c8                	or     al,cl
   18000257c:	0f b7 8c 24 c0 00 00 00 	movzx  ecx,WORD PTR [rsp+0xc0]
   180002584:	81 f9 64 aa 00 00    	cmp    ecx,0xaa64
   18000258a:	40 0f 94 c5          	sete   bpl
   18000258e:	40 20 c5             	and    bpl,al
   180002591:	48 85 db             	test   rbx,rbx
   180002594:	0f 84 1f 02 00 00    	je     0x1800027b9
   18000259a:	48 8b 3d 9f 7a 00 00 	mov    rdi,QWORD PTR [rip+0x7a9f]        # 0x18000a040
   1800025a1:	48 89 bc 24 e8 00 00 00 	mov    QWORD PTR [rsp+0xe8],rdi
   1800025a9:	48 85 ff             	test   rdi,rdi
   1800025ac:	0f 84 2d 02 00 00    	je     0x1800027df
   1800025b2:	0f 29 b4 24 40 01 00 00 	movaps XMMWORD PTR [rsp+0x140],xmm6
   1800025ba:	c6 84 24 50 01 00 00 00 	mov    BYTE PTR [rsp+0x150],0x0
   1800025c2:	c7 84 24 f0 00 00 00 10 00 11 00 	mov    DWORD PTR [rsp+0xf0],0x110010
   1800025cd:	4c 89 a4 24 f8 00 00 00 	mov    QWORD PTR [rsp+0xf8],r12
   1800025d5:	48 c7 84 24 90 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   1800025e1:	48 8d 94 24 f0 00 00 00 	lea    rdx,[rsp+0xf0]
   1800025e9:	48 8d b4 24 90 00 00 00 	lea    rsi,[rsp+0x90]
   1800025f1:	48 89 f9             	mov    rcx,rdi
   1800025f4:	45 31 c0             	xor    r8d,r8d
   1800025f7:	49 89 f1             	mov    r9,rsi
   1800025fa:	ff 15 18 1a 00 00    	call   QWORD PTR [rip+0x1a18]        # 0x180004018
   180002600:	48 83 bc 24 90 00 00 00 00 	cmp    QWORD PTR [rsp+0x90],0x0
   180002609:	0f 85 83 02 00 00    	jne    0x180002892
   18000260f:	0f 11 bc 24 4b 01 00 00 	movups XMMWORD PTR [rsp+0x14b],xmm7
   180002617:	44 0f 29 84 24 40 01 00 00 	movaps XMMWORD PTR [rsp+0x140],xmm8
   180002620:	c7 84 24 f0 00 00 00 1a 00 1b 00 	mov    DWORD PTR [rsp+0xf0],0x1b001a
   18000262b:	4c 89 a4 24 f8 00 00 00 	mov    QWORD PTR [rsp+0xf8],r12
   180002633:	48 c7 84 24 90 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   18000263f:	48 8d 94 24 f0 00 00 00 	lea    rdx,[rsp+0xf0]
   180002647:	4c 8d 8c 24 90 00 00 00 	lea    r9,[rsp+0x90]
   18000264f:	48 89 f9             	mov    rcx,rdi
   180002652:	45 31 c0             	xor    r8d,r8d
   180002655:	ff 15 bd 19 00 00    	call   QWORD PTR [rip+0x19bd]        # 0x180004018
   18000265b:	48 8b 84 24 90 00 00 00 	mov    rax,QWORD PTR [rsp+0x90]
   180002663:	48 85 c0             	test   rax,rax
   180002666:	74 59                	je     0x1800026c1
   180002668:	66 c7 84 24 80 00 00 00 00 00 	mov    WORD PTR [rsp+0x80],0x0
   180002672:	66 c7 84 24 c0 00 00 00 00 00 	mov    WORD PTR [rsp+0xc0],0x0
   18000267c:	48 8d 94 24 80 00 00 00 	lea    rdx,[rsp+0x80]
   180002684:	4c 8d 84 24 c0 00 00 00 	lea    r8,[rsp+0xc0]
   18000268c:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002693:	ff d0                	call   rax
   180002695:	0f b7 84 24 80 00 00 00 	movzx  eax,WORD PTR [rsp+0x80]
   18000269d:	3d 64 86 00 00       	cmp    eax,0x8664
   1800026a2:	0f 95 c1             	setne  cl
   1800026a5:	85 c0                	test   eax,eax
   1800026a7:	0f 95 c0             	setne  al
   1800026aa:	84 c1                	test   cl,al
   1800026ac:	75 13                	jne    0x1800026c1
   1800026ae:	0f b7 84 24 c0 00 00 00 	movzx  eax,WORD PTR [rsp+0xc0]
   1800026b6:	3d 64 aa 00 00       	cmp    eax,0xaa64
   1800026bb:	0f 84 cc 0d 00 00    	je     0x18000348d
   1800026c1:	48 c7 84 24 50 01 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x150],0x0
   1800026cd:	48 c7 84 24 f0 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0xf0],0x0
   1800026d9:	48 c7 84 24 40 01 00 00 10 00 00 00 	mov    QWORD PTR [rsp+0x140],0x10
   1800026e5:	48 c7 84 24 48 01 00 00 01 00 00 00 	mov    QWORD PTR [rsp+0x148],0x1
   1800026f1:	48 8d 94 24 40 01 00 00 	lea    rdx,[rsp+0x140]
   1800026f9:	4c 8d 8c 24 f0 00 00 00 	lea    r9,[rsp+0xf0]
   180002701:	48 89 f9             	mov    rcx,rdi
   180002704:	41 b8 03 00 00 00    	mov    r8d,0x3
   18000270a:	ff 15 00 19 00 00    	call   QWORD PTR [rip+0x1900]        # 0x180004010
   180002710:	85 c0                	test   eax,eax
   180002712:	0f 88 2c 0d 00 00    	js     0x180003444
   180002718:	48 c7 84 24 90 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x90],0x0
   180002724:	c7 84 24 80 00 00 00 00 00 00 00 	mov    DWORD PTR [rsp+0x80],0x0
   18000272f:	48 8b 94 24 f0 00 00 00 	mov    rdx,QWORD PTR [rsp+0xf0]
   180002737:	4c 8d 84 24 90 00 00 00 	lea    r8,[rsp+0x90]
   18000273f:	4c 8d 8c 24 80 00 00 00 	lea    r9,[rsp+0x80]
   180002747:	48 89 f9             	mov    rcx,rdi
   18000274a:	ff 15 b0 18 00 00    	call   QWORD PTR [rip+0x18b0]        # 0x180004000
   180002750:	85 c0                	test   eax,eax
   180002752:	0f 88 ec 0c 00 00    	js     0x180003444
   180002758:	b8 0c 00 11 e1       	mov    eax,0xe111000c
   18000275d:	83 bc 24 80 00 00 00 40 	cmp    DWORD PTR [rsp+0x80],0x40
   180002765:	0f 82 d9 0c 00 00    	jb     0x180003444
   18000276b:	48 8b 8c 24 90 00 00 00 	mov    rcx,QWORD PTR [rsp+0x90]
   180002773:	66 83 39 40          	cmp    WORD PTR [rcx],0x40
   180002777:	0f 82 c7 0c 00 00    	jb     0x180003444
   18000277d:	66 83 79 02 18       	cmp    WORD PTR [rcx+0x2],0x18
   180002782:	0f 82 bc 0c 00 00    	jb     0x180003444
   180002788:	81 79 28 bd 04 ef fe 	cmp    DWORD PTR [rcx+0x28],0xfeef04bd
   18000278f:	0f 85 af 0c 00 00    	jne    0x180003444
   180002795:	8b 51 30             	mov    edx,DWORD PTR [rcx+0x30]
   180002798:	8b 41 34             	mov    eax,DWORD PTR [rcx+0x34]
   18000279b:	48 89 d1             	mov    rcx,rdx
   18000279e:	48 c1 e1 20          	shl    rcx,0x20
   1800027a2:	48 09 c8             	or     rax,rcx
   1800027a5:	81 fa 02 00 05 00    	cmp    edx,0x50002
   1800027ab:	73 45                	jae    0x1800027f2
   1800027ad:	48 8d 0d fc 30 00 00 	lea    rcx,[rip+0x30fc]        # 0x1800058b0
   1800027b4:	e9 ab 00 00 00       	jmp    0x180002864
   1800027b9:	48 8d 8c 24 e8 00 00 00 	lea    rcx,[rsp+0xe8]
   1800027c1:	e8 4a 0d 00 00       	call   0x180003510
   1800027c6:	85 c0                	test   eax,eax
   1800027c8:	0f 88 76 0c 00 00    	js     0x180003444
   1800027ce:	48 8b bc 24 e8 00 00 00 	mov    rdi,QWORD PTR [rsp+0xe8]
   1800027d6:	48 85 ff             	test   rdi,rdi
   1800027d9:	0f 85 d3 fd ff ff    	jne    0x1800025b2
   1800027df:	4c 8d 05 1a d8 ff ff 	lea    r8,[rip+0xffffffffffffd81a]        # 0x180000000
   1800027e6:	b9 00 00 11 e1       	mov    ecx,0xe1110000
   1800027eb:	b2 01                	mov    dl,0x1
   1800027ed:	e8 be 0d 00 00       	call   0x1800035b0
   1800027f2:	81 fa 00 00 06 00    	cmp    edx,0x60000
   1800027f8:	73 09                	jae    0x180002803
   1800027fa:	48 8d 0d c7 30 00 00 	lea    rcx,[rip+0x30c7]        # 0x1800058c8
   180002801:	eb 61                	jmp    0x180002864
   180002803:	75 09                	jne    0x18000280e
   180002805:	48 8d 0d d4 30 00 00 	lea    rcx,[rip+0x30d4]        # 0x1800058e0
   18000280c:	eb 56                	jmp    0x180002864
   18000280e:	31 c9                	xor    ecx,ecx
   180002810:	81 fa 01 00 06 00    	cmp    edx,0x60001
   180002816:	4c 8d 05 db 30 00 00 	lea    r8,[rip+0x30db]        # 0x1800058f8
   18000281d:	49 0f 44 c8          	cmove  rcx,r8
   180002821:	81 fa 02 00 06 00    	cmp    edx,0x60002
   180002827:	72 3b                	jb     0x180002864
   180002829:	75 09                	jne    0x180002834
   18000282b:	48 8d 0d de 30 00 00 	lea    rcx,[rip+0x30de]        # 0x180005910
   180002832:	eb 30                	jmp    0x180002864
   180002834:	31 c9                	xor    ecx,ecx
   180002836:	81 fa 03 00 06 00    	cmp    edx,0x60003
   18000283c:	48 8d 15 e5 30 00 00 	lea    rdx,[rip+0x30e5]        # 0x180005928
   180002843:	48 0f 44 ca          	cmove  rcx,rdx
   180002847:	76 1b                	jbe    0x180002864
   180002849:	48 89 c2             	mov    rdx,rax
   18000284c:	48 c1 ea 1b          	shr    rdx,0x1b
   180002850:	31 c9                	xor    ecx,ecx
   180002852:	48 81 fa 05 00 40 01 	cmp    rdx,0x1400005
   180002859:	48 8d 15 e0 30 00 00 	lea    rdx,[rip+0x30e0]        # 0x180005940
   180002860:	48 0f 42 ca          	cmovb  rcx,rdx
   180002864:	48 ba 00 00 00 d8 ff ff f5 ff 	movabs rdx,0xfff5ffffd8000000
   18000286e:	48 01 d0             	add    rax,rdx
   180002871:	48 3d 00 00 63 1d    	cmp    rax,0x1d630000
   180002877:	73 09                	jae    0x180002882
   180002879:	48 8d 0d d8 30 00 00 	lea    rcx,[rip+0x30d8]        # 0x180005958
   180002880:	eb 05                	jmp    0x180002887
   180002882:	48 85 c9             	test   rcx,rcx
   180002885:	74 0b                	je     0x180002892
   180002887:	8b 41 10             	mov    eax,DWORD PTR [rcx+0x10]
   18000288a:	85 c0                	test   eax,eax
   18000288c:	0f 88 b2 0b 00 00    	js     0x180003444
   180002892:	4c 8d 2d 67 d7 ff ff 	lea    r13,[rip+0xffffffffffffd767]        # 0x180000000
   180002899:	48 8d 94 24 30 01 00 00 	lea    rdx,[rsp+0x130]
   1800028a1:	4c 89 e9             	mov    rcx,r13
   1800028a4:	ff 15 5e 17 00 00    	call   QWORD PTR [rip+0x175e]        # 0x180004008
   1800028aa:	85 c0                	test   eax,eax
   1800028ac:	0f 88 92 0b 00 00    	js     0x180003444
   1800028b2:	4c 8b b4 24 30 01 00 00 	mov    r14,QWORD PTR [rsp+0x130]
   1800028ba:	45 0f b7 7e 48       	movzx  r15d,WORD PTR [r14+0x48]
   1800028bf:	49 83 c7 18          	add    r15,0x18
   1800028c3:	65 48 8b 04 25 30 00 00 00 	mov    rax,QWORD PTR gs:0x30
   1800028cc:	48 8b 40 60          	mov    rax,QWORD PTR [rax+0x60]
   1800028d0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
   1800028d4:	31 d2                	xor    edx,edx
   1800028d6:	4d 89 f8             	mov    r8,r15
   1800028d9:	ff 15 89 17 00 00    	call   QWORD PTR [rip+0x1789]        # 0x180004068
   1800028df:	48 85 c0             	test   rax,rax
   1800028e2:	0f 84 7f 0b 00 00    	je     0x180003467
   1800028e8:	49 83 c6 48          	add    r14,0x48
   1800028ec:	48 89 05 95 77 00 00 	mov    QWORD PTR [rip+0x7795],rax        # 0x18000a088
   1800028f3:	66 44 89 3d 87 77 00 00 	mov    WORD PTR [rip+0x7787],r15w        # 0x18000a082
   1800028fb:	4c 8d 3d 7e 77 00 00 	lea    r15,[rip+0x777e]        # 0x18000a080
   180002902:	4c 89 f9             	mov    rcx,r15
   180002905:	4c 89 f2             	mov    rdx,r14
   180002908:	ff 15 6a 17 00 00    	call   QWORD PTR [rip+0x176a]        # 0x180004078
   18000290e:	0f 10 05 1b 2a 00 00 	movups xmm0,XMMWORD PTR [rip+0x2a1b]        # 0x180005330
   180002915:	0f 29 84 24 80 00 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm0
   18000291d:	66 c7 44 24 5a 00 00 	mov    WORD PTR [rsp+0x5a],0x0
   180002924:	4c 8d 84 24 80 00 00 00 	lea    r8,[rsp+0x80]
   18000292c:	4c 8d 4c 24 5a       	lea    r9,[rsp+0x5a]
   180002931:	b9 01 00 00 00       	mov    ecx,0x1
   180002936:	4c 89 fa             	mov    rdx,r15
   180002939:	ff 15 61 17 00 00    	call   QWORD PTR [rip+0x1761]        # 0x1800040a0
   18000293f:	85 c0                	test   eax,eax
   180002941:	0f 85 33 0b 00 00    	jne    0x18000347a
   180002947:	0f b7 44 24 5a       	movzx  eax,WORD PTR [rsp+0x5a]
   18000294c:	83 c0 02             	add    eax,0x2
   18000294f:	0f b7 c0             	movzx  eax,ax
   180002952:	66 89 05 27 77 00 00 	mov    WORD PTR [rip+0x7727],ax        # 0x18000a080
   180002959:	48 8d 0d 20 77 00 00 	lea    rcx,[rip+0x7720]        # 0x18000a080
   180002960:	48 8b 15 21 77 00 00 	mov    rdx,QWORD PTR [rip+0x7721]        # 0x18000a088
   180002967:	d1 e8                	shr    eax,1
   180002969:	ff c0                	inc    eax
   18000296b:	66 c7 04 42 00 00    	mov    WORD PTR [rdx+rax*2],0x0
   180002971:	48 8d 15 98 41 00 00 	lea    rdx,[rip+0x4198]        # 0x180006b10
   180002978:	ff 15 f2 16 00 00    	call   QWORD PTR [rip+0x16f2]        # 0x180004070
   18000297e:	85 c0                	test   eax,eax
   180002980:	0f 88 be 0a 00 00    	js     0x180003444
   180002986:	48 8b 0d fb 76 00 00 	mov    rcx,QWORD PTR [rip+0x76fb]        # 0x18000a088
   18000298d:	4c 8d 35 fc 76 00 00 	lea    r14,[rip+0x76fc]        # 0x18000a090
   180002994:	4c 89 f2             	mov    rdx,r14
   180002997:	45 31 c0             	xor    r8d,r8d
   18000299a:	45 31 c9             	xor    r9d,r9d
   18000299d:	ff 15 ed 16 00 00    	call   QWORD PTR [rip+0x16ed]        # 0x180004090
   1800029a3:	85 c0                	test   eax,eax
   1800029a5:	0f 88 99 0a 00 00    	js     0x180003444
   1800029ab:	48 c7 84 24 e0 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0xe0],0x0
   1800029b7:	0f 57 c0             	xorps  xmm0,xmm0
   1800029ba:	0f 29 84 24 c0 00 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm0
   1800029c2:	c7 84 24 f0 00 00 00 30 00 00 00 	mov    DWORD PTR [rsp+0xf0],0x30
   1800029cd:	48 c7 84 24 f8 00 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0xf8],0x0
   1800029d9:	c7 84 24 08 01 00 00 40 00 00 00 	mov    DWORD PTR [rsp+0x108],0x40
   1800029e4:	4c 89 b4 24 00 01 00 00 	mov    QWORD PTR [rsp+0x100],r14
   1800029ec:	0f 11 84 24 10 01 00 00 	movups XMMWORD PTR [rsp+0x110],xmm0
   1800029f4:	c7 44 24 28 00 00 00 00 	mov    DWORD PTR [rsp+0x28],0x0
   1800029fc:	c7 44 24 20 05 00 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   180002a04:	48 8d 8c 24 e0 00 00 00 	lea    rcx,[rsp+0xe0]
   180002a0c:	4c 8d 84 24 f0 00 00 00 	lea    r8,[rsp+0xf0]
   180002a14:	4c 8d 8c 24 c0 00 00 00 	lea    r9,[rsp+0xc0]
   180002a1c:	ba 21 00 10 00       	mov    edx,0x100021
   180002a21:	ff 15 19 16 00 00    	call   QWORD PTR [rip+0x1619]        # 0x180004040
   180002a27:	85 c0                	test   eax,eax
   180002a29:	0f 88 15 0a 00 00    	js     0x180003444
   180002a2f:	48 c7 44 24 50 00 00 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   180002a38:	48 c7 44 24 68 00 00 00 00 	mov    QWORD PTR [rsp+0x68],0x0
   180002a41:	48 85 db             	test   rbx,rbx
   180002a44:	48 89 bc 24 20 01 00 00 	mov    QWORD PTR [rsp+0x120],rdi
   180002a4c:	0f 84 b9 01 00 00    	je     0x180002c0b
   180002a52:	89 6c 24 5c          	mov    DWORD PTR [rsp+0x5c],ebp
   180002a56:	48 89 9c 24 d8 00 00 00 	mov    QWORD PTR [rsp+0xd8],rbx
   180002a5e:	4c 8b b4 24 e0 00 00 00 	mov    r14,QWORD PTR [rsp+0xe0]
   180002a66:	0f 57 c0             	xorps  xmm0,xmm0
   180002a69:	0f 29 84 24 90 00 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm0
   180002a71:	48 c7 44 24 60 00 00 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   180002a7a:	48 8d 44 24 60       	lea    rax,[rsp+0x60]
   180002a7f:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   180002a84:	4c 89 64 24 28       	mov    QWORD PTR [rsp+0x28],r12
   180002a89:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   180002a8e:	48 c7 44 24 40 00 00 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   180002a97:	c7 44 24 30 00 02 00 00 	mov    DWORD PTR [rsp+0x30],0x200
   180002a9f:	4c 89 f1             	mov    rcx,r14
   180002aa2:	31 d2                	xor    edx,edx
   180002aa4:	45 31 c0             	xor    r8d,r8d
   180002aa7:	45 31 c9             	xor    r9d,r9d
   180002aaa:	ff 15 a0 15 00 00    	call   QWORD PTR [rip+0x15a0]        # 0x180004050
   180002ab0:	85 c0                	test   eax,eax
   180002ab2:	0f 88 74 05 00 00    	js     0x18000302c
   180002ab8:	b8 2f 01 00 c0       	mov    eax,0xc000012f
   180002abd:	66 81 bc 24 40 01 00 00 4d 5a 	cmp    WORD PTR [rsp+0x140],0x5a4d
   180002ac7:	0f 85 5f 05 00 00    	jne    0x18000302c
   180002acd:	48 63 8c 24 7c 01 00 00 	movsxd rcx,DWORD PTR [rsp+0x17c]
   180002ad5:	b8 7b 00 00 c0       	mov    eax,0xc000007b
   180002ada:	81 bc 0c 40 01 00 00 50 45 00 00 	cmp    DWORD PTR [rsp+rcx*1+0x140],0x4550
   180002ae5:	0f 85 41 05 00 00    	jne    0x18000302c
   180002aeb:	48 89 8c 24 b0 00 00 00 	mov    QWORD PTR [rsp+0xb0],rcx
   180002af3:	66 81 bc 0c 58 01 00 00 0b 02 	cmp    WORD PTR [rsp+rcx*1+0x158],0x20b
   180002afd:	0f 85 29 05 00 00    	jne    0x18000302c
   180002b03:	48 bb 00 f0 ff ff 01 00 00 00 	movabs rbx,0x1fffff000
   180002b0d:	48 8b 8c 24 20 01 00 00 	mov    rcx,QWORD PTR [rsp+0x120]
   180002b15:	8b 41 3c             	mov    eax,DWORD PTR [rcx+0x3c]
   180002b18:	8b 44 08 50          	mov    eax,DWORD PTR [rax+rcx*1+0x50]
   180002b1c:	48 89 ce             	mov    rsi,rcx
   180002b1f:	48 81 e6 00 00 e0 ff 	and    rsi,0xffffffffffe00000
   180002b26:	48 8d 3c 01          	lea    rdi,[rcx+rax*1]
   180002b2a:	48 81 c7 ff ff 1f 00 	add    rdi,0x1fffff
   180002b31:	48 81 e7 00 00 e0 ff 	and    rdi,0xffffffffffe00000
   180002b38:	49 89 f5             	mov    r13,rsi
   180002b3b:	49 81 ed 00 00 00 80 	sub    r13,0xffffffff80000000
   180002b42:	49 29 fd             	sub    r13,rdi
   180002b45:	0f 84 7e 02 00 00    	je     0x180002dc9
   180002b4b:	48 8b 84 24 b0 00 00 00 	mov    rax,QWORD PTR [rsp+0xb0]
   180002b53:	8b ac 04 90 01 00 00 	mov    ebp,DWORD PTR [rsp+rax*1+0x190]
   180002b5a:	48 81 c5 ff 0f 00 00 	add    rbp,0xfff
   180002b61:	48 21 dd             	and    rbp,rbx
   180002b64:	4c 8d 7c 24 50       	lea    r15,[rsp+0x50]
   180002b69:	4c 8d 64 24 70       	lea    r12,[rsp+0x70]
   180002b6e:	48 8b 1d b3 14 00 00 	mov    rbx,QWORD PTR [rip+0x14b3]        # 0x180004028
   180002b75:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   180002b7a:	48 89 74 24 50       	mov    QWORD PTR [rsp+0x50],rsi
   180002b7f:	c7 44 24 28 40 00 00 00 	mov    DWORD PTR [rsp+0x28],0x40
   180002b87:	c7 44 24 20 00 20 00 00 	mov    DWORD PTR [rsp+0x20],0x2000
   180002b8f:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002b96:	4c 89 fa             	mov    rdx,r15
   180002b99:	45 31 c0             	xor    r8d,r8d
   180002b9c:	4d 89 e1             	mov    r9,r12
   180002b9f:	ff d3                	call   rbx
   180002ba1:	85 c0                	test   eax,eax
   180002ba3:	0f 89 16 02 00 00    	jns    0x180002dbf
   180002ba9:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   180002bae:	48 89 7c 24 50       	mov    QWORD PTR [rsp+0x50],rdi
   180002bb3:	c7 44 24 28 40 00 00 00 	mov    DWORD PTR [rsp+0x28],0x40
   180002bbb:	c7 44 24 20 00 20 00 00 	mov    DWORD PTR [rsp+0x20],0x2000
   180002bc3:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002bca:	4c 89 fa             	mov    rdx,r15
   180002bcd:	45 31 c0             	xor    r8d,r8d
   180002bd0:	4d 89 e1             	mov    r9,r12
   180002bd3:	ff d3                	call   rbx
   180002bd5:	85 c0                	test   eax,eax
   180002bd7:	0f 89 e2 01 00 00    	jns    0x180002dbf
   180002bdd:	48 c7 44 24 50 00 00 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   180002be6:	48 81 c7 00 00 e0 ff 	add    rdi,0xffffffffffe00000
   180002bed:	48 81 c6 00 00 20 00 	add    rsi,0x200000
   180002bf4:	b8 c2 04 00 c0       	mov    eax,0xc00004c2
   180002bf9:	49 81 c5 00 00 e0 ff 	add    r13,0xffffffffffe00000
   180002c00:	0f 85 6f ff ff ff    	jne    0x180002b75
   180002c06:	e9 21 04 00 00       	jmp    0x18000302c
   180002c0b:	48 8b 84 24 e0 00 00 00 	mov    rax,QWORD PTR [rsp+0xe0]
   180002c13:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   180002c18:	c7 44 24 28 00 00 00 01 	mov    DWORD PTR [rsp+0x28],0x1000000
   180002c20:	c7 44 24 20 10 00 00 00 	mov    DWORD PTR [rsp+0x20],0x10
   180002c28:	48 8d 4c 24 68       	lea    rcx,[rsp+0x68]
   180002c2d:	ba 0d 00 00 00       	mov    edx,0xd
   180002c32:	45 31 c0             	xor    r8d,r8d
   180002c35:	45 31 c9             	xor    r9d,r9d
   180002c38:	ff 15 f2 13 00 00    	call   QWORD PTR [rip+0x13f2]        # 0x180004030
   180002c3e:	85 c0                	test   eax,eax
   180002c40:	0f 88 fe 07 00 00    	js     0x180003444
   180002c46:	8b 47 3c             	mov    eax,DWORD PTR [rdi+0x3c]
   180002c49:	8b 44 38 50          	mov    eax,DWORD PTR [rax+rdi*1+0x50]
   180002c4d:	48 89 fe             	mov    rsi,rdi
   180002c50:	48 81 e6 00 00 e0 ff 	and    rsi,0xffffffffffe00000
   180002c57:	4c 8d 3c 07          	lea    r15,[rdi+rax*1]
   180002c5b:	49 81 c7 ff ff 1f 00 	add    r15,0x1fffff
   180002c62:	49 81 e7 00 00 e0 ff 	and    r15,0xffffffffffe00000
   180002c69:	49 89 f6             	mov    r14,rsi
   180002c6c:	49 81 ee 00 00 00 80 	sub    r14,0xffffffff80000000
   180002c73:	4d 29 fe             	sub    r14,r15
   180002c76:	0f 84 2b 01 00 00    	je     0x180002da7
   180002c7c:	89 6c 24 5c          	mov    DWORD PTR [rsp+0x5c],ebp
   180002c80:	48 89 9c 24 d8 00 00 00 	mov    QWORD PTR [rsp+0xd8],rbx
   180002c88:	41 bd 00 00 80 00    	mov    r13d,0x800000
   180002c8e:	31 ed                	xor    ebp,ebp
   180002c90:	0f 57 f6             	xorps  xmm6,xmm6
   180002c93:	48 8d 5c 24 50       	lea    rbx,[rsp+0x50]
   180002c98:	48 8b 3d 99 13 00 00 	mov    rdi,QWORD PTR [rip+0x1399]        # 0x180004038
   180002c9f:	90                   	nop
   180002ca0:	48 c7 84 24 40 01 00 00 00 00 00 00 	mov    QWORD PTR [rsp+0x140],0x0
   180002cac:	48 8d 04 2e          	lea    rax,[rsi+rbp*1]
   180002cb0:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   180002cb5:	48 8b 4c 24 68       	mov    rcx,QWORD PTR [rsp+0x68]
   180002cba:	44 89 6c 24 40       	mov    DWORD PTR [rsp+0x40],r13d
   180002cbf:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
   180002cc4:	0f 11 74 24 20       	movups XMMWORD PTR [rsp+0x20],xmm6
   180002cc9:	c7 44 24 48 80 00 00 00 	mov    DWORD PTR [rsp+0x48],0x80
   180002cd1:	c7 44 24 38 01 00 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   180002cd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   180002ce0:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   180002ce7:	49 89 d8             	mov    r8,rbx
   180002cea:	45 31 c9             	xor    r9d,r9d
   180002ced:	ff d7                	call   rdi
   180002cef:	3d f7 00 00 c0       	cmp    eax,0xc00000f7
   180002cf4:	75 3a                	jne    0x180002d30
   180002cf6:	48 8b 4c 24 68       	mov    rcx,QWORD PTR [rsp+0x68]
   180002cfb:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
   180002d00:	0f 11 74 24 20       	movups XMMWORD PTR [rsp+0x20],xmm6
   180002d05:	c7 44 24 48 80 00 00 00 	mov    DWORD PTR [rsp+0x48],0x80
   180002d0d:	c7 44 24 40 00 00 00 00 	mov    DWORD PTR [rsp+0x40],0x0
   180002d15:	c7 44 24 38 01 00 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   180002d1d:	45 31 ed             	xor    r13d,r13d
   180002d20:	eb be                	jmp    0x180002ce0
   180002d22:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nop WORD PTR [rax+rax*1+0x0]
   180002d30:	85 c0                	test   eax,eax
   180002d32:	79 60                	jns    0x180002d94
   180002d34:	4c 89 f8             	mov    rax,r15
   180002d37:	48 29 e8             	sub    rax,rbp
   180002d3a:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   180002d3f:	48 8b 4c 24 68       	mov    rcx,QWORD PTR [rsp+0x68]
   180002d44:	44 89 6c 24 40       	mov    DWORD PTR [rsp+0x40],r13d
   180002d49:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
   180002d4e:	0f 11 74 24 20       	movups XMMWORD PTR [rsp+0x20],xmm6
   180002d53:	c7 44 24 48 80 00 00 00 	mov    DWORD PTR [rsp+0x48],0x80
   180002d5b:	c7 44 24 38 01 00 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   180002d63:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   180002d6a:	49 89 d8             	mov    r8,rbx
   180002d6d:	45 31 c9             	xor    r9d,r9d
   180002d70:	ff d7                	call   rdi
   180002d72:	85 c0                	test   eax,eax
   180002d74:	79 1e                	jns    0x180002d94
   180002d76:	48 c7 44 24 50 00 00 00 00 	mov    QWORD PTR [rsp+0x50],0x0
   180002d7f:	48 81 c5 00 00 20 00 	add    rbp,0x200000
   180002d86:	4c 39 f5             	cmp    rbp,r14
   180002d89:	0f 85 11 ff ff ff    	jne    0x180002ca0
   180002d8f:	e9 ab 06 00 00       	jmp    0x18000343f
   180002d94:	48 8b 9c 24 d8 00 00 00 	mov    rbx,QWORD PTR [rsp+0xd8]
   180002d9c:	8b 6c 24 5c          	mov    ebp,DWORD PTR [rsp+0x5c]
   180002da0:	4c 8d 2d 59 d2 ff ff 	lea    r13,[rip+0xffffffffffffd259]        # 0x180000000
   180002da7:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   180002dac:	48 85 c9             	test   rcx,rcx
   180002daf:	0f 84 8a 06 00 00    	je     0x18000343f
   180002db5:	e8 b6 f3 ff ff       	call   0x180002170
   180002dba:	e9 80 02 00 00       	jmp    0x18000303f
   180002dbf:	48 bb 00 f0 ff ff 01 00 00 00 	movabs rbx,0x1fffff000
   180002dc9:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   180002dce:	48 85 c0             	test   rax,rax
   180002dd1:	48 8d b4 24 90 00 00 00 	lea    rsi,[rsp+0x90]
   180002dd9:	4c 8d 6c 24 60       	lea    r13,[rsp+0x60]
   180002dde:	0f 84 43 02 00 00    	je     0x180003027
   180002de4:	48 8b bc 24 b0 00 00 00 	mov    rdi,QWORD PTR [rsp+0xb0]
   180002dec:	8b 8c 3c 94 01 00 00 	mov    ecx,DWORD PTR [rsp+rdi*1+0x194]
   180002df3:	48 81 c1 ff 0f 00 00 	add    rcx,0xfff
   180002dfa:	48 21 d9             	and    rcx,rbx
   180002dfd:	48 89 4c 24 70       	mov    QWORD PTR [rsp+0x70],rcx
   180002e02:	48 89 84 24 b8 00 00 00 	mov    QWORD PTR [rsp+0xb8],rax
   180002e0a:	c7 44 24 28 04 00 00 00 	mov    DWORD PTR [rsp+0x28],0x4
   180002e12:	c7 44 24 20 00 10 00 00 	mov    DWORD PTR [rsp+0x20],0x1000
   180002e1a:	48 8d 94 24 b8 00 00 00 	lea    rdx,[rsp+0xb8]
   180002e22:	4c 8d 4c 24 70       	lea    r9,[rsp+0x70]
   180002e27:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002e2e:	45 31 c0             	xor    r8d,r8d
   180002e31:	ff 15 f1 11 00 00    	call   QWORD PTR [rip+0x11f1]        # 0x180004028
   180002e37:	85 c0                	test   eax,eax
   180002e39:	0f 88 ed 01 00 00    	js     0x18000302c
   180002e3f:	48 c7 44 24 60 00 00 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   180002e48:	8b 84 3c 94 01 00 00 	mov    eax,DWORD PTR [rsp+rdi*1+0x194]
   180002e4f:	48 8b 8c 24 b8 00 00 00 	mov    rcx,QWORD PTR [rsp+0xb8]
   180002e57:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
   180002e5c:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   180002e60:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   180002e65:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   180002e6a:	48 c7 44 24 40 00 00 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   180002e73:	4c 89 f1             	mov    rcx,r14
   180002e76:	31 d2                	xor    edx,edx
   180002e78:	45 31 c0             	xor    r8d,r8d
   180002e7b:	45 31 c9             	xor    r9d,r9d
   180002e7e:	ff 15 cc 11 00 00    	call   QWORD PTR [rip+0x11cc]        # 0x180004050
   180002e84:	85 c0                	test   eax,eax
   180002e86:	0f 88 a0 01 00 00    	js     0x18000302c
   180002e8c:	c7 44 24 7c 00 00 00 00 	mov    DWORD PTR [rsp+0x7c],0x0
   180002e94:	48 8d 44 24 7c       	lea    rax,[rsp+0x7c]
   180002e99:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   180002e9e:	48 8d 94 24 b8 00 00 00 	lea    rdx,[rsp+0xb8]
   180002ea6:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   180002eab:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002eb2:	41 b9 02 00 00 00    	mov    r9d,0x2
   180002eb8:	ff 15 8a 11 00 00    	call   QWORD PTR [rip+0x118a]        # 0x180004048
   180002ebe:	85 c0                	test   eax,eax
   180002ec0:	0f 88 66 01 00 00    	js     0x18000302c
   180002ec6:	0f b7 84 3c 46 01 00 00 	movzx  eax,WORD PTR [rsp+rdi*1+0x146]
   180002ece:	48 85 c0             	test   rax,rax
   180002ed1:	0f 84 44 01 00 00    	je     0x18000301b
   180002ed7:	48 89 dd             	mov    rbp,rbx
   180002eda:	8b 8c 24 7c 01 00 00 	mov    ecx,DWORD PTR [rsp+0x17c]
   180002ee1:	0f b7 94 3c 54 01 00 00 	movzx  edx,WORD PTR [rsp+rdi*1+0x154]
   180002ee9:	4c 8b 84 24 b8 00 00 00 	mov    r8,QWORD PTR [rsp+0xb8]
   180002ef1:	48 01 ca             	add    rdx,rcx
   180002ef4:	49 8d 34 10          	lea    rsi,[r8+rdx*1]
   180002ef8:	48 83 c6 20          	add    rsi,0x20
   180002efc:	c1 e0 03             	shl    eax,0x3
   180002eff:	48 8d 04 80          	lea    rax,[rax+rax*4]
   180002f03:	48 89 84 24 b0 00 00 00 	mov    QWORD PTR [rsp+0xb0],rax
   180002f0b:	31 db                	xor    ebx,ebx
   180002f0d:	4c 8d bc 24 28 01 00 00 	lea    r15,[rsp+0x128]
   180002f15:	4c 8d a4 24 38 01 00 00 	lea    r12,[rsp+0x138]
   180002f1d:	48 8b 3d 04 11 00 00 	mov    rdi,QWORD PTR [rip+0x1104]        # 0x180004028
   180002f24:	8b 44 1e 04          	mov    eax,DWORD PTR [rsi+rbx*1+0x4]
   180002f28:	48 03 44 24 50       	add    rax,QWORD PTR [rsp+0x50]
   180002f2d:	48 89 84 24 28 01 00 00 	mov    QWORD PTR [rsp+0x128],rax
   180002f35:	8b 04 1e             	mov    eax,DWORD PTR [rsi+rbx*1]
   180002f38:	48 05 ff 0f 00 00    	add    rax,0xfff
   180002f3e:	48 21 e8             	and    rax,rbp
   180002f41:	48 89 84 24 38 01 00 00 	mov    QWORD PTR [rsp+0x138],rax
   180002f49:	c7 44 24 28 04 00 00 00 	mov    DWORD PTR [rsp+0x28],0x4
   180002f51:	c7 44 24 20 00 10 00 00 	mov    DWORD PTR [rsp+0x20],0x1000
   180002f59:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002f60:	4c 89 fa             	mov    rdx,r15
   180002f63:	45 31 c0             	xor    r8d,r8d
   180002f66:	4d 89 e1             	mov    r9,r12
   180002f69:	ff d7                	call   rdi
   180002f6b:	85 c0                	test   eax,eax
   180002f6d:	0f 88 b9 00 00 00    	js     0x18000302c
   180002f73:	83 7c 1e 08 00       	cmp    DWORD PTR [rsi+rbx*1+0x8],0x0
   180002f78:	74 56                	je     0x180002fd0
   180002f7a:	8b 44 1e 0c          	mov    eax,DWORD PTR [rsi+rbx*1+0xc]
   180002f7e:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   180002f83:	8b 04 1e             	mov    eax,DWORD PTR [rsi+rbx*1]
   180002f86:	8b 4c 1e 08          	mov    ecx,DWORD PTR [rsi+rbx*1+0x8]
   180002f8a:	39 c8                	cmp    eax,ecx
   180002f8c:	0f 42 c8             	cmovb  ecx,eax
   180002f8f:	48 8b 84 24 28 01 00 00 	mov    rax,QWORD PTR [rsp+0x128]
   180002f97:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
   180002f9c:	89 4c 24 30          	mov    DWORD PTR [rsp+0x30],ecx
   180002fa0:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   180002fa5:	48 8d 84 24 90 00 00 00 	lea    rax,[rsp+0x90]
   180002fad:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   180002fb2:	48 c7 44 24 40 00 00 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   180002fbb:	4c 89 f1             	mov    rcx,r14
   180002fbe:	31 d2                	xor    edx,edx
   180002fc0:	45 31 c0             	xor    r8d,r8d
   180002fc3:	45 31 c9             	xor    r9d,r9d
   180002fc6:	ff 15 84 10 00 00    	call   QWORD PTR [rip+0x1084]        # 0x180004050
   180002fcc:	85 c0                	test   eax,eax
   180002fce:	78 5c                	js     0x18000302c
   180002fd0:	8b 44 1e 1c          	mov    eax,DWORD PTR [rsi+rbx*1+0x1c]
   180002fd4:	c1 e8 1b             	shr    eax,0x1b
   180002fd7:	83 e0 fc             	and    eax,0xfffffffc
   180002fda:	83 f0 10             	xor    eax,0x10
   180002fdd:	48 8d 0d b4 37 00 00 	lea    rcx,[rip+0x37b4]        # 0x180006798
   180002fe4:	44 8b 0c 08          	mov    r9d,DWORD PTR [rax+rcx*1]
   180002fe8:	48 8d 44 24 7c       	lea    rax,[rsp+0x7c]
   180002fed:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   180002ff2:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
   180002ff9:	4c 89 fa             	mov    rdx,r15
   180002ffc:	4d 89 e0             	mov    r8,r12
   180002fff:	ff 15 43 10 00 00    	call   QWORD PTR [rip+0x1043]        # 0x180004048
   180003005:	85 c0                	test   eax,eax
   180003007:	78 23                	js     0x18000302c
   180003009:	48 83 c3 28          	add    rbx,0x28
   18000300d:	48 39 9c 24 b0 00 00 00 	cmp    QWORD PTR [rsp+0xb0],rbx
   180003015:	0f 85 09 ff ff ff    	jne    0x180002f24
   18000301b:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   180003020:	e8 4b f1 ff ff       	call   0x180002170
   180003025:	eb 05                	jmp    0x18000302c
   180003027:	b8 c2 04 00 c0       	mov    eax,0xc00004c2
   18000302c:	48 8b 9c 24 d8 00 00 00 	mov    rbx,QWORD PTR [rsp+0xd8]
   180003034:	8b 6c 24 5c          	mov    ebp,DWORD PTR [rsp+0x5c]
   180003038:	4c 8d 2d c1 cf ff ff 	lea    r13,[rip+0xffffffffffffcfc1]        # 0x180000000
   18000303f:	85 c0                	test   eax,eax
   180003041:	0f 88 fd 03 00 00    	js     0x180003444
   180003047:	40 84 ed             	test   bpl,bpl
   18000304a:	4c 8b 94 24 20 01 00 00 	mov    r10,QWORD PTR [rsp+0x120]
   180003052:	0f 84 2b 01 00 00    	je     0x180003183
   180003058:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   18000305d:	8b 48 3c             	mov    ecx,DWORD PTR [rax+0x3c]
   180003060:	66 81 7c 01 14 f0 00 	cmp    WORD PTR [rcx+rax*1+0x14],0xf0
   180003067:	0f 82 e7 03 00 00    	jb     0x180003454
   18000306d:	81 bc 08 dc 00 00 00 c8 00 00 00 	cmp    DWORD PTR [rax+rcx*1+0xdc],0xc8
   180003078:	0f 82 d6 03 00 00    	jb     0x180003454
   18000307e:	8b 8c 08 d8 00 00 00 	mov    ecx,DWORD PTR [rax+rcx*1+0xd8]
   180003085:	48 8b 8c 01 c8 00 00 00 	mov    rcx,QWORD PTR [rcx+rax*1+0xc8]
   18000308d:	83 39 02             	cmp    DWORD PTR [rcx],0x2
   180003090:	0f 85 be 03 00 00    	jne    0x180003454
   180003096:	8b 15 a0 cf ff ff    	mov    edx,DWORD PTR [rip+0xffffffffffffcfa0]        # 0x18000003c
   18000309c:	66 42 81 7c 2a 14 f0 00 	cmp    WORD PTR [rdx+r13*1+0x14],0xf0
   1800030a4:	0f 82 aa 03 00 00    	jb     0x180003454
   1800030aa:	42 81 bc 2a dc 00 00 00 c8 00 00 00 	cmp    DWORD PTR [rdx+r13*1+0xdc],0xc8
   1800030b6:	0f 82 98 03 00 00    	jb     0x180003454
   1800030bc:	42 8b 94 2a d8 00 00 00 	mov    edx,DWORD PTR [rdx+r13*1+0xd8]
   1800030c4:	4a 8b 94 2a c8 00 00 00 	mov    rdx,QWORD PTR [rdx+r13*1+0xc8]
   1800030cc:	83 3a 02             	cmp    DWORD PTR [rdx],0x2
   1800030cf:	0f 85 7f 03 00 00    	jne    0x180003454
   1800030d5:	44 8b 41 14          	mov    r8d,DWORD PTR [rcx+0x14]
   1800030d9:	49 83 f8 02          	cmp    r8,0x2
   1800030dd:	72 0c                	jb     0x1800030eb
   1800030df:	44 8b 4a 14          	mov    r9d,DWORD PTR [rdx+0x14]
   1800030e3:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   1800030e7:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   1800030eb:	44 8b 41 18          	mov    r8d,DWORD PTR [rcx+0x18]
   1800030ef:	49 83 f8 02          	cmp    r8,0x2
   1800030f3:	72 0c                	jb     0x180003101
   1800030f5:	44 8b 4a 18          	mov    r9d,DWORD PTR [rdx+0x18]
   1800030f9:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   1800030fd:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   180003101:	44 8b 41 1c          	mov    r8d,DWORD PTR [rcx+0x1c]
   180003105:	49 83 f8 02          	cmp    r8,0x2
   180003109:	72 0c                	jb     0x180003117
   18000310b:	44 8b 4a 1c          	mov    r9d,DWORD PTR [rdx+0x1c]
   18000310f:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   180003113:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   180003117:	44 8b 41 20          	mov    r8d,DWORD PTR [rcx+0x20]
   18000311b:	49 83 f8 02          	cmp    r8,0x2
   18000311f:	72 0c                	jb     0x18000312d
   180003121:	44 8b 4a 20          	mov    r9d,DWORD PTR [rdx+0x20]
   180003125:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   180003129:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   18000312d:	44 8b 41 24          	mov    r8d,DWORD PTR [rcx+0x24]
   180003131:	49 83 f8 02          	cmp    r8,0x2
   180003135:	72 0c                	jb     0x180003143
   180003137:	44 8b 4a 24          	mov    r9d,DWORD PTR [rdx+0x24]
   18000313b:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   18000313f:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   180003143:	44 8b 41 38          	mov    r8d,DWORD PTR [rcx+0x38]
   180003147:	49 83 f8 02          	cmp    r8,0x2
   18000314b:	72 0c                	jb     0x180003159
   18000314d:	44 8b 4a 38          	mov    r9d,DWORD PTR [rdx+0x38]
   180003151:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   180003155:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   180003159:	44 8b 41 3c          	mov    r8d,DWORD PTR [rcx+0x3c]
   18000315d:	49 83 f8 02          	cmp    r8,0x2
   180003161:	72 0c                	jb     0x18000316f
   180003163:	44 8b 4a 3c          	mov    r9d,DWORD PTR [rdx+0x3c]
   180003167:	4f 8b 0c 29          	mov    r9,QWORD PTR [r9+r13*1]
   18000316b:	4e 89 0c 00          	mov    QWORD PTR [rax+r8*1],r9
   18000316f:	8b 49 48             	mov    ecx,DWORD PTR [rcx+0x48]
   180003172:	48 83 f9 02          	cmp    rcx,0x2
   180003176:	72 0b                	jb     0x180003183
   180003178:	8b 52 48             	mov    edx,DWORD PTR [rdx+0x48]
   18000317b:	4a 8b 14 2a          	mov    rdx,QWORD PTR [rdx+r13*1]
   18000317f:	48 89 14 08          	mov    QWORD PTR [rax+rcx*1],rdx
   180003183:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   180003188:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   18000318c:	8b 4c 08 28          	mov    ecx,DWORD PTR [rax+rcx*1+0x28]
   180003190:	48 01 c1             	add    rcx,rax
   180003193:	48 ba ae 8e 21 21 4c a8 20 90 	movabs rdx,0x9020a84c21218eae
   18000319d:	48 89 15 a4 6e 00 00 	mov    QWORD PTR [rip+0x6ea4],rdx        # 0x18000a048
   1800031a4:	48 ba 72 7b 13 55 d9 5a a1 01 	movabs rdx,0x1a15ad955137b72
   1800031ae:	48 89 15 9b 6e 00 00 	mov    QWORD PTR [rip+0x6e9b],rdx        # 0x18000a050
   1800031b5:	4c 89 2d 9c 6e 00 00 	mov    QWORD PTR [rip+0x6e9c],r13        # 0x18000a058
   1800031bc:	48 89 05 9d 6e 00 00 	mov    QWORD PTR [rip+0x6e9d],rax        # 0x18000a060
   1800031c3:	48 89 0d ae 6e 00 00 	mov    QWORD PTR [rip+0x6eae],rcx        # 0x18000a078
   1800031ca:	48 8b 44 24 68       	mov    rax,QWORD PTR [rsp+0x68]
   1800031cf:	48 89 05 9a 6e 00 00 	mov    QWORD PTR [rip+0x6e9a],rax        # 0x18000a070
   1800031d6:	4c 89 15 8b 6e 00 00 	mov    QWORD PTR [rip+0x6e8b],r10        # 0x18000a068
   1800031dd:	0f 57 c0             	xorps  xmm0,xmm0
   1800031e0:	0f 11 05 b9 6e 00 00 	movups XMMWORD PTR [rip+0x6eb9],xmm0        # 0x18000a0a0
   1800031e7:	48 8d 05 c2 03 00 00 	lea    rax,[rip+0x3c2]        # 0x1800035b0
   1800031ee:	48 89 05 bb 6e 00 00 	mov    QWORD PTR [rip+0x6ebb],rax        # 0x18000a0b0
   1800031f5:	48 8d 05 94 03 00 00 	lea    rax,[rip+0x394]        # 0x180003590
   1800031fc:	48 89 05 b5 6e 00 00 	mov    QWORD PTR [rip+0x6eb5],rax        # 0x18000a0b8
   180003203:	48 8d 05 36 de ff ff 	lea    rax,[rip+0xffffffffffffde36]        # 0x180001040
   18000320a:	48 89 05 6f 6f 00 00 	mov    QWORD PTR [rip+0x6f6f],rax        # 0x18000a180
   180003211:	48 8d 05 88 ee ff ff 	lea    rax,[rip+0xffffffffffffee88]        # 0x1800020a0
   180003218:	48 89 05 a1 6e 00 00 	mov    QWORD PTR [rip+0x6ea1],rax        # 0x18000a0c0
   18000321f:	48 8d 05 3a ee ff ff 	lea    rax,[rip+0xffffffffffffee3a]        # 0x180002060
   180003226:	48 89 05 3b 6f 00 00 	mov    QWORD PTR [rip+0x6f3b],rax        # 0x18000a168
   18000322d:	48 8d 05 9c 02 00 00 	lea    rax,[rip+0x29c]        # 0x1800034d0
   180003234:	48 89 05 25 6f 00 00 	mov    QWORD PTR [rip+0x6f25],rax        # 0x18000a160
   18000323b:	48 8d 05 2e 03 00 00 	lea    rax,[rip+0x32e]        # 0x180003570
   180003242:	48 89 05 27 6f 00 00 	mov    QWORD PTR [rip+0x6f27],rax        # 0x18000a170
   180003249:	48 8d 05 50 05 00 00 	lea    rax,[rip+0x550]        # 0x1800037a0
   180003250:	48 89 05 21 6f 00 00 	mov    QWORD PTR [rip+0x6f21],rax        # 0x18000a178
   180003257:	0f 28 05 b2 1d 00 00 	movaps xmm0,XMMWORD PTR [rip+0x1db2]        # 0x180005010
   18000325e:	0f 29 84 24 a0 00 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm0
   180003266:	0f 28 05 93 1d 00 00 	movaps xmm0,XMMWORD PTR [rip+0x1d93]        # 0x180005000
   18000326d:	0f 29 84 24 90 00 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm0
   180003275:	31 f6                	xor    esi,esi
   180003277:	48 8d bc 24 40 01 00 00 	lea    rdi,[rsp+0x140]
   18000327f:	41 b8 00 04 00 00    	mov    r8d,0x400
   180003285:	48 89 f9             	mov    rcx,rdi
   180003288:	31 d2                	xor    edx,edx
   18000328a:	e8 d1 08 00 00       	call   0x180003b60
   18000328f:	48 c7 44 24 60 00 00 00 00 	mov    QWORD PTR [rsp+0x60],0x0
   180003298:	48 8d 44 24 60       	lea    rax,[rsp+0x60]
   18000329d:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1800032a2:	48 c7 44 24 20 00 02 00 00 	mov    QWORD PTR [rsp+0x20],0x200
   1800032ab:	48 8d 94 24 90 00 00 00 	lea    rdx,[rsp+0x90]
   1800032b3:	41 b8 0f 00 00 00    	mov    r8d,0xf
   1800032b9:	31 c9                	xor    ecx,ecx
   1800032bb:	49 89 f9             	mov    r9,rdi
   1800032be:	ff 15 f4 0d 00 00    	call   QWORD PTR [rip+0xdf4]        # 0x1800040b8
   1800032c4:	85 c0                	test   eax,eax
   1800032c6:	78 17                	js     0x1800032df
   1800032c8:	48 8d 8c 24 40 01 00 00 	lea    rcx,[rsp+0x140]
   1800032d0:	31 d2                	xor    edx,edx
   1800032d2:	41 b8 0a 00 00 00    	mov    r8d,0xa
   1800032d8:	e8 a3 05 00 00       	call   0x180003880
   1800032dd:	89 c6                	mov    esi,eax
   1800032df:	48 85 db             	test   rbx,rbx
   1800032e2:	89 35 e0 6d 00 00    	mov    DWORD PTR [rip+0x6de0],esi        # 0x18000a0c8
   1800032e8:	4c 8d 0d 59 6d 00 00 	lea    r9,[rip+0x6d59]        # 0x18000a048
   1800032ef:	0f 95 05 d6 6d 00 00 	setne  BYTE PTR [rip+0x6dd6]        # 0x18000a0cc
   1800032f6:	40 88 2d d0 6d 00 00 	mov    BYTE PTR [rip+0x6dd0],bpl        # 0x18000a0cd
   1800032fd:	48 8b 05 04 0e 00 00 	mov    rax,QWORD PTR [rip+0xe04]        # 0x180004108
   180003304:	48 89 05 fd 6d 00 00 	mov    QWORD PTR [rip+0x6dfd],rax        # 0x18000a108
   18000330b:	48 8b 05 ce 0d 00 00 	mov    rax,QWORD PTR [rip+0xdce]        # 0x1800040e0
   180003312:	48 89 05 f7 6d 00 00 	mov    QWORD PTR [rip+0x6df7],rax        # 0x18000a110
   180003319:	48 8b 05 f0 0d 00 00 	mov    rax,QWORD PTR [rip+0xdf0]        # 0x180004110
   180003320:	48 89 05 f1 6d 00 00 	mov    QWORD PTR [rip+0x6df1],rax        # 0x18000a118
   180003327:	48 8b 05 a2 0d 00 00 	mov    rax,QWORD PTR [rip+0xda2]        # 0x1800040d0
   18000332e:	48 89 05 eb 6d 00 00 	mov    QWORD PTR [rip+0x6deb],rax        # 0x18000a120
   180003335:	48 8b 05 9c 0d 00 00 	mov    rax,QWORD PTR [rip+0xd9c]        # 0x1800040d8
   18000333c:	48 89 05 e5 6d 00 00 	mov    QWORD PTR [rip+0x6de5],rax        # 0x18000a128
   180003343:	48 8b 05 ae 0d 00 00 	mov    rax,QWORD PTR [rip+0xdae]        # 0x1800040f8
   18000334a:	48 89 05 df 6d 00 00 	mov    QWORD PTR [rip+0x6ddf],rax        # 0x18000a130
   180003351:	48 8b 05 a8 0d 00 00 	mov    rax,QWORD PTR [rip+0xda8]        # 0x180004100
   180003358:	48 89 05 d9 6d 00 00 	mov    QWORD PTR [rip+0x6dd9],rax        # 0x18000a138
   18000335f:	48 8b 05 62 0d 00 00 	mov    rax,QWORD PTR [rip+0xd62]        # 0x1800040c8
   180003366:	48 89 05 d3 6d 00 00 	mov    QWORD PTR [rip+0x6dd3],rax        # 0x18000a140
   18000336d:	48 8b 05 7c 0d 00 00 	mov    rax,QWORD PTR [rip+0xd7c]        # 0x1800040f0
   180003374:	48 89 05 cd 6d 00 00 	mov    QWORD PTR [rip+0x6dcd],rax        # 0x18000a148
   18000337b:	48 8b 05 96 0d 00 00 	mov    rax,QWORD PTR [rip+0xd96]        # 0x180004118
   180003382:	48 89 05 c7 6d 00 00 	mov    QWORD PTR [rip+0x6dc7],rax        # 0x18000a150
   180003389:	48 8b 05 58 0d 00 00 	mov    rax,QWORD PTR [rip+0xd58]        # 0x1800040e8
   180003390:	48 89 05 c1 6d 00 00 	mov    QWORD PTR [rip+0x6dc1],rax        # 0x18000a158
   180003397:	48 8b 05 fa 0d 00 00 	mov    rax,QWORD PTR [rip+0xdfa]        # 0x180004198
   18000339e:	48 89 05 2b 6d 00 00 	mov    QWORD PTR [rip+0x6d2b],rax        # 0x18000a0d0
   1800033a5:	48 8b 05 14 0e 00 00 	mov    rax,QWORD PTR [rip+0xe14]        # 0x1800041c0
   1800033ac:	48 89 05 25 6d 00 00 	mov    QWORD PTR [rip+0x6d25],rax        # 0x18000a0d8
   1800033b3:	48 8b 05 06 0d 00 00 	mov    rax,QWORD PTR [rip+0xd06]        # 0x1800040c0
   1800033ba:	48 89 05 1f 6d 00 00 	mov    QWORD PTR [rip+0x6d1f],rax        # 0x18000a0e0
   1800033c1:	48 8b 05 d0 0c 00 00 	mov    rax,QWORD PTR [rip+0xcd0]        # 0x180004098
   1800033c8:	48 89 05 19 6d 00 00 	mov    QWORD PTR [rip+0x6d19],rax        # 0x18000a0e8
   1800033cf:	48 8b 05 ba 0c 00 00 	mov    rax,QWORD PTR [rip+0xcba]        # 0x180004090
   1800033d6:	48 89 05 13 6d 00 00 	mov    QWORD PTR [rip+0x6d13],rax        # 0x18000a0f0
   1800033dd:	48 8b 05 a4 0c 00 00 	mov    rax,QWORD PTR [rip+0xca4]        # 0x180004088
   1800033e4:	48 89 05 0d 6d 00 00 	mov    QWORD PTR [rip+0x6d0d],rax        # 0x18000a0f8
   1800033eb:	48 8b 05 8e 0c 00 00 	mov    rax,QWORD PTR [rip+0xc8e]        # 0x180004080
   1800033f2:	48 89 05 07 6d 00 00 	mov    QWORD PTR [rip+0x6d07],rax        # 0x18000a100
   1800033f9:	31 c9                	xor    ecx,ecx
   1800033fb:	ba d7 5c 66 25       	mov    edx,0x25665cd7
   180003400:	45 31 c0             	xor    r8d,r8d
   180003403:	ff 15 6f 6c 00 00    	call   QWORD PTR [rip+0x6c6f]        # 0x18000a078
   180003409:	66 c7 05 ae 6d 00 00 02 00 	mov    WORD PTR [rip+0x6dae],0x2        # 0x18000a1c0
   180003412:	0f 28 b4 24 40 05 00 00 	movaps xmm6,XMMWORD PTR [rsp+0x540]
   18000341a:	0f 28 bc 24 50 05 00 00 	movaps xmm7,XMMWORD PTR [rsp+0x550]
   180003422:	44 0f 28 84 24 60 05 00 00 	movaps xmm8,XMMWORD PTR [rsp+0x560]
   18000342b:	48 81 c4 78 05 00 00 	add    rsp,0x578
   180003432:	5b                   	pop    rbx
   180003433:	5d                   	pop    rbp
   180003434:	5f                   	pop    rdi
   180003435:	5e                   	pop    rsi
   180003436:	41 5c                	pop    r12
   180003438:	41 5d                	pop    r13
   18000343a:	41 5e                	pop    r14
   18000343c:	41 5f                	pop    r15
   18000343e:	c3                   	ret
   18000343f:	b8 c2 04 00 c0       	mov    eax,0xc00004c2
   180003444:	4c 8d 05 b5 cb ff ff 	lea    r8,[rip+0xffffffffffffcbb5]        # 0x180000000
   18000344b:	89 c1                	mov    ecx,eax
   18000344d:	b2 01                	mov    dl,0x1
   18000344f:	e8 5c 01 00 00       	call   0x1800035b0
   180003454:	4c 8d 05 a5 cb ff ff 	lea    r8,[rip+0xffffffffffffcba5]        # 0x180000000
   18000345b:	b9 7b 00 00 c0       	mov    ecx,0xc000007b
   180003460:	b2 01                	mov    dl,0x1
   180003462:	e8 49 01 00 00       	call   0x1800035b0
   180003467:	4c 8d 05 92 cb ff ff 	lea    r8,[rip+0xffffffffffffcb92]        # 0x180000000
   18000346e:	b9 17 00 00 c0       	mov    ecx,0xc0000017
   180003473:	b2 01                	mov    dl,0x1
   180003475:	e8 36 01 00 00       	call   0x1800035b0
   18000347a:	4c 8d 05 7f cb ff ff 	lea    r8,[rip+0xffffffffffffcb7f]        # 0x180000000
   180003481:	b9 3a 00 00 c0       	mov    ecx,0xc000003a
   180003486:	b2 01                	mov    dl,0x1
   180003488:	e8 23 01 00 00       	call   0x1800035b0
   18000348d:	b8 12 00 11 e1       	mov    eax,0xe1110012
   180003492:	eb b0                	jmp    0x180003444
