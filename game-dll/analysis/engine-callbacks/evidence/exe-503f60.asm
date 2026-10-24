00503f60 48895c2410                       mov      qword ptr [rsp + 0x10], rbx
00503f65 48896c2418                       mov      qword ptr [rsp + 0x18], rbp
00503f6a 56                               push     rsi
00503f6b 4883ec30                         sub      rsp, 0x30
00503f6f 488b4108                         mov      rax, qword ptr [rcx + 8]
00503f73 498be8                           mov      rbp, r8
00503f76 8bda                             mov      ebx, edx
00503f78 488bf1                           mov      rsi, rcx
00503f7b 4885c0                           test     rax, rax
00503f7e 0f8494000000                     je       0x140504018
00503f84 817904ffffff00                   cmp      dword ptr [rcx + 4], 0xffffff
00503f8b 0f8487000000                     je       0x140504018
00503f91 488b00                           mov      rax, qword ptr [rax]
00503f94 488d542420                       lea      rdx, [rsp + 0x20]
00503f99 41b908000000                     mov      r9d, 8
00503f9f 48897c2440                       mov      qword ptr [rsp + 0x40], rdi
00503fa4 488bb898000000                   mov      rdi, qword ptr [rax + 0x98]
00503fab 458d4124                         lea      r8d, [r9 + 0x24]
00503faf 488b0f                           mov      rcx, qword ptr [rdi]
00503fb2 488b01                           mov      rax, qword ptr [rcx]
00503fb5 ff5030                           call     qword ptr [rax + 0x30]
00503fb8 41b807000000                     mov      r8d, 7
00503fbe 488b10                           mov      rdx, qword ptr [rax]
00503fc1 c742082c000000                   mov      dword ptr [rdx + 8], 0x2c
00503fc8 488d4a10                         lea      rcx, [rdx + 0x10]
00503fcc 664489420c                       mov      word ptr [rdx + 0xc], r8w
00503fd1 488d4103                         lea      rax, [rcx + 3]
00503fd5 48c70200000000                   mov      qword ptr [rdx], 0
00503fdc 48c1e802                         shr      rax, 2
00503fe0 6683c004                         add      ax, 4
00503fe4 66c1e002                         shl      ax, 2
00503fe8 662bc1                           sub      ax, cx
00503feb 0fb7c8                           movzx    ecx, ax
00503fee 488bc2                           mov      rax, rdx
00503ff1 66894a0e                         mov      word ptr [rdx + 0xe], cx
00503ff5 4803ca                           add      rcx, rdx
00503ff8 48874708                         xchg     qword ptr [rdi + 8], rax
00503ffc 488b7c2440                       mov      rdi, qword ptr [rsp + 0x40]
00504001 488910                           mov      qword ptr [rax], rdx
00504004 448901                           mov      dword ptr [rcx], r8d
00504007 8b4604                           mov      eax, dword ptr [rsi + 4]
0050400a 894104                           mov      dword ptr [rcx + 4], eax
0050400d 895908                           mov      dword ptr [rcx + 8], ebx
00504010 0f104500                         movups   xmm0, xmmword ptr [rbp]
00504014 0f11410c                         movups   xmmword ptr [rcx + 0xc], xmm0
00504018 488b5c2448                       mov      rbx, qword ptr [rsp + 0x48]
0050401d 488b6c2450                       mov      rbp, qword ptr [rsp + 0x50]
00504022 4883c430                         add      rsp, 0x30
00504026 5e                               pop      rsi
00504027 c3                               ret      
