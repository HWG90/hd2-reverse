0168c000 4183f818                         cmp r8d, 0x18
0168c004 7531                             jne 0x168c037
0168c006 488b0d63c17a01                   mov rcx, qword ptr [rip + 0x17ac163]
0168c00d 4533c0                           xor r8d, r8d
0168c010 8bc2                             mov eax, edx
0168c012 4881c1f8050000                   add rcx, 0x5f8
0168c019 4869d0e87a0000                   imul rdx, rax, 0x7ae8
0168c020 490391000b0000                   add rdx, qword ptr [r9 + 0xb00]
0168c027 e8d44bf8ff                       call 0x1610c00
0168c02c 84c0                             test al, al
0168c02e 7407                             je 0x168c037
0168c030 b001                             mov al, 1
0168c032 4883c428                         add rsp, 0x28
0168c036 c3                               ret 
0168c037 32c0                             xor al, al
0168c039 4883c428                         add rsp, 0x28
0168c03d c3                               ret 
0168c03e ad                               lodsd eax, dword ptr [rsi]
0168c03f c3                               ret 
0168c040 4057                             push rdi
0168c042 4881ece0000000                   sub rsp, 0xe0
0168c049 488b05c08fe200                   mov rax, qword ptr [rip + 0xe28fc0]
0168c050 4833c4                           xor rax, rsp
0168c053 48898424d0000000                 mov qword ptr [rsp + 0xd0], rax
0168c05b 488bf9                           mov rdi, rcx
0168c05e 4183e812                         sub r8d, 0x12
0168c062 0f84c9030000                     je 0x168c431
0168c068 4183e801                         sub r8d, 1
0168c06c 0f847f020000                     je 0x168c2f1
0168c072 48899c24f8000000                 mov qword ptr [rsp + 0xf8], rbx
0168c07a 4183e801                         sub r8d, 1
0168c07e 0f8438010000                     je 0x168c1bc
0168c084 4183e801                         sub r8d, 1
0168c088 0f84a3000000                     je 0x168c131
0168c08e 4183f802                         cmp r8d, 2
0168c092 757c                             jne 0x168c110
0168c094 8b811c0b0100                     mov eax, dword ptr [rcx + 0x10b1c]
0168c09a 418b19                           mov ebx, dword ptr [r9]
0168c09d 458d4817                         lea r9d, [r8 + 0x17]
0168c0a1 8999740f0100                     mov dword ptr [rcx + 0x10f74], ebx
0168c0a7 4c8d442460                       lea r8, [rsp + 0x60]
0168c0ac 4869d04c160000                   imul rdx, rax, 0x164c
0168c0b3 4803d1                           add rdx, rcx
0168c0b6 8b82989b0000                     mov eax, dword ptr [rdx + 0x9b98]
0168c0bc 486bc82c                         imul rcx, rax, 0x2c
0168c0c0 8b9411bc850000                   mov edx, dword ptr [rcx + rdx + 0x85bc]
0168c0c7 e814cdffff                       call 0x1688de0
0168c0cc 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c0d3 ffc8                             dec eax
0168c0d5 3bd8                             cmp ebx, eax
0168c0d7 0f42c3                           cmovb eax, ebx
0168c0da 8b448460                         mov eax, dword ptr [rsp + rax*4 + 0x60]
0168c0de 89416c                           mov dword ptr [rcx + 0x6c], eax
0168c0e1 83bf740f010000                   cmp dword ptr [rdi + 0x10f74], 0
0168c0e8 7426                             je 0x168c110
0168c0ea 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c0f1 8b414c                           mov eax, dword ptr [rcx + 0x4c]
0168c0f4 83c007                           add eax, 7
0168c0f7 83e0f8                           and eax, 0xfffffff8
0168c0fa 894154                           mov dword ptr [rcx + 0x54], eax
0168c0fd 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c104 8b4150                           mov eax, dword ptr [rcx + 0x50]
0168c107 83c007                           add eax, 7
0168c10a 83e0f8                           and eax, 0xfffffff8
0168c10d 894158                           mov dword ptr [rcx + 0x58], eax
0168c110 488b9c24f8000000                 mov rbx, qword ptr [rsp + 0xf8]
0168c118 488b8c24d0000000                 mov rcx, qword ptr [rsp + 0xd0]
0168c120 4833cc                           xor rcx, rsp
0168c123 e8283c8800                       call 0x1f0fd50
0168c128 4881c4e0000000                   add rsp, 0xe0
0168c12f 5f                               pop rdi
0168c130 c3                               ret 
0168c131 488b8900820000                   mov rcx, qword ptr [rcx + 0x8200]
0168c138 4d8bc1                           mov r8, r9
0168c13b ba15000000                       mov edx, 0x15
0168c140 e88b279fff                       call 0x107e8d0
0168c145 4c8b9f00820000                   mov r11, qword ptr [rdi + 0x8200]
0168c14c 418b9b90000000                   mov ebx, dword ptr [r11 + 0x90]
0168c153 83fb02                           cmp ebx, 2
0168c156 0f8246010000                     jb 0x168c2a2
0168c15c 418b4354                         mov eax, dword ptr [r11 + 0x54]
0168c160 498d4b54                         lea rcx, [r11 + 0x54]
0168c164 89442454                         mov dword ptr [rsp + 0x54], eax
0168c168 498d5358                         lea rdx, [r11 + 0x58]
0168c16c 8b02                             mov eax, dword ptr [rdx]
0168c16e 4d8d4b50                         lea r9, [r11 + 0x50]
0168c172 89442450                         mov dword ptr [rsp + 0x50], eax
0168c176 4d8d434c                         lea r8, [r11 + 0x4c]
0168c17a 488b0547536501                   mov rax, qword ptr [rip + 0x1655347]
0168c181 4c8b9030010000                   mov r10, qword ptr [rax + 0x130]
0168c188 418b436c                         mov eax, dword ptr [r11 + 0x6c]
0168c18c 89442440                         mov dword ptr [rsp + 0x40], eax
0168c190 418b838c000000                   mov eax, dword ptr [r11 + 0x8c]
0168c197 89442438                         mov dword ptr [rsp + 0x38], eax
0168c19b 488d442450                       lea rax, [rsp + 0x50]
0168c1a0 895c2430                         mov dword ptr [rsp + 0x30], ebx
0168c1a4 4889442428                       mov qword ptr [rsp + 0x28], rax
0168c1a9 488d442454                       lea rax, [rsp + 0x54]
0168c1ae 4889442420                       mov qword ptr [rsp + 0x20], rax
0168c1b3 41ff5240                         call qword ptr [r10 + 0x40]
0168c1b7 e954ffffff                       jmp 0x168c110
0168c1bc 8b811c0b0100                     mov eax, dword ptr [rcx + 0x10b1c]
0168c1c2 0f57c0                           xorps xmm0, xmm0
0168c1c5 418b09                           mov ecx, dword ptr [r9]
0168c1c8 4869d04c160000                   imul rdx, rax, 0x164c
0168c1cf 4803d7                           add rdx, rdi
0168c1d2 898a989b0000                     mov dword ptr [rdx + 0x9b98], ecx
0168c1d8 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c1df 894864                           mov dword ptr [rax + 0x64], ecx
0168c1e2 8b82989b0000                     mov eax, dword ptr [rdx + 0x9b98]
0168c1e8 486bc82c                         imul rcx, rax, 0x2c
0168c1ec 8b8411b4850000                   mov eax, dword ptr [rcx + rdx + 0x85b4]
0168c1f3 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c1f8 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c1ff f3480f2cc8                       cvttss2si rcx, xmm0
0168c204 0f57c0                           xorps xmm0, xmm0
0168c207 89484c                           mov dword ptr [rax + 0x4c], ecx
0168c20a 8b82989b0000                     mov eax, dword ptr [rdx + 0x9b98]
0168c210 486bc82c                         imul rcx, rax, 0x2c
0168c214 8b8411b8850000                   mov eax, dword ptr [rcx + rdx + 0x85b8]
0168c21b f3480f2ac0                       cvtsi2ss xmm0, rax
0168c220 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c227 f3480f2cc8                       cvttss2si rcx, xmm0
0168c22c 894850                           mov dword ptr [rax + 0x50], ecx
0168c22f 4c8b9f00820000                   mov r11, qword ptr [rdi + 0x8200]
0168c236 418b9b90000000                   mov ebx, dword ptr [r11 + 0x90]
0168c23d 83fb02                           cmp ebx, 2
0168c240 7260                             jb 0x168c2a2
0168c242 418b4354                         mov eax, dword ptr [r11 + 0x54]
0168c246 498d4b54                         lea rcx, [r11 + 0x54]
0168c24a 89442450                         mov dword ptr [rsp + 0x50], eax
0168c24e 498d5358                         lea rdx, [r11 + 0x58]
0168c252 8b02                             mov eax, dword ptr [rdx]
0168c254 4d8d4b50                         lea r9, [r11 + 0x50]
0168c258 89442454                         mov dword ptr [rsp + 0x54], eax
0168c25c 4d8d434c                         lea r8, [r11 + 0x4c]
0168c260 488b0561526501                   mov rax, qword ptr [rip + 0x1655261]
0168c267 4c8b9030010000                   mov r10, qword ptr [rax + 0x130]
0168c26e 418b436c                         mov eax, dword ptr [r11 + 0x6c]
0168c272 89442440                         mov dword ptr [rsp + 0x40], eax
0168c276 418b838c000000                   mov eax, dword ptr [r11 + 0x8c]
0168c27d 89442438                         mov dword ptr [rsp + 0x38], eax
0168c281 488d442454                       lea rax, [rsp + 0x54]
0168c286 895c2430                         mov dword ptr [rsp + 0x30], ebx
0168c28a 4889442428                       mov qword ptr [rsp + 0x28], rax
0168c28f 488d442450                       lea rax, [rsp + 0x50]
0168c294 4889442420                       mov qword ptr [rsp + 0x20], rax
0168c299 41ff5240                         call qword ptr [r10 + 0x40]
0168c29d e96efeffff                       jmp 0x168c110
0168c2a2 418b4368                         mov eax, dword ptr [r11 + 0x68]
0168c2a6 488d150b32a500                   lea rdx, [rip + 0xa5320b]
0168c2ad 0f57c0                           xorps xmm0, xmm0
0168c2b0 f30f100c82                       movss xmm1, dword ptr [rdx + rax*4]
0168c2b5 418b434c                         mov eax, dword ptr [r11 + 0x4c]
0168c2b9 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c2be f30f59c1                         mulss xmm0, xmm1
0168c2c2 f3480f2cc0                       cvttss2si rax, xmm0
0168c2c7 0f57c0                           xorps xmm0, xmm0
0168c2ca 83c007                           add eax, 7
0168c2cd 83e0f8                           and eax, 0xfffffff8
0168c2d0 41894354                         mov dword ptr [r11 + 0x54], eax
0168c2d4 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c2db 8b4150                           mov eax, dword ptr [rcx + 0x50]
0168c2de f3480f2ac0                       cvtsi2ss xmm0, rax
0168c2e3 f30f59c1                         mulss xmm0, xmm1
0168c2e7 f3480f2cc0                       cvttss2si rax, xmm0
0168c2ec e916feffff                       jmp 0x168c107
0168c2f1 418b01                           mov eax, dword ptr [r9]
0168c2f4 4c8d8750850000                   lea r8, [rdi + 0x8550]
0168c2fb 8b911c0b0100                     mov edx, dword ptr [rcx + 0x10b1c]
0168c301 89811c0b0100                     mov dword ptr [rcx + 0x10b1c], eax
0168c307 4869c84c160000                   imul rcx, rax, 0x164c
0168c30e 4c03c1                           add r8, rcx
0168c311 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c318 418b4040                         mov eax, dword ptr [r8 + 0x40]
0168c31c 894160                           mov dword ptr [rcx + 0x60], eax
0168c31f 458b9044160000                   mov r10d, dword ptr [r8 + 0x1644]
0168c326 4869ca4c160000                   imul rcx, rdx, 0x164c
0168c32d 488d9794850000                   lea rdx, [rdi + 0x8594]
0168c334 4803d1                           add rdx, rcx
0168c337 33c9                             xor ecx, ecx
0168c339 8b8204160000                     mov eax, dword ptr [rdx + 0x1604]
0168c33f 4c6bc82c                         imul r9, rax, 0x2c
0168c343 4c03ca                           add r9, rdx
0168c346 4585d2                           test r10d, r10d
0168c349 743c                             je 0x168c387
0168c34b 458b5920                         mov r11d, dword ptr [r9 + 0x20]
0168c34f 90                               nop 
0168c350 8bc1                             mov eax, ecx
0168c352 486bd02c                         imul rdx, rax, 0x2c
0168c356 46395c0264                       cmp dword ptr [rdx + r8 + 0x64], r11d
0168c35b 750b                             jne 0x168c368
0168c35d 418b4124                         mov eax, dword ptr [r9 + 0x24]
0168c361 4239440268                       cmp dword ptr [rdx + r8 + 0x68], eax
0168c366 7409                             je 0x168c371
0168c368 ffc1                             inc ecx
0168c36a 413bca                           cmp ecx, r10d
0168c36d 72e1                             jb 0x168c350
0168c36f eb16                             jmp 0x168c387
0168c371 83f9ff                           cmp ecx, -1
0168c374 7411                             je 0x168c387
0168c376 41898848160000                   mov dword ptr [r8 + 0x1648], ecx
0168c37d 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c384 894864                           mov dword ptr [rax + 0x64], ecx
0168c387 418b8048160000                   mov eax, dword ptr [r8 + 0x1648]
0168c38e 488d152331a500                   lea rdx, [rip + 0xa53123]
0168c395 486bc82c                         imul rcx, rax, 0x2c
0168c399 0f57c0                           xorps xmm0, xmm0
0168c39c 428b440164                       mov eax, dword ptr [rcx + r8 + 0x64]
0168c3a1 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c3a6 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c3ad f3480f2cc8                       cvttss2si rcx, xmm0
0168c3b2 0f57c0                           xorps xmm0, xmm0
0168c3b5 89484c                           mov dword ptr [rax + 0x4c], ecx
0168c3b8 418b8048160000                   mov eax, dword ptr [r8 + 0x1648]
0168c3bf 486bc82c                         imul rcx, rax, 0x2c
0168c3c3 428b440168                       mov eax, dword ptr [rcx + r8 + 0x68]
0168c3c8 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c3cd 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c3d4 f3480f2cc8                       cvttss2si rcx, xmm0
0168c3d9 0f57c0                           xorps xmm0, xmm0
0168c3dc 894850                           mov dword ptr [rax + 0x50], ecx
0168c3df 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c3e6 8b4168                           mov eax, dword ptr [rcx + 0x68]
0168c3e9 f30f100c82                       movss xmm1, dword ptr [rdx + rax*4]
0168c3ee 8b414c                           mov eax, dword ptr [rcx + 0x4c]
0168c3f1 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c3f6 f30f59c1                         mulss xmm0, xmm1
0168c3fa f3480f2cc0                       cvttss2si rax, xmm0
0168c3ff 0f57c0                           xorps xmm0, xmm0
0168c402 83c007                           add eax, 7
0168c405 83e0f8                           and eax, 0xfffffff8
0168c408 894154                           mov dword ptr [rcx + 0x54], eax
0168c40b 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c412 8b4150                           mov eax, dword ptr [rcx + 0x50]
0168c415 f3480f2ac0                       cvtsi2ss xmm0, rax
0168c41a f30f59c1                         mulss xmm0, xmm1
0168c41e f3480f2cc0                       cvttss2si rax, xmm0
0168c423 83c007                           add eax, 7
0168c426 83e0f8                           and eax, 0xfffffff8
0168c429 894158                           mov dword ptr [rcx + 0x58], eax
0168c42c e9e7fcffff                       jmp 0x168c118
0168c431 418b01                           mov eax, dword ptr [r9]
0168c434 488b9700820000                   mov rdx, qword ptr [rdi + 0x8200]
0168c43b 8981640f0100                     mov dword ptr [rcx + 0x10f64], eax
0168c441 486bc844                         imul rcx, rax, 0x44
0168c445 8b8439600b0100                   mov eax, dword ptr [rcx + rdi + 0x10b60]
0168c44c 89425c                           mov dword ptr [rdx + 0x5c], eax
0168c44f e9c4fcffff                       jmp 0x168c118
0168c454 4883ec20                         sub rsp, 0x20
0168c458 48898588000000                   mov qword ptr [rbp + 0x88], rax
0168c45f 90                               nop 
0168c460 4c89442418                       mov qword ptr [rsp + 0x18], r8
0168c465 4889542410                       mov qword ptr [rsp + 0x10], rdx
0168c46a 53                               push rbx
0168c46b 55                               push rbp
0168c46c 56                               push rsi
0168c46d 57                               push rdi
0168c46e 4156                             push r14
0168c470 4157                             push r15
0168c472 4883ec28                         sub rsp, 0x28
0168c476 4532f6                           xor r14b, r14b
0168c479 418bd9                           mov ebx, r9d
0168c47c 498be8                           mov rbp, r8
0168c47f 488bf2                           mov rsi, rdx
0168c482 488bf9                           mov rdi, rcx
0168c485 4438b1d8810000                   cmp byte ptr [rcx + 0x81d8], r14b
0168c48c 0f847f030000                     je 0x168c811
0168c492 4881c148570000                   add rcx, 0x5748
0168c499 e84269f9ff                       call 0x1622de0
0168c49e 84c0                             test al, al
0168c4a0 0f84590b0000                     je 0x168cfff
0168c4a6 8b87c87d0000                     mov eax, dword ptr [rdi + 0x7dc8]
0168c4ac 83f802                           cmp eax, 2
0168c4af 0f8592010000                     jne 0x168c647
0168c4b5 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c4bc 488d9720820000                   lea rdx, [rdi + 0x8220]
0168c4c3 41bf03000000                     mov r15d, 3
0168c4c9 488bc1                           mov rax, rcx
0168c4cc 458bc7                           mov r8d, r15d
0168c4cf 90                               nop 
0168c4d0 488d9280000000                   lea rdx, [rdx + 0x80]
0168c4d7 0f1000                           movups xmm0, xmmword ptr [rax]
0168c4da 488d8080000000                   lea rax, [rax + 0x80]
0168c4e1 0f114280                         movups xmmword ptr [rdx - 0x80], xmm0
0168c4e5 0f104890                         movups xmm1, xmmword ptr [rax - 0x70]
0168c4e9 0f114a90                         movups xmmword ptr [rdx - 0x70], xmm1
0168c4ed 0f1040a0                         movups xmm0, xmmword ptr [rax - 0x60]
0168c4f1 0f1142a0                         movups xmmword ptr [rdx - 0x60], xmm0
0168c4f5 0f1048b0                         movups xmm1, xmmword ptr [rax - 0x50]
0168c4f9 0f114ab0                         movups xmmword ptr [rdx - 0x50], xmm1
0168c4fd 0f1040c0                         movups xmm0, xmmword ptr [rax - 0x40]
0168c501 0f1142c0                         movups xmmword ptr [rdx - 0x40], xmm0
0168c505 0f1048d0                         movups xmm1, xmmword ptr [rax - 0x30]
0168c509 0f114ad0                         movups xmmword ptr [rdx - 0x30], xmm1
0168c50d 0f1040e0                         movups xmm0, xmmword ptr [rax - 0x20]
0168c511 0f1142e0                         movups xmmword ptr [rdx - 0x20], xmm0
0168c515 0f1048f0                         movups xmm1, xmmword ptr [rax - 0x10]
0168c519 0f114af0                         movups xmmword ptr [rdx - 0x10], xmm1
0168c51d 4983e801                         sub r8, 1
0168c521 75ad                             jne 0x168c4d0
0168c523 0f1000                           movups xmm0, xmmword ptr [rax]
0168c526 4c8b05db4f6501                   mov r8, qword ptr [rip + 0x1654fdb]
0168c52d 0f1102                           movups xmmword ptr [rdx], xmm0
0168c530 8b4010                           mov eax, dword ptr [rax + 0x10]
0168c533 894210                           mov dword ptr [rdx + 0x10], eax
0168c536 498d905cc40a00                   lea rdx, [r8 + 0xac45c]
0168c53d 498bc7                           mov rax, r15
0168c540 488d9280000000                   lea rdx, [rdx + 0x80]
0168c547 0f1001                           movups xmm0, xmmword ptr [rcx]
0168c54a 488d8980000000                   lea rcx, [rcx + 0x80]
0168c551 0f114280                         movups xmmword ptr [rdx - 0x80], xmm0
0168c555 0f104990                         movups xmm1, xmmword ptr [rcx - 0x70]
0168c559 0f114a90                         movups xmmword ptr [rdx - 0x70], xmm1
0168c55d 0f1041a0                         movups xmm0, xmmword ptr [rcx - 0x60]
0168c561 0f1142a0                         movups xmmword ptr [rdx - 0x60], xmm0
0168c565 0f1049b0                         movups xmm1, xmmword ptr [rcx - 0x50]
0168c569 0f114ab0                         movups xmmword ptr [rdx - 0x50], xmm1
0168c56d 0f1041c0                         movups xmm0, xmmword ptr [rcx - 0x40]
0168c571 0f1142c0                         movups xmmword ptr [rdx - 0x40], xmm0
0168c575 0f1049d0                         movups xmm1, xmmword ptr [rcx - 0x30]
0168c579 0f114ad0                         movups xmmword ptr [rdx - 0x30], xmm1
0168c57d 0f1041e0                         movups xmm0, xmmword ptr [rcx - 0x20]
0168c581 0f1142e0                         movups xmmword ptr [rdx - 0x20], xmm0
0168c585 0f1049f0                         movups xmm1, xmmword ptr [rcx - 0x10]
0168c589 0f114af0                         movups xmmword ptr [rdx - 0x10], xmm1
0168c58d 4883e801                         sub rax, 1
0168c591 75ad                             jne 0x168c540
0168c593 0f1001                           movups xmm0, xmmword ptr [rcx]
0168c596 0f1102                           movups xmmword ptr [rdx], xmm0
0168c599 8b4110                           mov eax, dword ptr [rcx + 0x10]
0168c59c 488d8fb4830000                   lea rcx, [rdi + 0x83b4]
0168c5a3 894210                           mov dword ptr [rdx + 0x10], eax
0168c5a6 488b9700820000                   mov rdx, qword ptr [rdi + 0x8200]
0168c5ad 488bc2                           mov rax, rdx
0168c5b0 488d8980000000                   lea rcx, [rcx + 0x80]
0168c5b7 0f1000                           movups xmm0, xmmword ptr [rax]
0168c5ba 488d8080000000                   lea rax, [rax + 0x80]
0168c5c1 0f114180                         movups xmmword ptr [rcx - 0x80], xmm0
0168c5c5 0f104890                         movups xmm1, xmmword ptr [rax - 0x70]
0168c5c9 0f114990                         movups xmmword ptr [rcx - 0x70], xmm1
0168c5cd 0f1040a0                         movups xmm0, xmmword ptr [rax - 0x60]
0168c5d1 0f1141a0                         movups xmmword ptr [rcx - 0x60], xmm0
0168c5d5 0f1048b0                         movups xmm1, xmmword ptr [rax - 0x50]
0168c5d9 0f1149b0                         movups xmmword ptr [rcx - 0x50], xmm1
0168c5dd 0f1040c0                         movups xmm0, xmmword ptr [rax - 0x40]
0168c5e1 0f1141c0                         movups xmmword ptr [rcx - 0x40], xmm0
0168c5e5 0f1048d0                         movups xmm1, xmmword ptr [rax - 0x30]
0168c5e9 0f1149d0                         movups xmmword ptr [rcx - 0x30], xmm1
0168c5ed 0f1040e0                         movups xmm0, xmmword ptr [rax - 0x20]
0168c5f1 0f1141e0                         movups xmmword ptr [rcx - 0x20], xmm0
0168c5f5 0f1048f0                         movups xmm1, xmmword ptr [rax - 0x10]
0168c5f9 0f1149f0                         movups xmmword ptr [rcx - 0x10], xmm1
0168c5fd 4983ef01                         sub r15, 1
0168c601 75ad                             jne 0x168c5b0
0168c603 0f1000                           movups xmm0, xmmword ptr [rax]
0168c606 0f1101                           movups xmmword ptr [rcx], xmm0
0168c609 8b4010                           mov eax, dword ptr [rax + 0x10]
0168c60c 894110                           mov dword ptr [rcx + 0x10], eax
0168c60f 44387239                         cmp byte ptr [rdx + 0x39], r14b
0168c613 7416                             je 0x168c62b
0168c615 418d5701                         lea edx, [r15 + 1]
0168c619 41c6803c11000001                 mov byte ptr [r8 + 0x113c], 1
0168c621 e88a20b8ff                       call 0x120e6b0
0168c626 e9b5010000                       jmp 0x168c7e0
0168c62b 44387238                         cmp byte ptr [rdx + 0x38], r14b
0168c62f 7407                             je 0x168c638
0168c631 4588b03c110000                   mov byte ptr [r8 + 0x113c], r14b
0168c638 ba01000000                       mov edx, 1
0168c63d e86e20b8ff                       call 0x120e6b0
0168c642 e999010000                       jmp 0x168c7e0
0168c647 83f803                           cmp eax, 3
0168c64a 0f8590010000                     jne 0x168c7e0
0168c650 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c657 488d8720820000                   lea rax, [rdi + 0x8220]
0168c65e 41bf03000000                     mov r15d, 3
0168c664 418bd7                           mov edx, r15d
0168c667 660f1f840000000000               nop word ptr [rax + rax]
0168c670 488d8980000000                   lea rcx, [rcx + 0x80]
0168c677 0f1000                           movups xmm0, xmmword ptr [rax]
0168c67a 488d8080000000                   lea rax, [rax + 0x80]
0168c681 0f114180                         movups xmmword ptr [rcx - 0x80], xmm0
0168c685 0f104890                         movups xmm1, xmmword ptr [rax - 0x70]
0168c689 0f114990                         movups xmmword ptr [rcx - 0x70], xmm1
0168c68d 0f1040a0                         movups xmm0, xmmword ptr [rax - 0x60]
0168c691 0f1141a0                         movups xmmword ptr [rcx - 0x60], xmm0
0168c695 0f1048b0                         movups xmm1, xmmword ptr [rax - 0x50]
0168c699 0f1149b0                         movups xmmword ptr [rcx - 0x50], xmm1
0168c69d 0f1040c0                         movups xmm0, xmmword ptr [rax - 0x40]
0168c6a1 0f1141c0                         movups xmmword ptr [rcx - 0x40], xmm0
0168c6a5 0f1048d0                         movups xmm1, xmmword ptr [rax - 0x30]
0168c6a9 0f1149d0                         movups xmmword ptr [rcx - 0x30], xmm1
0168c6ad 0f1040e0                         movups xmm0, xmmword ptr [rax - 0x20]
0168c6b1 0f1141e0                         movups xmmword ptr [rcx - 0x20], xmm0
0168c6b5 0f1048f0                         movups xmm1, xmmword ptr [rax - 0x10]
0168c6b9 0f1149f0                         movups xmmword ptr [rcx - 0x10], xmm1
0168c6bd 4883ea01                         sub rdx, 1
0168c6c1 75ad                             jne 0x168c670
0168c6c3 0f1000                           movups xmm0, xmmword ptr [rax]
0168c6c6 488b153b4e6501                   mov rdx, qword ptr [rip + 0x1654e3b]
0168c6cd 4881c25cc40a00                   add rdx, 0xac45c
0168c6d4 0f1101                           movups xmmword ptr [rcx], xmm0
0168c6d7 8b4010                           mov eax, dword ptr [rax + 0x10]
0168c6da 894110                           mov dword ptr [rcx + 0x10], eax
0168c6dd 498bc7                           mov rax, r15
0168c6e0 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168c6e7 660f1f840000000000               nop word ptr [rax + rax]
0168c6f0 488d9280000000                   lea rdx, [rdx + 0x80]
0168c6f7 0f1001                           movups xmm0, xmmword ptr [rcx]
0168c6fa 488d8980000000                   lea rcx, [rcx + 0x80]
0168c701 0f114280                         movups xmmword ptr [rdx - 0x80], xmm0
0168c705 0f104990                         movups xmm1, xmmword ptr [rcx - 0x70]
0168c709 0f114a90                         movups xmmword ptr [rdx - 0x70], xmm1
0168c70d 0f1041a0                         movups xmm0, xmmword ptr [rcx - 0x60]
0168c711 0f1142a0                         movups xmmword ptr [rdx - 0x60], xmm0
0168c715 0f1049b0                         movups xmm1, xmmword ptr [rcx - 0x50]
0168c719 0f114ab0                         movups xmmword ptr [rdx - 0x50], xmm1
0168c71d 0f1041c0                         movups xmm0, xmmword ptr [rcx - 0x40]
0168c721 0f1142c0                         movups xmmword ptr [rdx - 0x40], xmm0
0168c725 0f1049d0                         movups xmm1, xmmword ptr [rcx - 0x30]
0168c729 0f114ad0                         movups xmmword ptr [rdx - 0x30], xmm1
0168c72d 0f1041e0                         movups xmm0, xmmword ptr [rcx - 0x20]
0168c731 0f1142e0                         movups xmmword ptr [rdx - 0x20], xmm0
0168c735 0f1049f0                         movups xmm1, xmmword ptr [rcx - 0x10]
0168c739 0f114af0                         movups xmmword ptr [rdx - 0x10], xmm1
0168c73d 4883e801                         sub rax, 1
0168c741 75ad                             jne 0x168c6f0
0168c743 0f1001                           movups xmm0, xmmword ptr [rcx]
0168c746 0f1102                           movups xmmword ptr [rdx], xmm0
0168c749 8b4110                           mov eax, dword ptr [rcx + 0x10]
0168c74c 488d8fb4830000                   lea rcx, [rdi + 0x83b4]
0168c753 894210                           mov dword ptr [rdx + 0x10], eax
0168c756 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168c75d 0f1f00                           nop dword ptr [rax]
0168c760 488d8980000000                   lea rcx, [rcx + 0x80]
0168c767 0f1000                           movups xmm0, xmmword ptr [rax]
0168c76a 488d8080000000                   lea rax, [rax + 0x80]
0168c771 0f114180                         movups xmmword ptr [rcx - 0x80], xmm0
0168c775 0f104890                         movups xmm1, xmmword ptr [rax - 0x70]
0168c779 0f114990                         movups xmmword ptr [rcx - 0x70], xmm1
0168c77d 0f1040a0                         movups xmm0, xmmword ptr [rax - 0x60]
0168c781 0f1141a0                         movups xmmword ptr [rcx - 0x60], xmm0
0168c785 0f1048b0                         movups xmm1, xmmword ptr [rax - 0x50]
0168c789 0f1149b0                         movups xmmword ptr [rcx - 0x50], xmm1
0168c78d 0f1040c0                         movups xmm0, xmmword ptr [rax - 0x40]
0168c791 0f1141c0                         movups xmmword ptr [rcx - 0x40], xmm0
0168c795 0f1048d0                         movups xmm1, xmmword ptr [rax - 0x30]
0168c799 0f1149d0                         movups xmmword ptr [rcx - 0x30], xmm1
0168c79d 0f1040e0                         movups xmm0, xmmword ptr [rax - 0x20]
0168c7a1 0f1141e0                         movups xmmword ptr [rcx - 0x20], xmm0
0168c7a5 0f1048f0                         movups xmm1, xmmword ptr [rax - 0x10]
0168c7a9 0f1149f0                         movups xmmword ptr [rcx - 0x10], xmm1
0168c7ad 4983ef01                         sub r15, 1
0168c7b1 75ad                             jne 0x168c760
0168c7b3 0f1000                           movups xmm0, xmmword ptr [rax]
0168c7b6 33d2                             xor edx, edx
0168c7b8 458d4708                         lea r8d, [r15 + 8]
0168c7bc 0f1101                           movups xmmword ptr [rcx], xmm0
0168c7bf 8b4010                           mov eax, dword ptr [rax + 0x10]
0168c7c2 894110                           mov dword ptr [rcx + 0x10], eax
0168c7c5 488d8f20820000                   lea rcx, [rdi + 0x8220]
0168c7cc e89f2983ff                       call 0xebf170
0168c7d1 488d9720820000                   lea rdx, [rdi + 0x8220]
0168c7d8 488bcf                           mov rcx, rdi
0168c7db e830d4ffff                       call 0x1689c10
0168c7e0 488b0589b97a01                   mov rax, qword ptr [rip + 0x17ab989]
0168c7e7 4488b0af080000                   mov byte ptr [rax + 0x8af], r14b
0168c7ee b001                             mov al, 1
0168c7f0 c7874c85000000000000             mov dword ptr [rdi + 0x854c], 0
0168c7fa c787c87d000000000000             mov dword ptr [rdi + 0x7dc8], 0
0168c804 4883c428                         add rsp, 0x28
0168c808 415f                             pop r15
0168c80a 415e                             pop r14
0168c80c 5f                               pop rdi
0168c80d 5e                               pop rsi
0168c80e 5d                               pop rbp
0168c80f 5b                               pop rbx
0168c810 c3                               ret 
0168c811 4438b1a8560000                   cmp byte ptr [rcx + 0x56a8], r14b
0168c818 0f84cc070000                     je 0x168cfea
0168c81e 4438b1a9560000                   cmp byte ptr [rcx + 0x56a9], r14b
0168c825 0f85d4070000                     jne 0x168cfff
0168c82b 4438b1e6810000                   cmp byte ptr [rcx + 0x81e6], r14b
0168c832 7443                             je 0x168c877
0168c834 4881c130030000                   add rcx, 0x330
0168c83b e8b08af8ff                       call 0x16152f0
0168c840 84c0                             test al, al
0168c842 7433                             je 0x168c877
0168c844 f30f108fe80a0000                 movss xmm1, dword ptr [rdi + 0xae8]
0168c84c 488d8f20020000                   lea rcx, [rdi + 0x220]
0168c853 f30f598fe00a0000                 mulss xmm1, dword ptr [rdi + 0xae0]
0168c85b 0f57c0                           xorps xmm0, xmm0
0168c85e 41b601                           mov r14b, 1
0168c861 f30f11442460                     movss dword ptr [rsp + 0x60], xmm0
0168c867 f30f114c2464                     movss dword ptr [rsp + 0x64], xmm1
0168c86d 488b542460                       mov rdx, qword ptr [rsp + 0x60]
0168c872 e8392bc5ff                       call 0x12df3b0
0168c877 488b05d2b97a01                   mov rax, qword ptr [rip + 0x17ab9d2]
0168c87e 80b8d41a0e0000                   cmp byte ptr [rax + 0xe1ad4], 0
0168c885 7477                             je 0x168c8fe
0168c887 8b87e8810000                     mov eax, dword ptr [rdi + 0x81e8]
0168c88d 33f6                             xor esi, esi
0168c88f 85c0                             test eax, eax
0168c891 7e61                             jle 0x168c8f4
0168c893 0f1f4000                         nop dword ptr [rax]
0168c897 660f1f840000000000               nop word ptr [rax + rax]
0168c8a0 488b0dc9b87a01                   mov rcx, qword ptr [rip + 0x17ab8c9]
0168c8a7 488d9710010000                   lea rdx, [rdi + 0x110]
0168c8ae 4863c6                           movsxd rax, esi
0168c8b1 4881c1f8050000                   add rcx, 0x5f8
0168c8b8 4869d8e87a0000                   imul rbx, rax, 0x7ae8
0168c8bf 4533c0                           xor r8d, r8d
0168c8c2 48039f000b0000                   add rbx, qword ptr [rdi + 0xb00]
0168c8c9 e83243f8ff                       call 0x1610c00
0168c8ce 0fb6d0                           movzx edx, al
0168c8d1 488bcb                           mov rcx, rbx
0168c8d4 e8f74cffff                       call 0x16815d0
0168c8d9 84c0                             test al, al
0168c8db 7406                             je 0x168c8e3
0168c8dd 89b710820000                     mov dword ptr [rdi + 0x8210], esi
0168c8e3 8b87e8810000                     mov eax, dword ptr [rdi + 0x81e8]
0168c8e9 ffc6                             inc esi
0168c8eb 3bf0                             cmp esi, eax
0168c8ed 7cb1                             jl 0x168c8a0
0168c8ef 488b6c2470                       mov rbp, qword ptr [rsp + 0x70]
0168c8f4 488b742468                       mov rsi, qword ptr [rsp + 0x68]
0168c8f9 e9cb000000                       jmp 0x168c9c9
0168c8fe 83fb02                           cmp ebx, 2
0168c901 7547                             jne 0x168c94a
0168c903 448b87e8810000                   mov r8d, dword ptr [rdi + 0x81e8]
0168c90a 8b9710820000                     mov edx, dword ptr [rdi + 0x8210]
0168c910 41ffc8                           dec r8d
0168c913 413bd0                           cmp edx, r8d
0168c916 7d6b                             jge 0x168c983
0168c918 0f1f840000000000                 nop dword ptr [rax + rax]
0168c920 ffc2                             inc edx
0168c922 899710820000                     mov dword ptr [rdi + 0x8210], edx
0168c928 413bd0                           cmp edx, r8d
0168c92b 7d56                             jge 0x168c983
0168c92d 4863c2                           movsxd rax, edx
0168c930 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168c937 488b87000b0000                   mov rax, qword ptr [rdi + 0xb00]
0168c93e 80bc01cb7a000000                 cmp byte ptr [rcx + rax + 0x7acb], 0
0168c946 75d8                             jne 0x168c920
0168c948 eb39                             jmp 0x168c983
0168c94a 83fb01                           cmp ebx, 1
0168c94d 7534                             jne 0x168c983
0168c94f 8b9710820000                     mov edx, dword ptr [rdi + 0x8210]
0168c955 85d2                             test edx, edx
0168c957 7e2a                             jle 0x168c983
0168c959 0f1f8000000000                   nop dword ptr [rax]
0168c960 8bc2                             mov eax, edx
0168c962 ffca                             dec edx
0168c964 899710820000                     mov dword ptr [rdi + 0x8210], edx
0168c96a 85d2                             test edx, edx
0168c96c 7e15                             jle 0x168c983
0168c96e 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168c975 488b87000b0000                   mov rax, qword ptr [rdi + 0xb00]
0168c97c 807c01e300                       cmp byte ptr [rcx + rax - 0x1d], 0
0168c981 75dd                             jne 0x168c960
0168c983 8b87e8810000                     mov eax, dword ptr [rdi + 0x81e8]
0168c989 33db                             xor ebx, ebx
0168c98b 85c0                             test eax, eax
0168c98d 7e3a                             jle 0x168c9c9
0168c98f 90                               nop 
0168c990 4863c3                           movsxd rax, ebx
0168c993 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168c99a 48038f000b0000                   add rcx, qword ptr [rdi + 0xb00]
0168c9a1 3b9f10820000                     cmp ebx, dword ptr [rdi + 0x8210]
0168c9a7 750d                             jne 0x168c9b6
0168c9a9 80bfe581000000                   cmp byte ptr [rdi + 0x81e5], 0
0168c9b0 7404                             je 0x168c9b6
0168c9b2 b201                             mov dl, 1
0168c9b4 eb02                             jmp 0x168c9b8
0168c9b6 33d2                             xor edx, edx
0168c9b8 e8e34affff                       call 0x16814a0
0168c9bd 8b87e8810000                     mov eax, dword ptr [rdi + 0x81e8]
0168c9c3 ffc3                             inc ebx
0168c9c5 3bd8                             cmp ebx, eax
0168c9c7 7cc7                             jl 0x168c990
0168c9c9 f30f10874c850000                 movss xmm0, dword ptr [rdi + 0x854c]
0168c9d1 32db                             xor bl, bl
0168c9d3 0f2f050e99bb00                   comiss xmm0, dword ptr [rip + 0xbb990e]
0168c9da 0f82f9050000                     jb 0x168cfd9
0168c9e0 4c89642478                       mov qword ptr [rsp + 0x78], r12
0168c9e5 4533e4                           xor r12d, r12d
0168c9e8 85c0                             test eax, eax
0168c9ea 0f8ee4050000                     jle 0x168cfd4
0168c9f0 4c896c2420                       mov qword ptr [rsp + 0x20], r13
0168c9f5 458d7c2403                       lea r15d, [r12 + 3]
0168c9fa 4533ed                           xor r13d, r13d
0168c9fd 0f1f00                           nop dword ptr [rax]
0168ca00 4963c4                           movsxd rax, r12d
0168ca03 4c8bc5                           mov r8, rbp
0168ca06 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168ca0d 488bd6                           mov rdx, rsi
0168ca10 48038f000b0000                   add rcx, qword ptr [rdi + 0xb00]
0168ca17 e89441ffff                       call 0x1680bb0
0168ca1c 84c0                             test al, al
0168ca1e 0f8482050000                     je 0x168cfa6
0168ca24 488bb7000b0000                   mov rsi, qword ptr [rdi + 0xb00]
0168ca2b 4969dde87a0000                   imul rbx, r13, 0x7ae8
0168ca32 8bac1ec47a0000                   mov ebp, dword ptr [rsi + rbx + 0x7ac4]
0168ca39 83fd15                           cmp ebp, 0x15
0168ca3c 745e                             je 0x168ca9c
0168ca3e 8bcd                             mov ecx, ebp
0168ca40 e83b1b9fff                       call 0x107e580
0168ca45 8b480c                           mov ecx, dword ptr [rax + 0xc]
0168ca48 f7c1faffffff                     test ecx, 0xfffffffa
0168ca4e 7505                             jne 0x168ca55
0168ca50 83f901                           cmp ecx, 1
0168ca53 7547                             jne 0x168ca9c
0168ca55 8b841ec07a0000                   mov eax, dword ptr [rsi + rbx + 0x7ac0]
0168ca5c 83f801                           cmp eax, 1
0168ca5f 7621                             jbe 0x168ca82
0168ca61 83f804                           cmp eax, 4
0168ca64 7709                             ja 0x168ca6f
0168ca66 4c8d868c710000                   lea r8, [rsi + 0x718c]
0168ca6d eb1a                             jmp 0x168ca89
0168ca6f 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168ca76 4533c0                           xor r8d, r8d
0168ca79 8bd5                             mov edx, ebp
0168ca7b e8501e9fff                       call 0x107e8d0
0168ca80 eb4e                             jmp 0x168cad0
0168ca82 4c8d86b07a0000                   lea r8, [rsi + 0x7ab0]
0168ca89 488b8f00820000                   mov rcx, qword ptr [rdi + 0x8200]
0168ca90 4c03c3                           add r8, rbx
0168ca93 8bd5                             mov edx, ebp
0168ca95 e8361e9fff                       call 0x107e8d0
0168ca9a eb34                             jmp 0x168cad0
0168ca9c 8b841ec07a0000                   mov eax, dword ptr [rsi + rbx + 0x7ac0]
0168caa3 83f801                           cmp eax, 1
0168caa6 7613                             jbe 0x168cabb
0168caa8 83f804                           cmp eax, 4
0168caab 7709                             ja 0x168cab6
0168caad 4c8d8e8c710000                   lea r9, [rsi + 0x718c]
0168cab4 eb0c                             jmp 0x168cac2
0168cab6 4533c9                           xor r9d, r9d
0168cab9 eb0a                             jmp 0x168cac5
0168cabb 4c8d8eb07a0000                   lea r9, [rsi + 0x7ab0]
0168cac2 4c03cb                           add r9, rbx
0168cac5 448bc5                           mov r8d, ebp
0168cac8 488bcf                           mov rcx, rdi
0168cacb e870f5ffff                       call 0x168c040
0168cad0 83fd0c                           cmp ebp, 0xc
0168cad3 7546                             jne 0x168cb1b
0168cad5 488b0d84b67a01                   mov rcx, qword ptr [rip + 0x17ab684]
0168cadc 8d5517                           lea edx, [rbp + 0x17]
0168cadf 4c8b8700820000                   mov r8, qword ptr [rdi + 0x8200]
0168cae6 4881c188420000                   add rcx, 0x4288
0168caed e83eedccff                       call 0x135b830
0168caf2 803dc5e37b0100                   cmp byte ptr [rip + 0x17be3c5], 0
0168caf9 7511                             jne 0x168cb0c
0168cafb ba83990d40                       mov edx, 0x400d9983
0168cb00 e8ebefb2ff                       call 0x11bbaf0
0168cb05 c605b2e37b0101                   mov byte ptr [rip + 0x17be3b2], 1
0168cb0c ba85bc3352                       mov edx, 0x5233bc85
0168cb11 e8daefb2ff                       call 0x11bbaf0
0168cb16 e96c030000                       jmp 0x168ce87
0168cb1b 83fd0e                           cmp ebp, 0xe
0168cb1e 757f                             jne 0x168cb9f
0168cb20 4c8b87000b0000                   mov r8, qword ptr [rdi + 0xb00]
0168cb27 428b8403c07a0000                 mov eax, dword ptr [rbx + r8 + 0x7ac0]
0168cb2f 83f801                           cmp eax, 1
0168cb32 7612                             jbe 0x168cb46
0168cb34 83f804                           cmp eax, 4
0168cb37 7709                             ja 0x168cb42
0168cb39 498d808c710000                   lea rax, [r8 + 0x718c]
0168cb40 eb0b                             jmp 0x168cb4d
0168cb42 33c0                             xor eax, eax
0168cb44 eb0a                             jmp 0x168cb50
0168cb46 498d80b07a0000                   lea rax, [r8 + 0x7ab0]
0168cb4d 4803c3                           add rax, rbx
0168cb50 440fb608                         movzx r9d, byte ptr [rax]
0168cb54 33c9                             xor ecx, ecx
0168cb56 8b97e8810000                     mov edx, dword ptr [rdi + 0x81e8]
0168cb5c 44888f690f0100                   mov byte ptr [rdi + 0x10f69], r9b
0168cb63 85d2                             test edx, edx
0168cb65 0f8e1c030000                     jle 0x168ce87
0168cb6b 498d80c47a0000                   lea rax, [r8 + 0x7ac4]
0168cb72 83380d                           cmp dword ptr [rax], 0xd
0168cb75 7411                             je 0x168cb88
0168cb77 ffc1                             inc ecx
0168cb79 4805e87a0000                     add rax, 0x7ae8
0168cb7f 3bca                             cmp ecx, edx
0168cb81 7cef                             jl 0x168cb72
0168cb83 e9ff020000                       jmp 0x168ce87
0168cb88 4584c9                           test r9b, r9b
0168cb8b 8bc1                             mov eax, ecx
0168cb8d 0f94c2                           sete dl
0168cb90 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168cb97 4903c8                           add rcx, r8
0168cb9a e9e3020000                       jmp 0x168ce82
0168cb9f 83fd1c                           cmp ebp, 0x1c
0168cba2 7568                             jne 0x168cc0c
0168cba4 4c8b87000b0000                   mov r8, qword ptr [rdi + 0xb00]
0168cbab 428b8403c07a0000                 mov eax, dword ptr [rbx + r8 + 0x7ac0]
0168cbb3 83f801                           cmp eax, 1
0168cbb6 7612                             jbe 0x168cbca
0168cbb8 83f804                           cmp eax, 4
0168cbbb 7709                             ja 0x168cbc6
0168cbbd 498d808c710000                   lea rax, [r8 + 0x718c]
0168cbc4 eb0b                             jmp 0x168cbd1
0168cbc6 33c0                             xor eax, eax
0168cbc8 eb0a                             jmp 0x168cbd4
0168cbca 498d80b07a0000                   lea rax, [r8 + 0x7ab0]
0168cbd1 4803c3                           add rax, rbx
0168cbd4 440fb608                         movzx r9d, byte ptr [rax]
0168cbd8 33c9                             xor ecx, ecx
0168cbda 8b97e8810000                     mov edx, dword ptr [rdi + 0x81e8]
0168cbe0 44888f700f0100                   mov byte ptr [rdi + 0x10f70], r9b
0168cbe7 85d2                             test edx, edx
0168cbe9 0f8e98020000                     jle 0x168ce87
0168cbef 498d80c47a0000                   lea rax, [r8 + 0x7ac4]
0168cbf6 83381d                           cmp dword ptr [rax], 0x1d
0168cbf9 748d                             je 0x168cb88
0168cbfb ffc1                             inc ecx
0168cbfd 4805e87a0000                     add rax, 0x7ae8
0168cc03 3bca                             cmp ecx, edx
0168cc05 7cef                             jl 0x168cbf6
0168cc07 e97b020000                       jmp 0x168ce87
0168cc0c 83fd13                           cmp ebp, 0x13
0168cc0f 7515                             jne 0x168cc26
0168cc11 488bcf                           mov rcx, rdi
0168cc14 e837d4ffff                       call 0x168a050
0168cc19 488bcf                           mov rcx, rdi
0168cc1c e8cfdcffff                       call 0x168a8f0
0168cc21 e961020000                       jmp 0x168ce87
0168cc26 83fd16                           cmp ebp, 0x16
0168cc29 0f853e010000                     jne 0x168cd6d
0168cc2f 488bcf                           mov rcx, rdi
0168cc32 e8f9ddffff                       call 0x168aa30
0168cc37 488b9700820000                   mov rdx, qword ptr [rdi + 0x8200]
0168cc3e 448bc8                           mov r9d, eax
0168cc41 8b8a8c000000                     mov ecx, dword ptr [rdx + 0x8c]
0168cc47 418d41ff                         lea eax, [r9 - 1]
0168cc4b 3bc1                             cmp eax, ecx
0168cc4d 0f4cc8                           cmovl ecx, eax
0168cc50 898a8c000000                     mov dword ptr [rdx + 0x8c], ecx
0168cc56 4183f940                         cmp r9d, 0x40
0168cc5a 7748                             ja 0x168cca4
0168cc5c 488b87000b0000                   mov rax, qword ptr [rdi + 0xb00]
0168cc63 4805b8900400                     add rax, 0x490b8
0168cc69 44898800330000                   mov dword ptr [rax + 0x3300], r9d
0168cc70 4585c9                           test r9d, r9d
0168cc73 7e2f                             jle 0x168cca4
0168cc75 4c8bc7                           mov r8, rdi
0168cc78 488d8808330000                   lea rcx, [rax + 0x3308]
0168cc7f 4c2bc0                           sub r8, rax
0168cc82 418bd1                           mov edx, r9d
0168cc85 6666660f1f840000000000           nop word ptr [rax + rax]
0168cc90 418b840870ec0000                 mov eax, dword ptr [r8 + rcx + 0xec70]
0168cc98 8901                             mov dword ptr [rcx], eax
0168cc9a 488d4904                         lea rcx, [rcx + 4]
0168cc9e 4883ea01                         sub rdx, 1
0168cca2 75ec                             jne 0x168cc90
0168cca4 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168ccab 4c8b87000b0000                   mov r8, qword ptr [rdi + 0xb00]
0168ccb2 4863908c000000                   movsxd rdx, dword ptr [rax + 0x8c]
0168ccb9 418b80e8cc0400                   mov eax, dword ptr [r8 + 0x4cce8]
0168ccc0 83c0fe                           add eax, -2
0168ccc3 83f802                           cmp eax, 2
0168ccc6 7753                             ja 0x168cd1b
0168ccc8 4981c0b8900400                   add r8, 0x490b8
0168cccf 4180b8f832000000                 cmp byte ptr [r8 + 0x32f8], 0
0168ccd7 742a                             je 0x168cd03
0168ccd9 83fa10                           cmp edx, 0x10
0168ccdc 7325                             jae 0x168cd03
0168ccde 4869ca58010000                   imul rcx, rdx, 0x158
0168cce5 428b8401c00b0000                 mov eax, dword ptr [rcx + r8 + 0xbc0]
0168cced c1e804                           shr eax, 4
0168ccf0 a801                             test al, 1
0168ccf2 750f                             jne 0x168cd03
0168ccf4 ba01000000                       mov edx, 1
0168ccf9 498bc8                           mov rcx, r8
0168ccfc e83f22ffff                       call 0x167ef40
0168cd01 eb18                             jmp 0x168cd1b
0168cd03 413990fc320000                   cmp dword ptr [r8 + 0x32fc], edx
0168cd0a 740f                             je 0x168cd1b
0168cd0c 498bc8                           mov rcx, r8
0168cd0f 418990fc320000                   mov dword ptr [r8 + 0x32fc], edx
0168cd16 e8b524ffff                       call 0x167f1d0
0168cd1b 488b8f000b0000                   mov rcx, qword ptr [rdi + 0xb00]
0168cd22 8b81e8cc0400                     mov eax, dword ptr [rcx + 0x4cce8]
0168cd28 83f801                           cmp eax, 1
0168cd2b 7613                             jbe 0x168cd40
0168cd2d 83f804                           cmp eax, 4
0168cd30 771a                             ja 0x168cd4c
0168cd32 4881c1b8900400                   add rcx, 0x490b8
0168cd39 e89224ffff                       call 0x167f1d0
0168cd3e eb0c                             jmp 0x168cd4c
0168cd40 4881c120c40400                   add rcx, 0x4c420
0168cd47 e88408ffff                       call 0x167d5d0
0168cd4c 4c8b8f00820000                   mov r9, qword ptr [rdi + 0x8200]
0168cd53 41b815000000                     mov r8d, 0x15
0168cd59 4981c18c000000                   add r9, 0x8c
0168cd60 488bcf                           mov rcx, rdi
0168cd63 e8d8f2ffff                       call 0x168c040
0168cd68 e91a010000                       jmp 0x168ce87
0168cd6d 83fd17                           cmp ebp, 0x17
0168cd70 0f8511010000                     jne 0x168ce87
0168cd76 8b97e8810000                     mov edx, dword ptr [rdi + 0x81e8]
0168cd7c 33db                             xor ebx, ebx
0168cd7e 33c9                             xor ecx, ecx
0168cd80 85d2                             test edx, edx
0168cd82 0f8eff000000                     jle 0x168ce87
0168cd88 4c8b87000b0000                   mov r8, qword ptr [rdi + 0xb00]
0168cd8f 498d80c47a0000                   lea rax, [r8 + 0x7ac4]
0168cd96 833815                           cmp dword ptr [rax], 0x15
0168cd99 7414                             je 0x168cdaf
0168cd9b ffc3                             inc ebx
0168cd9d 48ffc1                           inc rcx
0168cda0 4805e87a0000                     add rax, 0x7ae8
0168cda6 3bda                             cmp ebx, edx
0168cda8 7cec                             jl 0x168cd96
0168cdaa e9d8000000                       jmp 0x168ce87
0168cdaf 488b8700820000                   mov rax, qword ptr [rdi + 0x8200]
0168cdb6 4869c9e87a0000                   imul rcx, rcx, 0x7ae8
0168cdbd 4903c8                           add rcx, r8
0168cdc0 83b89000000001                   cmp dword ptr [rax + 0x90], 1
0168cdc7 773e                             ja 0x168ce07
0168cdc9 41b807000000                     mov r8d, 7
0168cdcf 442b4068                         sub r8d, dword ptr [rax + 0x68]
0168cdd3 8b81c07a0000                     mov eax, dword ptr [rcx + 0x7ac0]
0168cdd9 83c0fe                           add eax, -2
0168cddc 83f802                           cmp eax, 2
0168cddf 0f8783000000                     ja 0x168ce68
0168cde5 4881c1903e0000                   add rcx, 0x3e90
0168cdec 80b9f832000000                   cmp byte ptr [rcx + 0x32f8], 0
0168cdf3 745e                             je 0x168ce53
0168cdf5 4183f810                         cmp r8d, 0x10
0168cdf9 7358                             jae 0x168ce53
0168cdfb 4963c0                           movsxd rax, r8d
0168cdfe 4869d058010000                   imul rdx, rax, 0x158
0168ce05 eb32                             jmp 0x168ce39
0168ce07 4c63808c000000                   movsxd r8, dword ptr [rax + 0x8c]
0168ce0e 8b81c07a0000                     mov eax, dword ptr [rcx + 0x7ac0]
0168ce14 83c0fe                           add eax, -2
0168ce17 83f802                           cmp eax, 2
0168ce1a 774c                             ja 0x168ce68
0168ce1c 4881c1903e0000                   add rcx, 0x3e90
0168ce23 80b9f832000000                   cmp byte ptr [rcx + 0x32f8], 0
0168ce2a 7427                             je 0x168ce53
0168ce2c 4183f810                         cmp r8d, 0x10
0168ce30 7321                             jae 0x168ce53
0168ce32 4969d058010000                   imul rdx, r8, 0x158
0168ce39 8b840ac00b0000                   mov eax, dword ptr [rdx + rcx + 0xbc0]
0168ce40 c1e804                           shr eax, 4
0168ce43 a801                             test al, 1
0168ce45 750c                             jne 0x168ce53
0168ce47 ba01000000                       mov edx, 1
0168ce4c e8ef20ffff                       call 0x167ef40
0168ce51 eb15                             jmp 0x168ce68
0168ce53 443981fc320000                   cmp dword ptr [rcx + 0x32fc], r8d
0168ce5a 740c                             je 0x168ce68
0168ce5c 448981fc320000                   mov dword ptr [rcx + 0x32fc], r8d
0168ce63 e86823ffff                       call 0x167f1d0
0168ce68 83bf740f010000                   cmp dword ptr [rdi + 0x10f74], 0
0168ce6f 8bc3                             mov eax, ebx
0168ce71 0f97c2                           seta dl
0168ce74 4869c8e87a0000                   imul rcx, rax, 0x7ae8
0168ce7b 48038f000b0000                   add rcx, qword ptr [rdi + 0xb00]
0168ce82 e82944ffff                       call 0x16812b0
0168ce87 488b9700820000                   mov rdx, qword ptr [rdi + 0x8200]
0168ce8e 4c8d87b4830000                   lea r8, [rdi + 0x83b4]
0168ce95 498bc8                           mov rcx, r8
0168ce98 e863149fff                       call 0x107e300
0168ce9d 0fb6d8                           movzx ebx, al
0168cea0 4d8bcf                           mov r9, r15
0168cea3 488d8980000000                   lea rcx, [rcx + 0x80]
0168ceaa 0f1002                           movups xmm0, xmmword ptr [rdx]
0168cead 488d9280000000                   lea rdx, [rdx + 0x80]
0168ceb4 0f114180                         movups xmmword ptr [rcx - 0x80], xmm0
0168ceb8 0f104a90                         movups xmm1, xmmword ptr [rdx - 0x70]
0168cebc 0f114990                         movups xmmword ptr [rcx - 0x70], xmm1
0168cec0 0f1042a0                         movups xmm0, xmmword ptr [rdx - 0x60]
0168cec4 0f1141a0                         movups xmmword ptr [rcx - 0x60], xmm0
0168cec8 0f104ab0                         movups xmm1, xmmword ptr [rdx - 0x50]
0168cecc 0f1149b0                         movups xmmword ptr [rcx - 0x50], xmm1
0168ced0 0f1042c0                         movups xmm0, xmmword ptr [rdx - 0x40]
0168ced4 0f1141c0                         movups xmmword ptr [rcx - 0x40], xmm0
0168ced8 0f104ad0                         movups xmm1, xmmword ptr [rdx - 0x30]
0168cedc 0f1149d0                         movups xmmword ptr [rcx - 0x30], xmm1
0168cee0 0f1042e0                         movups xmm0, xmmword ptr [rdx - 0x20]
0168cee4 0f1141e0                         movups xmmword ptr [rcx - 0x20], xmm0
0168cee8 0f104af0                         movups xmm1, xmmword ptr [rdx - 0x10]
0168ceec 0f1149f0                         movups xmmword ptr [rcx - 0x10], xmm1
0168cef0 4983e901                         sub r9, 1
0168cef4 75ad                             jne 0x168cea3
0168cef6 0f1002                           movups xmm0, xmmword ptr [rdx]
0168cef9 0f1101                           movups xmmword ptr [rcx], xmm0
0168cefc 8b4210                           mov eax, dword ptr [rdx + 0x10]
0168ceff 894110                           mov dword ptr [rcx + 0x10], eax
0168cf02 488d054f1a9e00                   lea rax, [rip + 0x9e1a4f]
0168cf09 488d0d641a9e00                   lea rcx, [rip + 0x9e1a64]
0168cf10 3b28                             cmp ebp, dword ptr [rax]
0168cf12 0f8481000000                     je 0x168cf99
0168cf18 4883c004                         add rax, 4
0168cf1c 483bc1                           cmp rax, rcx
0168cf1f 7cef                             jl 0x168cf10
0168cf21 488d8f20820000                   lea rcx, [rdi + 0x8220]
0168cf28 498bc7                           mov rax, r15
0168cf2b 0f1f440000                       nop dword ptr [rax + rax]
0168cf30 488d8980000000                   lea rcx, [rcx + 0x80]
0168cf37 410f1000                         movups xmm0, xmmword ptr [r8]
0168cf3b 410f104810                       movups xmm1, xmmword ptr [r8 + 0x10]
0168cf40 4d8d8080000000                   lea r8, [r8 + 0x80]
0168cf47 0f114180                         movups xmmword ptr [rcx - 0x80], xmm0
0168cf4b 410f1040a0                       movups xmm0, xmmword ptr [r8 - 0x60]
0168cf50 0f114990                         movups xmmword ptr [rcx - 0x70], xmm1
0168cf54 410f1048b0                       movups xmm1, xmmword ptr [r8 - 0x50]
0168cf59 0f1141a0                         movups xmmword ptr [rcx - 0x60], xmm0
0168cf5d 410f1040c0                       movups xmm0, xmmword ptr [r8 - 0x40]
0168cf62 0f1149b0                         movups xmmword ptr [rcx - 0x50], xmm1
0168cf66 410f1048d0                       movups xmm1, xmmword ptr [r8 - 0x30]
0168cf6b 0f1141c0                         movups xmmword ptr [rcx - 0x40], xmm0
0168cf6f 410f1040e0                       movups xmm0, xmmword ptr [r8 - 0x20]
0168cf74 0f1149d0                         movups xmmword ptr [rcx - 0x30], xmm1
0168cf78 410f1048f0                       movups xmm1, xmmword ptr [r8 - 0x10]
0168cf7d 0f1141e0                         movups xmmword ptr [rcx - 0x20], xmm0
0168cf81 0f1149f0                         movups xmmword ptr [rcx - 0x10], xmm1
0168cf85 4883e801                         sub rax, 1
0168cf89 75a5                             jne 0x168cf30
0168cf8b 410f1000                         movups xmm0, xmmword ptr [r8]
0168cf8f 418b4010                         mov eax, dword ptr [r8 + 0x10]
0168cf93 0f1101                           movups xmmword ptr [rcx], xmm0
0168cf96 894110                           mov dword ptr [rcx + 0x10], eax
0168cf99 488b742468                       mov rsi, qword ptr [rsp + 0x68]
0168cf9e 41b601                           mov r14b, 1
0168cfa1 488b6c2470                       mov rbp, qword ptr [rsp + 0x70]
0168cfa6 41ffc4                           inc r12d
0168cfa9 49ffc5                           inc r13
0168cfac 443ba7e8810000                   cmp r12d, dword ptr [rdi + 0x81e8]
0168cfb3 0f8c47faffff                     jl 0x168ca00
0168cfb9 4c8b6c2420                       mov r13, qword ptr [rsp + 0x20]
0168cfbe 84db                             test bl, bl
0168cfc0 7412                             je 0x168cfd4
0168cfc2 488bcf                           mov rcx, rdi
0168cfc5 e8c6c6ffff                       call 0x1689690
0168cfca 33d2                             xor edx, edx
0168cfcc 488bcf                           mov rcx, rdi
0168cfcf e83cc7ffff                       call 0x1689710
0168cfd4 4c8b642478                       mov r12, qword ptr [rsp + 0x78]
0168cfd9 410fb6c6                         movzx eax, r14b
0168cfdd 4883c428                         add rsp, 0x28
0168cfe1 415f                             pop r15
0168cfe3 415e                             pop r14
0168cfe5 5f                               pop rdi
0168cfe6 5e                               pop rsi
0168cfe7 5d                               pop rbp
0168cfe8 5b                               pop rbx
0168cfe9 c3                               ret 
0168cfea 4881c1080b0000                   add rcx, 0xb08
0168cff1 83bfac56000001                   cmp dword ptr [rdi + 0x56ac], 1
0168cff8 7705                             ja 0x168cfff
0168cffa e80139f9ff                       call 0x1620900
0168cfff b0                               .byte 0xb0
