00787cd0  48895c2408                       mov      qword ptr [rsp + 8], rbx
00787cd5  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
00787cda  4889742418                       mov      qword ptr [rsp + 0x18], rsi
00787cdf  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
00787ce4  4154                             push     r12
00787ce6  4156                             push     r14
00787ce8  4157                             push     r15
00787cea  4883ec20                         sub      rsp, 0x20
00787cee  f20f1005daedab01                 movsd    xmm0, qword ptr [rip + 0x1abedda]
00787cf6  488bf9                           mov      rdi, rcx
00787cf9  448b6108                         mov      r12d, dword ptr [rcx + 8]
00787cfd  e8220c8001                       call     0x1f88924
00787d02  0f57c9                           xorps    xmm1, xmm1
00787d05  488d15f4c39401                   lea      rdx, [rip + 0x194c3f4]
00787d0c  f2490f2acc                       cvtsi2sd xmm1, r12
00787d11  f20f58c1                         addsd    xmm0, xmm1
00787d15  f2480f2cc0                       cvttsd2si rax, xmm0
00787d1a  448bc0                           mov      r8d, eax
00787d1d  894708                           mov      dword ptr [rdi + 8], eax
00787d20  e89b4e6e00                       call     0xe6cbc0
00787d25  488b054c985502                   mov      rax, qword ptr [rip + 0x255984c]
00787d2c  4e8d34e500000000                 lea      r14, [r12*8]
00787d34  8b5f08                           mov      ebx, dword ptr [rdi + 8]
00787d37  41b808000000                     mov      r8d, 8
00787d3d  488b0df4975502                   mov      rcx, qword ptr [rip + 0x25597f4]
00787d44  488b6f40                         mov      rbp, qword ptr [rdi + 0x40]
00787d48  4c8b4858                         mov      r9, qword ptr [rax + 0x58]
00787d4c  48c1e303                         shl      rbx, 3
00787d50  488bd3                           mov      rdx, rbx
