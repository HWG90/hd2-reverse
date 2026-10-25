; runtime.dll live .rwx page (RVA 0x4000), non-zero span 0x0-0x9C of 0x1000; on disk the page is all zero
; capture sha256 266b99f2d9d3dd47451d0cda369164807457520f0c8d1bb2327981cb1cf009c6, VA = 0x700000000000 + RVA, GNU objdump (GNU Binutils) 2.47
Disassembly of section .data:

0000700000004000 <.data>:
    700000004000:	4c 8b d1             	mov    r10,rcx
    700000004003:	b8 cf 00 00 00       	mov    eax,0xcf
    700000004008:	e9 fb c3 f1 ff       	jmp    0x6ffffff20408
    70000000400d:	4c 8b d1             	mov    r10,rcx
    700000004010:	b8 d0 00 00 00       	mov    eax,0xd0
    700000004015:	e9 0e c4 f1 ff       	jmp    0x6ffffff20428
    70000000401a:	4c 8b d1             	mov    r10,rcx
    70000000401d:	b8 2c 00 00 00       	mov    eax,0x2c
    700000004022:	e9 81 af f1 ff       	jmp    0x6ffffff1efa8
    700000004027:	4c 8b d1             	mov    r10,rcx
    70000000402a:	b8 50 00 00 00       	mov    eax,0x50
    70000000402f:	e9 f4 b3 f1 ff       	jmp    0x6ffffff1f428
    700000004034:	48 8d a4 24 00 00 00 00 	lea    rsp,[rsp+0x0]
    70000000403c:	e9 47 a2 f2 ff       	jmp    0x6ffffff2e288
    700000004041:	55                   	push   rbp
    700000004042:	57                   	push   rdi
    700000004043:	56                   	push   rsi
    700000004044:	53                   	push   rbx
    700000004045:	48 83 ec 28          	sub    rsp,0x28
    700000004049:	e9 4a a1 f2 ff       	jmp    0x6ffffff2e198
    70000000404e:	4c 8b d1             	mov    r10,rcx
    700000004051:	b8 43 00 00 00       	mov    eax,0x43
    700000004056:	e9 2d b2 f1 ff       	jmp    0x6ffffff1f288
    70000000405b:	4c 8b d1             	mov    r10,rcx
    70000000405e:	b8 75 00 00 00       	mov    eax,0x75
    700000004063:	e9 60 b8 f1 ff       	jmp    0x6ffffff1f8c8
    700000004068:	4c 8b d1             	mov    r10,rcx
    70000000406b:	b8 1c 00 00 00       	mov    eax,0x1c
    700000004070:	e9 33 ad f1 ff       	jmp    0x6ffffff1eda8
    700000004075:	4c 8b d1             	mov    r10,rcx
    700000004078:	b8 4e 00 00 00       	mov    eax,0x4e
    70000000407d:	e9 66 b3 f1 ff       	jmp    0x6ffffff1f3e8
    700000004082:	4c 8b d1             	mov    r10,rcx
    700000004085:	b8 85 00 00 00       	mov    eax,0x85
    70000000408a:	e9 39 ba f1 ff       	jmp    0x6ffffff1fac8
    70000000408f:	4c 8b d1             	mov    r10,rcx
    700000004092:	b8 19 00 00 00       	mov    eax,0x19
    700000004097:	e9 ac ac f1 ff       	jmp    0x6ffffff1ed48

; jmp targets (absolute VA; all outside runtime.dll's image):
;   0x6FFFFFF1ED48  (runtime.dll base - 0xE12B8)
;   0x6FFFFFF1EDA8  (runtime.dll base - 0xE1258)
;   0x6FFFFFF1EFA8  (runtime.dll base - 0xE1058)
;   0x6FFFFFF1F288  (runtime.dll base - 0xE0D78)
;   0x6FFFFFF1F3E8  (runtime.dll base - 0xE0C18)
;   0x6FFFFFF1F428  (runtime.dll base - 0xE0BD8)
;   0x6FFFFFF1F8C8  (runtime.dll base - 0xE0738)
;   0x6FFFFFF1FAC8  (runtime.dll base - 0xE0538)
;   0x6FFFFFF20408  (runtime.dll base - 0xDFBF8)
;   0x6FFFFFF20428  (runtime.dll base - 0xDFBD8)
;   0x6FFFFFF2E198  (runtime.dll base - 0xD1E68)
;   0x6FFFFFF2E288  (runtime.dll base - 0xD1D78)
