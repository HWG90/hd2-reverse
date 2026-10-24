00779f60  48895c2408                       mov      qword ptr [rsp + 8], rbx
00779f65  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
00779f6a  4889742418                       mov      qword ptr [rsp + 0x18], rsi
00779f6f  57                               push     rdi
00779f70  4156                             push     r14
00779f72  4157                             push     r15
00779f74  4883ec20                         sub      rsp, 0x20
00779f78  3b1552516c02                     cmp      edx, dword ptr [rip + 0x26c5152]
00779f7e  458bf9                           mov      r15d, r9d
00779f81  488b1d70785602                   mov      rbx, qword ptr [rip + 0x2567870]
00779f88  7447                             je       0x779fd1
00779f8a  448b5328                         mov      r10d, dword ptr [rbx + 0x28]
00779f8e  33f6                             xor      esi, esi
00779f90  448b5b30                         mov      r11d, dword ptr [rbx + 0x30]
00779f94  448bc6                           mov      r8d, esi
00779f97  440fafda                         imul     r11d, edx
00779f9b  458d72ff                         lea      r14d, [r10 - 1]
00779f9f  4585d2                           test     r10d, r10d
00779fa2  742d                             je       0x779fd1
00779fa4  488b7b20                         mov      rdi, qword ptr [rbx + 0x20]
00779fa8  8b6b2c                           mov      ebp, dword ptr [rbx + 0x2c]
00779fab  0f1f440000                       nop      dword ptr [rax + rax]
00779fb0  418bc6                           mov      eax, r14d
00779fb3  438d0c18                         lea      ecx, [r8 + r11]
00779fb7  4823c8                           and      rcx, rax
00779fba  8b04cf                           mov      eax, dword ptr [rdi + rcx*8]
00779fbd  4c8d0ccf                         lea      r9, [rdi + rcx*8]
00779fc1  3bc5                             cmp      eax, ebp
00779fc3  7427                             je       0x779fec
00779fc5  3bc2                             cmp      eax, edx
00779fc7  7427                             je       0x779ff0
00779fc9  41ffc0                           inc      r8d
00779fcc  453bc2                           cmp      r8d, r10d
00779fcf  72df                             jb       0x779fb0
00779fd1  32c0                             xor      al, al
00779fd3  488b5c2440                       mov      rbx, qword ptr [rsp + 0x40]
00779fd8  488b6c2448                       mov      rbp, qword ptr [rsp + 0x48]
00779fdd  488b742450                       mov      rsi, qword ptr [rsp + 0x50]
00779fe2  4883c420                         add      rsp, 0x20
00779fe6  415f                             pop      r15
00779fe8  415e                             pop      r14
00779fea  5f                               pop      rdi
00779feb  c3                               ret      
00779fec  3bc2                             cmp      eax, edx
00779fee  75e1                             jne      0x779fd1
00779ff0  418b4104                         mov      eax, dword ptr [r9 + 4]
00779ff4  83f8ff                           cmp      eax, -1
00779ff7  74d8                             je       0x779fd1
00779ff9  488b4b38                         mov      rcx, qword ptr [rbx + 0x38]
00779ffd  8bf8                             mov      edi, eax
00779fff  488b0cc1                         mov      rcx, qword ptr [rcx + rax*8]
0077a003  e8981ad8ff                       call     0x4fbaa0
0077a008  8b9098000000                     mov      edx, dword ptr [rax + 0x98]
0077a00e  85d2                             test     edx, edx
0077a010  7506                             jne      0x77a018
0077a012  8b9088000000                     mov      edx, dword ptr [rax + 0x88]
0077a018  440fb6889c000000                 movzx    r9d, byte ptr [rax + 0x9c]
0077a020  4183ffff                         cmp      r15d, -1
0077a024  410f45d7                         cmovne   edx, r15d
0077a028  4584c9                           test     r9b, r9b
0077a02b  743e                             je       0x77a06b
0077a02d  488b4348                         mov      rax, qword ptr [rbx + 0x48]
0077a031  488bcf                           mov      rcx, rdi
0077a034  4803c9                           add      rcx, rcx
0077a037  3974c808                         cmp      dword ptr [rax + rcx*8 + 8], esi
0077a03b  742e                             je       0x77a06b
0077a03d  41b801000000                     mov      r8d, 1
0077a043  4532c9                           xor      r9b, r9b
0077a046  418bf0                           mov      esi, r8d
0077a049  488b4350                         mov      rax, qword ptr [rbx + 0x50]
0077a04d  488d0c7f                         lea      rcx, [rdi + rdi*2]
0077a051  8b448804                         mov      eax, dword ptr [rax + rcx*4 + 4]
0077a055  03c6                             add      eax, esi
0077a057  3bc2                             cmp      eax, edx
0077a059  7c09                             jl       0x77a064
0077a05b  4584c9                           test     r9b, r9b
0077a05e  0f846dffffff                     je       0x779fd1
0077a064  b001                             mov      al, 1
0077a066  e968ffffff                       jmp      0x779fd3
0077a06b  448bc6                           mov      r8d, esi
0077a06e  4584c9                           test     r9b, r9b
0077a071  74d0                             je       0x77a043
0077a073  488b4348                         mov      rax, qword ptr [rbx + 0x48]
0077a077  488bcf                           mov      rcx, rdi
0077a07a  4803c9                           add      rcx, rcx
0077a07d  3974c808                         cmp      dword ptr [rax + rcx*8 + 8], esi
0077a081  75c0                             jne      0x77a043
0077a083  41b101                           mov      r9b, 1
0077a086  ebc1                             jmp      0x77a049
