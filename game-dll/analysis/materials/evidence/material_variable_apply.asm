009e9360  4053                             push     rbx
009e9362  57                               push     rdi
009e9363  4156                             push     r14
009e9365  4883ec70                         sub      rsp, 0x70
009e9369  488b05a0bcac01                   mov      rax, qword ptr [rip + 0x1acbca0]
009e9370  4833c4                           xor      rax, rsp
009e9373  4889442460                       mov      qword ptr [rsp + 0x60], rax
009e9378  488b0549812f02                   mov      rax, qword ptr [rip + 0x22f8149]
009e937f  418bd9                           mov      ebx, r9d
009e9382  498bf8                           mov      rdi, r8
009e9385  4533f6                           xor      r14d, r14d
009e9388  488b4818                         mov      rcx, qword ptr [rax + 0x18]
009e938c  488b81a8010000                   mov      rax, qword ptr [rcx + 0x1a8]
009e9393  418bc9                           mov      ecx, r9d
009e9396  ffd0                             call     rax
009e9398  85c0                             test     eax, eax
009e939a  0f84a9020000                     je       0x9e9649
009e93a0  4889ac2490000000                 mov      qword ptr [rsp + 0x90], rbp
009e93a8  4889b42498000000                 mov      qword ptr [rsp + 0x98], rsi
009e93b0  488b0511812f02                   mov      rax, qword ptr [rip + 0x22f8111]
009e93b7  418bd6                           mov      edx, r14d
009e93ba  488b4818                         mov      rcx, qword ptr [rax + 0x18]
009e93be  488b81b8010000                   mov      rax, qword ptr [rcx + 0x1b8]
009e93c5  8bcb                             mov      ecx, ebx
009e93c7  ffd0                             call     rax
009e93c9  8b5704                           mov      edx, dword ptr [rdi + 4]
009e93cc  488be8                           mov      rbp, rax
009e93cf  85d2                             test     edx, edx
009e93d1  0f8413010000                     je       0x9e94ea
009e93d7  488b0dea802f02                   mov      rcx, qword ptr [rip + 0x22f80ea]
009e93de  4c8b81e8000000                   mov      r8, qword ptr [rcx + 0xe8]
009e93e5  488bc8                           mov      rcx, rax
009e93e8  4d8b4810                         mov      r9, qword ptr [r8 + 0x10]
009e93ec  41ffd1                           call     r9
009e93ef  83f8ff                           cmp      eax, -1
009e93f2  0f841f020000                     je       0x9e9617
009e93f8  488b0dc9802f02                   mov      rcx, qword ptr [rip + 0x22f80c9]
009e93ff  488b91e8000000                   mov      rdx, qword ptr [rcx + 0xe8]
009e9406  488bcd                           mov      rcx, rbp
009e9409  4c8b4218                         mov      r8, qword ptr [rdx + 0x18]
009e940d  8bd0                             mov      edx, eax
009e940f  41ffd0                           call     r8
009e9412  8b5708                           mov      edx, dword ptr [rdi + 8]
009e9415  4c8bd0                           mov      r10, rax
009e9418  85d2                             test     edx, edx
009e941a  0f84ad000000                     je       0x9e94cd
009e9420  83ea01                           sub      edx, 1
009e9423  746a                             je       0x9e948f
009e9425  83ea01                           sub      edx, 1
009e9428  7426                             je       0x9e9450
009e942a  83fa01                           cmp      edx, 1
009e942d  0f85e4010000                     jne      0x9e9617
009e9433  488b058e802f02                   mov      rax, qword ptr [rip + 0x22f808e]
009e943a  4c8d470c                         lea      r8, [rdi + 0xc]
009e943e  8b17                             mov      edx, dword ptr [rdi]
009e9440  498bca                           mov      rcx, r10
009e9443  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e9447  41ff5118                         call     qword ptr [r9 + 0x18]
009e944b  e9c7010000                       jmp      0x9e9617
009e9450  f30f10470c                       movss    xmm0, dword ptr [rdi + 0xc]
009e9455  4c8d442440                       lea      r8, [rsp + 0x40]
009e945a  488b0567802f02                   mov      rax, qword ptr [rip + 0x22f8067]
009e9461  498bca                           mov      rcx, r10
009e9464  f30f104f10                       movss    xmm1, dword ptr [rdi + 0x10]
009e9469  8b17                             mov      edx, dword ptr [rdi]
009e946b  f30f11442440                     movss    dword ptr [rsp + 0x40], xmm0
009e9471  f30f104714                       movss    xmm0, dword ptr [rdi + 0x14]
009e9476  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e947a  f30f114c2444                     movss    dword ptr [rsp + 0x44], xmm1
009e9480  f30f11442448                     movss    dword ptr [rsp + 0x48], xmm0
009e9486  41ff5110                         call     qword ptr [r9 + 0x10]
009e948a  e988010000                       jmp      0x9e9617
009e948f  f30f10470c                       movss    xmm0, dword ptr [rdi + 0xc]
009e9494  4c8d442430                       lea      r8, [rsp + 0x30]
009e9499  f30f104f10                       movss    xmm1, dword ptr [rdi + 0x10]
009e949e  498bca                           mov      rcx, r10
009e94a1  8b17                             mov      edx, dword ptr [rdi]
009e94a3  f30f11442420                     movss    dword ptr [rsp + 0x20], xmm0
009e94a9  f30f114c2424                     movss    dword ptr [rsp + 0x24], xmm1
009e94af  488b442420                       mov      rax, qword ptr [rsp + 0x20]
009e94b4  4889442430                       mov      qword ptr [rsp + 0x30], rax
009e94b9  488b0508802f02                   mov      rax, qword ptr [rip + 0x22f8008]
009e94c0  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e94c4  41ff5108                         call     qword ptr [r9 + 8]
009e94c8  e94a010000                       jmp      0x9e9617
009e94cd  488b05f47f2f02                   mov      rax, qword ptr [rip + 0x22f7ff4]
009e94d4  498bca                           mov      rcx, r10
009e94d7  f30f10570c                       movss    xmm2, dword ptr [rdi + 0xc]
009e94dc  8b17                             mov      edx, dword ptr [rdi]
009e94de  4c8b4028                         mov      r8, qword ptr [rax + 0x28]
009e94e2  41ff10                           call     qword ptr [r8]
009e94e5  e92d010000                       jmp      0x9e9617
009e94ea  488b05d77f2f02                   mov      rax, qword ptr [rip + 0x22f7fd7]
009e94f1  33f6                             xor      esi, esi
009e94f3  488b88e8000000                   mov      rcx, qword ptr [rax + 0xe8]
009e94fa  488b4108                         mov      rax, qword ptr [rcx + 8]
009e94fe  488bcd                           mov      rcx, rbp
009e9501  ffd0                             call     rax
009e9503  85c0                             test     eax, eax
009e9505  0f840c010000                     je       0x9e9617
009e950b  0f1f440000                       nop      dword ptr [rax + rax]
009e9510  488b05b17f2f02                   mov      rax, qword ptr [rip + 0x22f7fb1]
009e9517  8bd6                             mov      edx, esi
009e9519  488b88e8000000                   mov      rcx, qword ptr [rax + 0xe8]
009e9520  488b4118                         mov      rax, qword ptr [rcx + 0x18]
009e9524  488bcd                           mov      rcx, rbp
009e9527  ffd0                             call     rax
009e9529  8b5708                           mov      edx, dword ptr [rdi + 8]
009e952c  4c8bd0                           mov      r10, rax
009e952f  85d2                             test     edx, edx
009e9531  0f84a7000000                     je       0x9e95de
009e9537  83ea01                           sub      edx, 1
009e953a  7467                             je       0x9e95a3
009e953c  83ea01                           sub      edx, 1
009e953f  7426                             je       0x9e9567
009e9541  83fa01                           cmp      edx, 1
009e9544  0f85ac000000                     jne      0x9e95f6
009e954a  488b05777f2f02                   mov      rax, qword ptr [rip + 0x22f7f77]
009e9551  4c8d470c                         lea      r8, [rdi + 0xc]
009e9555  8b17                             mov      edx, dword ptr [rdi]
009e9557  498bca                           mov      rcx, r10
009e955a  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e955e  41ff5118                         call     qword ptr [r9 + 0x18]
009e9562  e98f000000                       jmp      0x9e95f6
009e9567  f30f10470c                       movss    xmm0, dword ptr [rdi + 0xc]
009e956c  4c8d442450                       lea      r8, [rsp + 0x50]
009e9571  488b05507f2f02                   mov      rax, qword ptr [rip + 0x22f7f50]
009e9578  498bca                           mov      rcx, r10
009e957b  f30f104f10                       movss    xmm1, dword ptr [rdi + 0x10]
009e9580  8b17                             mov      edx, dword ptr [rdi]
009e9582  f30f11442450                     movss    dword ptr [rsp + 0x50], xmm0
009e9588  f30f104714                       movss    xmm0, dword ptr [rdi + 0x14]
009e958d  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e9591  f30f114c2454                     movss    dword ptr [rsp + 0x54], xmm1
009e9597  f30f11442458                     movss    dword ptr [rsp + 0x58], xmm0
009e959d  41ff5110                         call     qword ptr [r9 + 0x10]
009e95a1  eb53                             jmp      0x9e95f6
009e95a3  f30f10470c                       movss    xmm0, dword ptr [rdi + 0xc]
009e95a8  4c8d442438                       lea      r8, [rsp + 0x38]
009e95ad  f30f104f10                       movss    xmm1, dword ptr [rdi + 0x10]
009e95b2  498bca                           mov      rcx, r10
009e95b5  8b17                             mov      edx, dword ptr [rdi]
009e95b7  f30f11442428                     movss    dword ptr [rsp + 0x28], xmm0
009e95bd  f30f114c242c                     movss    dword ptr [rsp + 0x2c], xmm1
009e95c3  488b442428                       mov      rax, qword ptr [rsp + 0x28]
009e95c8  4889442438                       mov      qword ptr [rsp + 0x38], rax
009e95cd  488b05f47e2f02                   mov      rax, qword ptr [rip + 0x22f7ef4]
009e95d4  4c8b4828                         mov      r9, qword ptr [rax + 0x28]
009e95d8  41ff5108                         call     qword ptr [r9 + 8]
009e95dc  eb18                             jmp      0x9e95f6
009e95de  488b05e37e2f02                   mov      rax, qword ptr [rip + 0x22f7ee3]
009e95e5  498bca                           mov      rcx, r10
009e95e8  f30f10570c                       movss    xmm2, dword ptr [rdi + 0xc]
009e95ed  8b17                             mov      edx, dword ptr [rdi]
009e95ef  4c8b4028                         mov      r8, qword ptr [rax + 0x28]
009e95f3  41ff10                           call     qword ptr [r8]
009e95f6  488b05cb7e2f02                   mov      rax, qword ptr [rip + 0x22f7ecb]
009e95fd  ffc6                             inc      esi
009e95ff  488b88e8000000                   mov      rcx, qword ptr [rax + 0xe8]
009e9606  488b4108                         mov      rax, qword ptr [rcx + 8]
009e960a  488bcd                           mov      rcx, rbp
009e960d  ffd0                             call     rax
009e960f  3bf0                             cmp      esi, eax
009e9611  0f82f9feffff                     jb       0x9e9510
009e9617  488b05aa7e2f02                   mov      rax, qword ptr [rip + 0x22f7eaa]
009e961e  41ffc6                           inc      r14d
009e9621  488b4818                         mov      rcx, qword ptr [rax + 0x18]
009e9625  488b81a8010000                   mov      rax, qword ptr [rcx + 0x1a8]
009e962c  8bcb                             mov      ecx, ebx
009e962e  ffd0                             call     rax
009e9630  443bf0                           cmp      r14d, eax
009e9633  0f8277fdffff                     jb       0x9e93b0
009e9639  488bb42498000000                 mov      rsi, qword ptr [rsp + 0x98]
009e9641  488bac2490000000                 mov      rbp, qword ptr [rsp + 0x90]
009e9649  488b4c2460                       mov      rcx, qword ptr [rsp + 0x60]
009e964e  4833cc                           xor      rcx, rsp
009e9651  e8fa665201                       call     0x1f0fd50
009e9656  4883c470                         add      rsp, 0x70
009e965a  415e                             pop      r14
009e965c  5f                               pop      rdi
009e965d  5b                               pop      rbx
009e965e  c3                               ret      
009e965f  c3                               ret      
