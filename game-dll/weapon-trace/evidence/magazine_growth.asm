0077b0e0  48895c2408                       mov      qword ptr [rsp + 8], rbx
0077b0e5  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
0077b0ea  4889742418                       mov      qword ptr [rsp + 0x18], rsi
0077b0ef  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
0077b0f4  4154                             push     r12
0077b0f6  4156                             push     r14
0077b0f8  4157                             push     r15
0077b0fa  4883ec20                         sub      rsp, 0x20
0077b0fe  f20f1005f2baac01                 movsd    xmm0, qword ptr [rip + 0x1acbaf2]
0077b106  488bf9                           mov      rdi, rcx
0077b109  448b21                           mov      r12d, dword ptr [rcx]
0077b10c  e813d88001                       call     0x1f88924
0077b111  0f57c9                           xorps    xmm1, xmm1
0077b114  488d15ed8e9501                   lea      rdx, [rip + 0x1958eed]
0077b11b  f2490f2acc                       cvtsi2sd xmm1, r12
0077b120  f20f58c1                         addsd    xmm0, xmm1
0077b124  f2480f2cc0                       cvttsd2si rax, xmm0
0077b129  448bc0                           mov      r8d, eax
0077b12c  8907                             mov      dword ptr [rdi], eax
0077b12e  e88d1a6f00                       call     0xe6cbc0
0077b133  488b053e645602                   mov      rax, qword ptr [rip + 0x256643e]
0077b13a  4e8d34e500000000                 lea      r14, [r12*8]
0077b142  8b1f                             mov      ebx, dword ptr [rdi]
0077b144  41b808000000                     mov      r8d, 8
0077b14a  488b0de7635602                   mov      rcx, qword ptr [rip + 0x25663e7]
0077b151  488b6f38                         mov      rbp, qword ptr [rdi + 0x38]
0077b155  4c8b4858                         mov      r9, qword ptr [rax + 0x58]
0077b159  48c1e303                         shl      rbx, 3
0077b15d  488bd3                           mov      rdx, rbx
