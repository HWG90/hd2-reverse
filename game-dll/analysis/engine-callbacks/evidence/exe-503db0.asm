00503db0 48895c2410                       mov      qword ptr [rsp + 0x10], rbx
00503db5 4889742418                       mov      qword ptr [rsp + 0x18], rsi
00503dba 4156                             push     r14
00503dbc 4883ec30                         sub      rsp, 0x30
00503dc0 488b4108                         mov      rax, qword ptr [rcx + 8]
00503dc4 4d8bf0                           mov      r14, r8
00503dc7 8bda                             mov      ebx, edx
00503dc9 488bf1                           mov      rsi, rcx
00503dcc 4885c0                           test     rax, rax
00503dcf 0f8494000000                     je       0x140503e69
00503dd5 817904ffffff00                   cmp      dword ptr [rcx + 4], 0xffffff
00503ddc 0f8487000000                     je       0x140503e69
00503de2 488b00                           mov      rax, qword ptr [rax]
00503de5 488d542420                       lea      rdx, [rsp + 0x20]
00503dea 41b908000000                     mov      r9d, 8
00503df0 48897c2440                       mov      qword ptr [rsp + 0x40], rdi
00503df5 488bb898000000                   mov      rdi, qword ptr [rax + 0x98]
00503dfc 458d411c                         lea      r8d, [r9 + 0x1c]
00503e00 488b0f                           mov      rcx, qword ptr [rdi]
00503e03 488b01                           mov      rax, qword ptr [rcx]
00503e06 ff5030                           call     qword ptr [rax + 0x30]
00503e09 488b10                           mov      rdx, qword ptr [rax]
00503e0c b805000000                       mov      eax, 5
00503e11 6689420c                         mov      word ptr [rdx + 0xc], ax
00503e15 488d4a10                         lea      rcx, [rdx + 0x10]
00503e19 c7420824000000                   mov      dword ptr [rdx + 8], 0x24
00503e20 488d4103                         lea      rax, [rcx + 3]
00503e24 48c1e802                         shr      rax, 2
00503e28 48c70200000000                   mov      qword ptr [rdx], 0
00503e2f 6683c004                         add      ax, 4
00503e33 66c1e002                         shl      ax, 2
00503e37 662bc1                           sub      ax, cx
00503e3a 0fb7c8                           movzx    ecx, ax
00503e3d 488bc2                           mov      rax, rdx
00503e40 66894a0e                         mov      word ptr [rdx + 0xe], cx
00503e44 4803ca                           add      rcx, rdx
00503e47 48874708                         xchg     qword ptr [rdi + 8], rax
00503e4b 488b7c2440                       mov      rdi, qword ptr [rsp + 0x40]
00503e50 488910                           mov      qword ptr [rax], rdx
00503e53 c70107000000                     mov      dword ptr [rcx], 7
00503e59 8b4604                           mov      eax, dword ptr [rsi + 4]
00503e5c 894104                           mov      dword ptr [rcx + 4], eax
00503e5f 895908                           mov      dword ptr [rcx + 8], ebx
00503e62 498b06                           mov      rax, qword ptr [r14]
00503e65 4889410c                         mov      qword ptr [rcx + 0xc], rax
00503e69 488b5c2448                       mov      rbx, qword ptr [rsp + 0x48]
00503e6e 488b742450                       mov      rsi, qword ptr [rsp + 0x50]
00503e73 4883c430                         add      rsp, 0x30
00503e77 415e                             pop      r14
00503e79 c3                               ret      
