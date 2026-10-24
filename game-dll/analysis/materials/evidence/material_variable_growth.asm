009eadc0  48895c2408                       mov      qword ptr [rsp + 8], rbx
009eadc5  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
009eadca  4889742418                       mov      qword ptr [rsp + 0x18], rsi
009eadcf  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
009eadd4  4154                             push     r12
009eadd6  4156                             push     r14
009eadd8  4157                             push     r15
009eadda  4883ec20                         sub      rsp, 0x20
009eadde  f20f1005d2bd8501                 movsd    xmm0, qword ptr [rip + 0x185bdd2]
009eade6  488bd9                           mov      rbx, rcx
009eade9  448b21                           mov      r12d, dword ptr [rcx]
009eadec  e833db5901                       call     0x1f88924
009eadf1  0f57c9                           xorps    xmm1, xmm1
009eadf4  488d15bdcc6e01                   lea      rdx, [rip + 0x16eccbd]
009eadfb  f2490f2acc                       cvtsi2sd xmm1, r12
009eae00  f20f58c1                         addsd    xmm0, xmm1
009eae04  f2480f2cc0                       cvttsd2si rax, xmm0
009eae09  448bc0                           mov      r8d, eax
009eae0c  8903                             mov      dword ptr [rbx], eax
009eae0e  e8ad1d4800                       call     0xe6cbc0
009eae13  488b055e672f02                   mov      rax, qword ptr [rip + 0x22f675e]
009eae1a  4e8d34e500000000                 lea      r14, [r12*8]
009eae22  8b3b                             mov      edi, dword ptr [rbx]
009eae24  41b808000000                     mov      r8d, 8
009eae2a  488b0d07672f02                   mov      rcx, qword ptr [rip + 0x22f6707]
009eae31  458bfc                           mov      r15d, r12d
009eae34  488b7330                         mov      rsi, qword ptr [rbx + 0x30]
009eae38  4c8b4858                         mov      r9, qword ptr [rax + 0x58]
009eae3c  48c1e703                         shl      rdi, 3
009eae40  488bd7                           mov      rdx, rdi
009eae43  41ffd1                           call     r9
009eae46  488bd6                           mov      rdx, rsi
009eae49  48894330                         mov      qword ptr [rbx + 0x30], rax
009eae4d  488bc8                           mov      rcx, rax
009eae50  443923                           cmp      dword ptr [rbx], r12d
009eae53  761e                             jbe      0x9eae73
009eae55  4d8bc6                           mov      r8, r14
009eae58  e8e3505301                       call     0x1f1ff40
009eae5d  488b4b30                         mov      rcx, qword ptr [rbx + 0x30]
009eae61  492bfe                           sub      rdi, r14
009eae64  4903ce                           add      rcx, r14
009eae67  4c8bc7                           mov      r8, rdi
009eae6a  33d2                             xor      edx, edx
009eae6c  e89f825201                       call     0x1f13110
009eae71  eb08                             jmp      0x9eae7b
009eae73  4c8bc7                           mov      r8, rdi
009eae76  e8c5505301                       call     0x1f1ff40
009eae7b  488b05f6662f02                   mov      rax, qword ptr [rip + 0x22f66f6]
009eae82  488bd6                           mov      rdx, rsi
009eae85  488b0dac662f02                   mov      rcx, qword ptr [rip + 0x22f66ac]
009eae8c  ff5060                           call     qword ptr [rax + 0x60]
009eae8f  8b03                             mov      eax, dword ptr [rbx]
009eae91  41b804000000                     mov      r8d, 4
009eae97  488b0d9a662f02                   mov      rcx, qword ptr [rip + 0x22f669a]
009eae9e  488b7338                         mov      rsi, qword ptr [rbx + 0x38]
009eaea2  4869f828090000                   imul     rdi, rax, 0x928
009eaea9  4969ef28090000                   imul     rbp, r15, 0x928
009eaeb0  488b05c1662f02                   mov      rax, qword ptr [rip + 0x22f66c1]
009eaeb7  488bd7                           mov      rdx, rdi
009eaeba  4c8b4858                         mov      r9, qword ptr [rax + 0x58]
009eaebe  41ffd1                           call     r9
009eaec1  488bd6                           mov      rdx, rsi
009eaec4  48894338                         mov      qword ptr [rbx + 0x38], rax
009eaec8  488bc8                           mov      rcx, rax
009eaecb  443923                           cmp      dword ptr [rbx], r12d
009eaece  7622                             jbe      0x9eaef2
009eaed0  4c8bc5                           mov      r8, rbp
009eaed3  e868505301                       call     0x1f1ff40
009eaed8  4969cf28090000                   imul     rcx, r15, 0x928
009eaedf  482bfd                           sub      rdi, rbp
009eaee2  33d2                             xor      edx, edx
009eaee4  48034b38                         add      rcx, qword ptr [rbx + 0x38]
009eaee8  4c8bc7                           mov      r8, rdi
009eaeeb  e820825201                       call     0x1f13110
009eaef0  eb08                             jmp      0x9eaefa
009eaef2  4c8bc7                           mov      r8, rdi
009eaef5  e846505301                       call     0x1f1ff40
009eaefa  48                               .byte    0x48
009eaefb  8b                               .byte    0x8b
009eaefc  05                               .byte    0x05
009eaefd  7766                             ja       0x9eaf65
009eaeff  2f                               .byte    0x2f
