00783ba0  48895c2408                       mov      qword ptr [rsp + 8], rbx
00783ba5  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
00783baa  4889742418                       mov      qword ptr [rsp + 0x18], rsi
00783baf  57                               push     rdi
00783bb0  4154                             push     r12
00783bb2  4155                             push     r13
00783bb4  4156                             push     r14
00783bb6  4157                             push     r15
00783bb8  4883ec20                         sub      rsp, 0x20
00783bbc  f20f10053430ac01                 movsd    xmm0, qword ptr [rip + 0x1ac3034]
00783bc4  488bf9                           mov      rdi, rcx
00783bc7  448b29                           mov      r13d, dword ptr [rcx]
00783bca  e8554d8001                       call     0x1f88924
00783bcf  0f57c9                           xorps    xmm1, xmm1
00783bd2  488d15d7049501                   lea      rdx, [rip + 0x19504d7]
00783bd9  f2490f2acd                       cvtsi2sd xmm1, r13
00783bde  f20f58c1                         addsd    xmm0, xmm1
00783be2  f2480f2cc0                       cvttsd2si rax, xmm0
00783be7  448bc0                           mov      r8d, eax
00783bea  8907                             mov      dword ptr [rdi], eax
00783bec  e8cf8f6e00                       call     0xe6cbc0
00783bf1  488b0580d95502                   mov      rax, qword ptr [rip + 0x255d980]
00783bf8  4e8d34ed00000000                 lea      r14, [r13*8]
00783c00  8b1f                             mov      ebx, dword ptr [rdi]
00783c02  41b808000000                     mov      r8d, 8
00783c08  488b0d29d95502                   mov      rcx, qword ptr [rip + 0x255d929]
00783c0f  488b6f38                         mov      rbp, qword ptr [rdi + 0x38]
00783c13  4c8b4858                         mov      r9, qword ptr [rax + 0x58]
00783c17  48c1e303                         shl      rbx, 3
00783c1b  488bd3                           mov      rdx, rbx
