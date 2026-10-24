007796a0  48895c2408                       mov      qword ptr [rsp + 8], rbx
007796a5  48896c2418                       mov      qword ptr [rsp + 0x18], rbp
007796aa  56                               push     rsi
007796ab  57                               push     rdi
007796ac  4154                             push     r12
007796ae  4156                             push     r14
007796b0  4157                             push     r15
007796b2  4883ec20                         sub      rsp, 0x20
007796b6  488b3d3b815602                   mov      rdi, qword ptr [rip + 0x256813b]
007796bd  4533e4                           xor      r12d, r12d
007796c0  3b150a5a6c02                     cmp      edx, dword ptr [rip + 0x26c5a0a]
007796c6  458bf8                           mov      r15d, r8d
007796c9  7445                             je       0x779710
007796cb  448b4f28                         mov      r9d, dword ptr [rdi + 0x28]
007796cf  458bc4                           mov      r8d, r12d
007796d2  448b5f30                         mov      r11d, dword ptr [rdi + 0x30]
007796d6  440fafda                         imul     r11d, edx
007796da  418d69ff                         lea      ebp, [r9 - 1]
007796de  4585c9                           test     r9d, r9d
007796e1  742d                             je       0x779710
007796e3  488b5f20                         mov      rbx, qword ptr [rdi + 0x20]
007796e7  8b772c                           mov      esi, dword ptr [rdi + 0x2c]
007796ea  660f1f440000                     nop      word ptr [rax + rax]
007796f0  8bc5                             mov      eax, ebp
007796f2  438d0c18                         lea      ecx, [r8 + r11]
007796f6  4823c8                           and      rcx, rax
007796f9  8b04cb                           mov      eax, dword ptr [rbx + rcx*8]
007796fc  4c8d14cb                         lea      r10, [rbx + rcx*8]
00779700  3bc6                             cmp      eax, esi
00779702  7443                             je       0x779747
00779704  3bc2                             cmp      eax, edx
00779706  7443                             je       0x77974b
00779708  41ffc0                           inc      r8d
0077970b  453bc1                           cmp      r8d, r9d
0077970e  72e0                             jb       0x7796f0
00779710  b8ffffffff                       mov      eax, 0xffffffff
00779715  8bf0                             mov      esi, eax
00779717  488b4738                         mov      rax, qword ptr [rdi + 0x38]
0077971b  4c8b34f0                         mov      r14, qword ptr [rax + rsi*8]
0077971f  498bce                           mov      rcx, r14
00779722  e87923d8ff                       call     0x4fbaa0
00779727  4885c0                           test     rax, rax
0077972a  0f84a4000000                     je       0x7797d4
00779730  4585ff                           test     r15d, r15d
00779733  7e1c                             jle      0x779751
00779735  488b5750                         mov      rdx, qword ptr [rdi + 0x50]
00779739  488d0476                         lea      rax, [rsi + rsi*2]
0077973d  448b448204                       mov      r8d, dword ptr [rdx + rax*4 + 4]
00779742  4503c7                           add      r8d, r15d
00779745  eb5c                             jmp      0x7797a3
00779747  3bc2                             cmp      eax, edx
00779749  75c5                             jne      0x779710
0077974b  418b4204                         mov      eax, dword ptr [r10 + 4]
0077974f  ebc4                             jmp      0x779715
00779751  418b6e10                         mov      ebp, dword ptr [r14 + 0x10]
00779755  8b8088000000                     mov      eax, dword ptr [rax + 0x88]
0077975b  89442458                         mov      dword ptr [rsp + 0x58], eax
0077975f  81fdff7f0000                     cmp      ebp, 0x7fff
00779765  7423                             je       0x77978a
00779767  488b0d5a7d5602                   mov      rcx, qword ptr [rip + 0x2567d5a]
0077976e  488b4140                         mov      rax, qword ptr [rcx + 0x40]
00779772  488b9860010000                   mov      rbx, qword ptr [rax + 0x160]
00779779  488b4138                         mov      rax, qword ptr [rcx + 0x38]
0077977d  ff5008                           call     qword ptr [rax + 8]
00779780  488bc8                           mov      rcx, rax
00779783  8bd5                             mov      edx, ebp
00779785  ffd3                             call     rbx
00779787  4c8be0                           mov      r12, rax
0077978a  498b16                           mov      rdx, qword ptr [r14]
0077978d  4c8d442458                       lea      r8, [rsp + 0x58]
00779792  498bcc                           mov      rcx, r12
00779795  e856f64000                       call     0xb88df0
0077979a  488b5750                         mov      rdx, qword ptr [rdi + 0x50]
0077979e  448b442458                       mov      r8d, dword ptr [rsp + 0x58]
007797a3  488d0476                         lea      rax, [rsi + rsi*2]
007797a7  488d0c8500000000                 lea      rcx, [rax*4]
007797af  4489441104                       mov      dword ptr [rcx + rdx + 4], r8d
007797b4  ba3ed6a5d7                       mov      edx, 0xd7a5d63e
007797b9  4c8b4750                         mov      r8, qword ptr [rdi + 0x50]
007797bd  488b4738                         mov      rax, qword ptr [rdi + 0x38]
007797c1  4983c004                         add      r8, 4
007797c5  4c03c1                           add      r8, rcx
007797c8  488b0cf0                         mov      rcx, qword ptr [rax + rsi*8]
007797cc  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
007797cf  e8acff6e00                       call     0xe69780
007797d4  488b5c2450                       mov      rbx, qword ptr [rsp + 0x50]
007797d9  488b6c2460                       mov      rbp, qword ptr [rsp + 0x60]
007797de  4883c420                         add      rsp, 0x20
007797e2  415f                             pop      r15
007797e4  415e                             pop      r14
007797e6  415c                             pop      r12
007797e8  5f                               pop      rdi
007797e9  5e                               pop      rsi
007797ea  c3                               ret      
007797eb  488b4f10                         mov      rcx, qword ptr [rdi + 0x10]
007797ef  c3                               ret      
