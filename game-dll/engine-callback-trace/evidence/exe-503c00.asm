00503c00 48895c2410                       mov      qword ptr [rsp + 0x10], rbx
00503c05 56                               push     rsi
00503c06 4883ec40                         sub      rsp, 0x40
00503c0a 488b4108                         mov      rax, qword ptr [rcx + 8]
00503c0e 8bda                             mov      ebx, edx
00503c10 0f29742430                       movaps   xmmword ptr [rsp + 0x30], xmm6
00503c15 0f28f2                           movaps   xmm6, xmm2
00503c18 488bf1                           mov      rsi, rcx
00503c1b 4885c0                           test     rax, rax
00503c1e 0f8492000000                     je       0x140503cb6
00503c24 817904ffffff00                   cmp      dword ptr [rcx + 4], 0xffffff
00503c2b 0f8485000000                     je       0x140503cb6
00503c31 488b00                           mov      rax, qword ptr [rax]
00503c34 488d542420                       lea      rdx, [rsp + 0x20]
00503c39 41b908000000                     mov      r9d, 8
00503c3f 48897c2450                       mov      qword ptr [rsp + 0x50], rdi
00503c44 488bb898000000                   mov      rdi, qword ptr [rax + 0x98]
00503c4b 458d4118                         lea      r8d, [r9 + 0x18]
00503c4f 488b0f                           mov      rcx, qword ptr [rdi]
00503c52 488b01                           mov      rax, qword ptr [rcx]
00503c55 ff5030                           call     qword ptr [rax + 0x30]
00503c58 488b10                           mov      rdx, qword ptr [rax]
00503c5b b803000000                       mov      eax, 3
00503c60 6689420c                         mov      word ptr [rdx + 0xc], ax
00503c64 488d4a10                         lea      rcx, [rdx + 0x10]
00503c68 c7420820000000                   mov      dword ptr [rdx + 8], 0x20
00503c6f 488d4103                         lea      rax, [rcx + 3]
00503c73 48c1e802                         shr      rax, 2
00503c77 48c70200000000                   mov      qword ptr [rdx], 0
00503c7e 6683c004                         add      ax, 4
00503c82 66c1e002                         shl      ax, 2
00503c86 662bc1                           sub      ax, cx
00503c89 0fb7c8                           movzx    ecx, ax
00503c8c 488bc2                           mov      rax, rdx
00503c8f 66894a0e                         mov      word ptr [rdx + 0xe], cx
00503c93 4803ca                           add      rcx, rdx
00503c96 48874708                         xchg     qword ptr [rdi + 8], rax
00503c9a 488b7c2450                       mov      rdi, qword ptr [rsp + 0x50]
00503c9f 488910                           mov      qword ptr [rax], rdx
00503ca2 c70107000000                     mov      dword ptr [rcx], 7
00503ca8 8b4604                           mov      eax, dword ptr [rsi + 4]
00503cab f30f11710c                       movss    dword ptr [rcx + 0xc], xmm6
00503cb0 894104                           mov      dword ptr [rcx + 4], eax
00503cb3 895908                           mov      dword ptr [rcx + 8], ebx
00503cb6 488b5c2458                       mov      rbx, qword ptr [rsp + 0x58]
00503cbb 0f28742430                       movaps   xmm6, xmmword ptr [rsp + 0x30]
00503cc0 4883c440                         add      rsp, 0x40
00503cc4 5e                               pop      rsi
00503cc5 c3                               ret      
