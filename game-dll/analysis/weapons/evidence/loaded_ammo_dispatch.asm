0074d810  4883ec28                         sub      rsp, 0x28
0074d814  3b15b6186f02                     cmp      edx, dword ptr [rip + 0x26f18b6]
0074d81a  458bd8                           mov      r11d, r8d
0074d81d  4c8bd1                           mov      r10, rcx
0074d820  7507                             jne      0x74d829
0074d822  b8ffffffff                       mov      eax, 0xffffffff
0074d827  eb6c                             jmp      0x74d895
0074d829  448b4930                         mov      r9d, dword ptr [rcx + 0x30]
0074d82d  48895c2430                       mov      qword ptr [rsp + 0x30], rbx
0074d832  8b5938                           mov      ebx, dword ptr [rcx + 0x38]
0074d835  33c9                             xor      ecx, ecx
0074d837  48896c2438                       mov      qword ptr [rsp + 0x38], rbp
0074d83c  0fafda                           imul     ebx, edx
0074d83f  418d69ff                         lea      ebp, [r9 - 1]
0074d843  4889742440                       mov      qword ptr [rsp + 0x40], rsi
0074d848  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
0074d84d  4585c9                           test     r9d, r9d
0074d850  742a                             je       0x74d87c
0074d852  498b7a28                         mov      rdi, qword ptr [r10 + 0x28]
0074d856  418b7234                         mov      esi, dword ptr [r10 + 0x34]
0074d85a  660f1f440000                     nop      word ptr [rax + rax]
0074d860  8bc5                             mov      eax, ebp
0074d862  448d0419                         lea      r8d, [rcx + rbx]
0074d866  4c23c0                           and      r8, rax
0074d869  428b04c7                         mov      eax, dword ptr [rdi + r8*8]
0074d86d  3bc6                             cmp      eax, esi
0074d86f  7449                             je       0x74d8ba
0074d871  3bc2                             cmp      eax, edx
0074d873  7449                             je       0x74d8be
0074d875  ffc1                             inc      ecx
0074d877  413bc9                           cmp      ecx, r9d
0074d87a  72e4                             jb       0x74d860
0074d87c  b8ffffffff                       mov      eax, 0xffffffff
0074d881  488b742440                       mov      rsi, qword ptr [rsp + 0x40]
0074d886  488b6c2438                       mov      rbp, qword ptr [rsp + 0x38]
0074d88b  488b5c2430                       mov      rbx, qword ptr [rsp + 0x30]
0074d890  488b7c2420                       mov      rdi, qword ptr [rsp + 0x20]
0074d895  8bc8                             mov      ecx, eax
0074d897  498b4250                         mov      rax, qword ptr [r10 + 0x50]
0074d89b  4c8d0489                         lea      r8, [rcx + rcx*4]
0074d89f  428b0cc0                         mov      ecx, dword ptr [rax + r8*8]
0074d8a3  0fbae109                         bt       ecx, 9
0074d8a7  731c                             jae      0x74d8c5
0074d8a9  66410f6ed3                       movd     xmm2, r11d
0074d8ae  0f5bd2                           cvtdq2ps xmm2, xmm2
0074d8b1  4883c428                         add      rsp, 0x28
0074d8b5  e9d6290200                       jmp      0x770290
0074d8ba  3bc2                             cmp      eax, edx
0074d8bc  75be                             jne      0x74d87c
0074d8be  428b44c704                       mov      eax, dword ptr [rdi + r8*8 + 4]
0074d8c3  ebbc                             jmp      0x74d881
0074d8c5  84c9                             test     cl, cl
0074d8c7  790c                             jns      0x74d8d5
0074d8c9  458bc3                           mov      r8d, r11d
0074d8cc  4883c428                         add      rsp, 0x28
0074d8d0  e9ebbf0200                       jmp      0x7798c0
0074d8d5  0fbae108                         bt       ecx, 8
0074d8d9  730c                             jae      0x74d8e7
0074d8db  458bc3                           mov      r8d, r11d
0074d8de  4883c428                         add      rsp, 0x28
0074d8e2  e979850300                       jmp      0x785e60
0074d8e7  4883c428                         add      rsp, 0x28
0074d8eb  c3                               ret      
