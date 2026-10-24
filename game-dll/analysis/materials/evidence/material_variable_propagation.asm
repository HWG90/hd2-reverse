009e9660  4053                             push     rbx
009e9662  55                               push     rbp
009e9663  4883ec28                         sub      rsp, 0x28
009e9667  488b4130                         mov      rax, qword ptr [rcx + 0x30]
009e966b  498be8                           mov      rbp, r8
009e966e  8bca                             mov      ecx, edx
009e9670  488b0cc8                         mov      rcx, qword ptr [rax + rcx*8]
009e9674  8b590c                           mov      ebx, dword ptr [rcx + 0xc]
009e9677  448bcb                           mov      r9d, ebx
009e967a  e8e1fcffff                       call     0x9e9360
009e967f  80bdec00000000                   cmp      byte ptr [rbp + 0xec], 0
009e9686  0f84f5000000                     je       0x9e9781
009e968c  488b05357e2f02                   mov      rax, qword ptr [rip + 0x22f7e35]
009e9693  488d542448                       lea      rdx, [rsp + 0x48]
009e9698  4889742440                       mov      qword ptr [rsp + 0x40], rsi
009e969d  48897c2450                       mov      qword ptr [rsp + 0x50], rdi
009e96a2  33ff                             xor      edi, edi
009e96a4  897c2448                         mov      dword ptr [rsp + 0x48], edi
009e96a8  488b4818                         mov      rcx, qword ptr [rax + 0x18]
009e96ac  4c89742458                       mov      qword ptr [rsp + 0x58], r14
009e96b1  4c897c2420                       mov      qword ptr [rsp + 0x20], r15
009e96b6  488b8168070000                   mov      rax, qword ptr [rcx + 0x768]
009e96bd  8bcb                             mov      ecx, ebx
009e96bf  ffd0                             call     rax
009e96c1  488b0d007e2f02                   mov      rcx, qword ptr [rip + 0x22f7e00]
009e96c8  4c8bf0                           mov      r14, rax
009e96cb  488b5118                         mov      rdx, qword ptr [rcx + 0x18]
009e96cf  8bcb                             mov      ecx, ebx
009e96d1  4c8b8210070000                   mov      r8, qword ptr [rdx + 0x710]
009e96d8  41ffd0                           call     r8
009e96db  488b0de67d2f02                   mov      rcx, qword ptr [rip + 0x22f7de6]
009e96e2  488bf0                           mov      rsi, rax
009e96e5  488b5118                         mov      rdx, qword ptr [rcx + 0x18]
009e96e9  8bcb                             mov      ecx, ebx
009e96eb  4c8b8218070000                   mov      r8, qword ptr [rdx + 0x718]
009e96f2  41ffd0                           call     r8
009e96f5  4c8bf8                           mov      r15, rax
009e96f8  397c2448                         cmp      dword ptr [rsp + 0x48], edi
009e96fc  766f                             jbe      0x9e976d
009e96fe  6690                             nop      
009e9700  498d14be                         lea      rdx, [r14 + rdi*4]
009e9704  418b14be                         mov      edx, dword ptr [r14 + rdi*4]
009e9708  4885f6                           test     rsi, rsi
009e970b  7417                             je       0x9e9724
009e970d  488b0db47d2f02                   mov      rcx, qword ptr [rip + 0x22f7db4]
009e9714  4c8b4150                         mov      r8, qword ptr [rcx + 0x50]
009e9718  488bce                           mov      rcx, rsi
009e971b  4d8b4830                         mov      r9, qword ptr [r8 + 0x30]
009e971f  41ffd1                           call     r9
009e9722  eb16                             jmp      0x9e973a
009e9724  488b059d7d2f02                   mov      rax, qword ptr [rip + 0x22f7d9d]
009e972b  488b8878010000                   mov      rcx, qword ptr [rax + 0x178]
009e9732  488b01                           mov      rax, qword ptr [rcx]
009e9735  498bcf                           mov      rcx, r15
009e9738  ffd0                             call     rax
009e973a  8bd8                             mov      ebx, eax
009e973c  85c0                             test     eax, eax
009e973e  7425                             je       0x9e9765
009e9740  488b05817d2f02                   mov      rax, qword ptr [rip + 0x22f7d81]
009e9747  488b4818                         mov      rcx, qword ptr [rax + 0x18]
009e974b  488b8120070000                   mov      rax, qword ptr [rcx + 0x720]
009e9752  8bcb                             mov      ecx, ebx
009e9754  ffd0                             call     rax
009e9756  84c0                             test     al, al
009e9758  740b                             je       0x9e9765
009e975a  448bcb                           mov      r9d, ebx
009e975d  4c8bc5                           mov      r8, rbp
009e9760  e8fbfbffff                       call     0x9e9360
009e9765  ffc7                             inc      edi
009e9767  3b7c2448                         cmp      edi, dword ptr [rsp + 0x48]
009e976b  7293                             jb       0x9e9700
009e976d  4c8b742458                       mov      r14, qword ptr [rsp + 0x58]
009e9772  488b7c2450                       mov      rdi, qword ptr [rsp + 0x50]
009e9777  488b742440                       mov      rsi, qword ptr [rsp + 0x40]
009e977c  4c8b7c2420                       mov      r15, qword ptr [rsp + 0x20]
