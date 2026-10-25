; preloader.dll 0xA0CF546E, AddressOfEntryPoint: ud2 in section .entry
; RVA 0xB030-0xB040 (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .entry:

000000018000b030 <.entry+0x30>:
   18000b030:	0f 0b                	ud2
   18000b032:	00 00                	add    BYTE PTR [rax],al
   18000b034:	c3                   	ret
   18000b035:	00 00                	add    BYTE PTR [rax],al
   18000b037:	00 0f                	add    BYTE PTR [rdi],cl
   18000b039:	0b 00                	or     eax,DWORD PTR [rax]
   18000b03b:	00 c3                	add    bl,al
   18000b03d:	00 00                	add    BYTE PTR [rax],al
	...
