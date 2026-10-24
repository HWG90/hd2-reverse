009ebfb0  48895c2408                       mov      qword ptr [rsp + 8], rbx
009ebfb5  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
009ebfba  4889742418                       mov      qword ptr [rsp + 0x18], rsi
009ebfbf  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
009ebfc4  4154                             push     r12
009ebfc6  4156                             push     r14
009ebfc8  4157                             push     r15
009ebfca  4883ec20                         sub      rsp, 0x20
009ebfce  f20f1005aaaa8501                 movsd    xmm0, qword ptr [rip + 0x185aaaa]
009ebfd6  488bf9                           mov      rdi, rcx
009ebfd9  448b21                           mov      r12d, dword ptr [rcx]
009ebfdc  e843c95901                       call     0x1f88924
009ebfe1  0f57c9                           xorps    xmm1, xmm1
009ebfe4  488d1525bb6e01                   lea      rdx, [rip + 0x16ebb25]
009ebfeb  f2490f2acc                       cvtsi2sd xmm1, r12
009ebff0  f20f58c1                         addsd    xmm0, xmm1
009ebff4  f2480f2cc0                       cvttsd2si rax, xmm0
009ebff9  448bc0                           mov      r8d, eax
009ebffc  8907                             mov      dword ptr [rdi], eax
009ebffe  e8                               .byte    0xe8
009ebfff  bd                               .byte    0xbd
