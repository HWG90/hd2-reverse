00503e80 48895c2410                       mov      qword ptr [rsp + 0x10], rbx
00503e85 48896c2418                       mov      qword ptr [rsp + 0x18], rbp
00503e8a 56                               push     rsi
00503e8b 4883ec30                         sub      rsp, 0x30
00503e8f 488b4108                         mov      rax, qword ptr [rcx + 8]
00503e93 498be8                           mov      rbp, r8
00503e96 8bda                             mov      ebx, edx
00503e98 488bf1                           mov      rsi, rcx
00503e9b 4885c0                           test     rax, rax
00503e9e 0f849d000000                     je       0x140503f41
00503ea4 817904ffffff00                   cmp      dword ptr [rcx + 4], 0xffffff
00503eab 0f8490000000                     je       0x140503f41
00503eb1 488b00                           mov      rax, qword ptr [rax]
00503eb4 488d542420                       lea      rdx, [rsp + 0x20]
00503eb9 41b908000000                     mov      r9d, 8
00503ebf 48897c2440                       mov      qword ptr [rsp + 0x40], rdi
00503ec4 488bb898000000                   mov      rdi, qword ptr [rax + 0x98]
00503ecb 458d4120                         lea      r8d, [r9 + 0x20]
00503ecf 488b0f                           mov      rcx, qword ptr [rdi]
00503ed2 488b01                           mov      rax, qword ptr [rcx]
00503ed5 ff5030                           call     qword ptr [rax + 0x30]
00503ed8 488b10                           mov      rdx, qword ptr [rax]
00503edb b806000000                       mov      eax, 6
00503ee0 6689420c                         mov      word ptr [rdx + 0xc], ax
00503ee4 488d4a10                         lea      rcx, [rdx + 0x10]
00503ee8 c7420828000000                   mov      dword ptr [rdx + 8], 0x28
00503eef 488d4103                         lea      rax, [rcx + 3]
00503ef3 48c70200000000                   mov      qword ptr [rdx], 0
00503efa 48c1e802                         shr      rax, 2
00503efe 6683c004                         add      ax, 4
00503f02 66c1e002                         shl      ax, 2
00503f06 662bc1                           sub      ax, cx
00503f09 0fb7c8                           movzx    ecx, ax
00503f0c 488bc2                           mov      rax, rdx
00503f0f 66894a0e                         mov      word ptr [rdx + 0xe], cx
00503f13 4803ca                           add      rcx, rdx
00503f16 48874708                         xchg     qword ptr [rdi + 8], rax
00503f1a 488b7c2440                       mov      rdi, qword ptr [rsp + 0x40]
00503f1f 488910                           mov      qword ptr [rax], rdx
00503f22 c70107000000                     mov      dword ptr [rcx], 7
00503f28 8b4604                           mov      eax, dword ptr [rsi + 4]
00503f2b 894104                           mov      dword ptr [rcx + 4], eax
00503f2e 895908                           mov      dword ptr [rcx + 8], ebx
00503f31 f20f104500                       movsd    xmm0, qword ptr [rbp]
00503f36 f20f11410c                       movsd    qword ptr [rcx + 0xc], xmm0
00503f3b 8b4508                           mov      eax, dword ptr [rbp + 8]
00503f3e 894114                           mov      dword ptr [rcx + 0x14], eax
00503f41 488b5c2448                       mov      rbx, qword ptr [rsp + 0x48]
00503f46 488b6c2450                       mov      rbp, qword ptr [rsp + 0x50]
00503f4b 4883c430                         add      rsp, 0x30
00503f4f 5e                               pop      rsi
00503f50 c3                               ret      
