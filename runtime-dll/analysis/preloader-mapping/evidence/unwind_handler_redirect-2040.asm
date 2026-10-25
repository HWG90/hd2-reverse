; preloader.dll 0xA0CF546E, language handler named by the .entry stubs' unwind info
; RVA 0x2040-0x2080 (pdata not found; fixed 0x40), VA = 0x180000000 + RVA
Disassembly of section .text:

0000000180002040 <.text+0x1040>:
   180002040:	49 8b 41 38          	mov    rax,QWORD PTR [r9+0x38]
   180002044:	8b 00                	mov    eax,DWORD PTR [rax]
   180002046:	49 03 41 08          	add    rax,QWORD PTR [r9+0x8]
   18000204a:	49 89 80 f8 00 00 00 	mov    QWORD PTR [r8+0xf8],rax
   180002051:	31 c0                	xor    eax,eax
   180002053:	c3                   	ret
	...
   180002060:	48 83 ec 38          	sub    rsp,0x38
   180002064:	4d 89 c1             	mov    r9,r8
   180002067:	49 89 d0             	mov    r8,rdx
   18000206a:	89 4c 24 2c          	mov    DWORD PTR [rsp+0x2c],ecx
   18000206e:	48 8d 44 24 2c       	lea    rax,[rsp+0x2c]
   180002073:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   180002078:	8b 54 24 2c          	mov    edx,DWORD PTR [rsp+0x2c]
   18000207c:	85 d2                	test   edx,edx
   18000207e:	78 11                	js     0x180002091
