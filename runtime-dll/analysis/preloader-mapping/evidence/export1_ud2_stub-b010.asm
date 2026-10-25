; preloader.dll 0xA0CF546E, export ordinal 1 as exported: ud2 in section .entry
; RVA 0xB010-0xB020 (pdata bounded), VA = 0x180000000 + RVA
Disassembly of section .entry:

000000018000b010 <.entry+0x10>:
   18000b010:	0f 0b                	ud2
   18000b012:	00 00                	add    BYTE PTR [rax],al
   18000b014:	c3                   	ret
   18000b015:	00 00                	add    BYTE PTR [rax],al
   18000b017:	00 0f                	add    BYTE PTR [rdi],cl
   18000b019:	0b 00                	or     eax,DWORD PTR [rax]
   18000b01b:	00 c3                	add    bl,al
   18000b01d:	00 00                	add    BYTE PTR [rax],al
	...
