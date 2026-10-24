00ec26f0  48895c2410                       mov      qword ptr [rsp + 0x10], rbx
00ec26f5  4889742418                       mov      qword ptr [rsp + 0x18], rsi
00ec26fa  55                               push     rbp
00ec26fb  57                               push     rdi
00ec26fc  4154                             push     r12
00ec26fe  4156                             push     r14
00ec2700  4157                             push     r15
00ec2702  488dac2440ffffff                 lea      rbp, [rsp - 0xc0]
00ec270a  4881ecc0010000                   sub      rsp, 0x1c0
00ec2711  488b05f8285f01                   mov      rax, qword ptr [rip + 0x15f28f8]
00ec2718  4833c4                           xor      rax, rsp
00ec271b  488985b0000000                   mov      qword ptr [rbp + 0xb0], rax
00ec2722  488b059fede101                   mov      rax, qword ptr [rip + 0x1e1ed9f]
00ec2729  488bf1                           mov      rsi, rcx
00ec272c  488d0d25782201                   lea      rcx, [rip + 0x1227825]
00ec2733  488b90c0000000                   mov      rdx, qword ptr [rax + 0xc0]
00ec273a  488b4228                         mov      rax, qword ptr [rdx + 0x28]
00ec273e  ffd0                             call     rax
00ec2740  89442460                         mov      dword ptr [rsp + 0x60], eax
00ec2744  488d0d1d782201                   lea      rcx, [rip + 0x122781d]
00ec274b  488b0576ede101                   mov      rax, qword ptr [rip + 0x1e1ed76]
00ec2752  488b90c0000000                   mov      rdx, qword ptr [rax + 0xc0]
00ec2759  488b4228                         mov      rax, qword ptr [rdx + 0x28]
00ec275d  ffd0                             call     rax
00ec275f  89442464                         mov      dword ptr [rsp + 0x64], eax
00ec2763  488b055eede101                   mov      rax, qword ptr [rip + 0x1e1ed5e]
00ec276a  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2771  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec2775  488d0dc4772201                   lea      rcx, [rip + 0x12277c4]
00ec277c  ffd0                             call     rax
00ec277e  89442468                         mov      dword ptr [rsp + 0x68], eax
00ec2782  488b053fede101                   mov      rax, qword ptr [rip + 0x1e1ed3f]
00ec2789  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2790  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec2794  488d0dad772201                   lea      rcx, [rip + 0x12277ad]
00ec279b  ffd0                             call     rax
00ec279d  8944246c                         mov      dword ptr [rsp + 0x6c], eax
00ec27a1  488b0520ede101                   mov      rax, qword ptr [rip + 0x1e1ed20]
00ec27a8  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec27af  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec27b3  488d0dde772201                   lea      rcx, [rip + 0x12277de]
00ec27ba  ffd0                             call     rax
00ec27bc  89442470                         mov      dword ptr [rsp + 0x70], eax
00ec27c0  488b0501ede101                   mov      rax, qword ptr [rip + 0x1e1ed01]
00ec27c7  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec27ce  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec27d2  488d0dcf772201                   lea      rcx, [rip + 0x12277cf]
00ec27d9  ffd0                             call     rax
00ec27db  89442474                         mov      dword ptr [rsp + 0x74], eax
00ec27df  488b05e2ece101                   mov      rax, qword ptr [rip + 0x1e1ece2]
00ec27e6  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec27ed  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec27f1  488d0d80772201                   lea      rcx, [rip + 0x1227780]
00ec27f8  ffd0                             call     rax
00ec27fa  89442478                         mov      dword ptr [rsp + 0x78], eax
00ec27fe  488b05c3ece101                   mov      rax, qword ptr [rip + 0x1e1ecc3]
00ec2805  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec280c  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec2810  488d0d71772201                   lea      rcx, [rip + 0x1227771]
00ec2817  ffd0                             call     rax
00ec2819  8944247c                         mov      dword ptr [rsp + 0x7c], eax
00ec281d  488b05a4ece101                   mov      rax, qword ptr [rip + 0x1e1eca4]
00ec2824  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec282b  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec282f  488d0db2772201                   lea      rcx, [rip + 0x12277b2]
00ec2836  ffd0                             call     rax
00ec2838  894580                           mov      dword ptr [rbp - 0x80], eax
00ec283b  488b0586ece101                   mov      rax, qword ptr [rip + 0x1e1ec86]
00ec2842  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2849  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec284d  488d0da4772201                   lea      rcx, [rip + 0x12277a4]
00ec2854  ffd0                             call     rax
00ec2856  894584                           mov      dword ptr [rbp - 0x7c], eax
00ec2859  488b0568ece101                   mov      rax, qword ptr [rip + 0x1e1ec68]
00ec2860  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2867  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec286b  488d0d46772201                   lea      rcx, [rip + 0x1227746]
00ec2872  ffd0                             call     rax
00ec2874  894588                           mov      dword ptr [rbp - 0x78], eax
00ec2877  488b054aece101                   mov      rax, qword ptr [rip + 0x1e1ec4a]
00ec287e  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2885  488b4128                         mov      rax, qword ptr [rcx + 0x28]
00ec2889  488d0d38772201                   lea      rcx, [rip + 0x1227738]
00ec2890  ffd0                             call     rax
00ec2892  f30f1086083d0000                 movss    xmm0, dword ptr [rsi + 0x3d08]
00ec289a  f30f108e0c3d0000                 movss    xmm1, dword ptr [rsi + 0x3d0c]
00ec28a2  89458c                           mov      dword ptr [rbp - 0x74], eax
00ec28a5  8b86183d0000                     mov      eax, dword ptr [rsi + 0x3d18]
00ec28ab  f30f114598                       movss    dword ptr [rbp - 0x68], xmm0
00ec28b0  f30f114db0                       movss    dword ptr [rbp - 0x50], xmm1
00ec28b5  c7459002000000                   mov      dword ptr [rbp - 0x70], 2
00ec28bc  c745a802000000                   mov      dword ptr [rbp - 0x58], 2
00ec28c3  c745c002000000                   mov      dword ptr [rbp - 0x40], 2
00ec28ca  f30f108e103d0000                 movss    xmm1, dword ptr [rsi + 0x3d10]
00ec28d2  0f57c0                           xorps    xmm0, xmm0
00ec28d5  f3480f2ac0                       cvtsi2ss xmm0, rax
00ec28da  8b861c3d0000                     mov      eax, dword ptr [rsi + 0x3d1c]
00ec28e0  c745d802000000                   mov      dword ptr [rbp - 0x28], 2
00ec28e7  c745f002000000                   mov      dword ptr [rbp - 0x10], 2
00ec28ee  c7450802000000                   mov      dword ptr [rbp + 8], 2
00ec28f5  f30f114de0                       movss    dword ptr [rbp - 0x20], xmm1
00ec28fa  f30f108e243d0000                 movss    xmm1, dword ptr [rsi + 0x3d24]
00ec2902  f30f1145c8                       movss    dword ptr [rbp - 0x38], xmm0
00ec2907  f30f1086143d0000                 movss    xmm0, dword ptr [rsi + 0x3d14]
00ec290f  f30f1145f8                       movss    dword ptr [rbp - 8], xmm0
00ec2914  0f57c0                           xorps    xmm0, xmm0
00ec2917  f3480f2ac0                       cvtsi2ss xmm0, rax
00ec291c  0fb686203d0000                   movzx    eax, byte ptr [rsi + 0x3d20]
00ec2923  c7452002000000                   mov      dword ptr [rbp + 0x20], 2
00ec292a  c7453802000000                   mov      dword ptr [rbp + 0x38], 2
00ec2931  c7455002000000                   mov      dword ptr [rbp + 0x50], 2
00ec2938  f30f114d40                       movss    dword ptr [rbp + 0x40], xmm1
00ec293d  c7456804000000                   mov      dword ptr [rbp + 0x68], 4
00ec2944  f30f114510                       movss    dword ptr [rbp + 0x10], xmm0
00ec2949  660f6ec0                         movd     xmm0, eax
00ec294d  488d86383d0000                   lea      rax, [rsi + 0x3d38]
00ec2954  48894570                         mov      qword ptr [rbp + 0x70], rax
00ec2958  488d86403d0000                   lea      rax, [rsi + 0x3d40]
00ec295f  48898588000000                   mov      qword ptr [rbp + 0x88], rax
00ec2966  488d86503d0000                   lea      rax, [rsi + 0x3d50]
00ec296d  488985a0000000                   mov      qword ptr [rbp + 0xa0], rax
00ec2974  488b054debe101                   mov      rax, qword ptr [rip + 0x1e1eb4d]
00ec297b  0f5bc0                           cvtdq2ps xmm0, xmm0
00ec297e  c7457802000000                   mov      dword ptr [rbp + 0x78], 2
00ec2985  c7858000000004000000             mov      dword ptr [rbp + 0x80], 4
00ec298f  488b88c0000000                   mov      rcx, qword ptr [rax + 0xc0]
00ec2996  c7859000000002000000             mov      dword ptr [rbp + 0x90], 2
00ec29a0  c7859800000004000000             mov      dword ptr [rbp + 0x98], 4
00ec29aa  f30f114528                       movss    dword ptr [rbp + 0x28], xmm0
00ec29af  488b4108                         mov      rax, qword ptr [rcx + 8]
00ec29b3  b9f8b0fdce                       mov      ecx, 0xcefdb0f8
00ec29b8  f30f1086283d0000                 movss    xmm0, dword ptr [rsi + 0x3d28]
00ec29c0  f30f114558                       movss    dword ptr [rbp + 0x58], xmm0
00ec29c5  c785a800000002000000             mov      dword ptr [rbp + 0xa8], 2
00ec29cf  ffd0                             call     rax
00ec29d1  4c8bf0                           mov      r14, rax
00ec29d4  ff5050                           call     qword ptr [rax + 0x50]
00ec29d7  488bf8                           mov      rdi, rax
00ec29da  41ff5648                         call     qword ptr [r14 + 0x48]
00ec29de  4533c0                           xor      r8d, r8d
00ec29e1  488d0d78762201                   lea      rcx, [rip + 0x1227678]
00ec29e8  4c8be0                           mov      r12, rax
00ec29eb  418d5014                         lea      edx, [r8 + 0x14]
00ec29ef  e80c93c0ff                       call     0xacbd00
00ec29f4  498b5608                         mov      rdx, qword ptr [r14 + 8]
00ec29f8  488bd8                           mov      rbx, rax
00ec29fb  488b8e583d0000                   mov      rcx, qword ptr [rsi + 0x3d58]
00ec2a02  48c1eb20                         shr      rbx, 0x20
00ec2a06  ffd2                             call     rdx
00ec2a08  4c8b17                           mov      r10, qword ptr [rdi]
00ec2a0b  4c8d4c2430                       lea      r9, [rsp + 0x30]
00ec2a10  8b96603d0000                     mov      edx, dword ptr [rsi + 0x3d60]
00ec2a16  448bc3                           mov      r8d, ebx
00ec2a19  488bc8                           mov      rcx, rax
00ec2a1c  c744242001000000                 mov      dword ptr [rsp + 0x20], 1
00ec2a24  4c8bf8                           mov      r15, rax
00ec2a27  41ffd2                           call     r10
00ec2a2a  85c0                             test     eax, eax
00ec2a2c  7466                             je       0xec2a94
00ec2a2e  4d8b4e28                         mov      r9, qword ptr [r14 + 0x28]
00ec2a32  498bcf                           mov      rcx, r15
00ec2a35  448b442430                       mov      r8d, dword ptr [rsp + 0x30]
00ec2a3a  8b96603d0000                     mov      edx, dword ptr [rsi + 0x3d60]
00ec2a40  41ffd1                           call     r9
00ec2a43  488bd8                           mov      rbx, rax
00ec2a46  4c8d742460                       lea      r14, [rsp + 0x60]
00ec2a4b  33f6                             xor      esi, esi
00ec2a4d  488d7d90                         lea      rdi, [rbp - 0x70]
00ec2a51  0f1f4000                         nop      dword ptr [rax]
00ec2a55  6666660f1f840000000000           nop      word ptr [rax + rax]
00ec2a60  0f1007                           movups   xmm0, xmmword ptr [rdi]
00ec2a63  4c8d4c2440                       lea      r9, [rsp + 0x40]
00ec2a68  458b06                           mov      r8d, dword ptr [r14]
00ec2a6b  f20f104f10                       movsd    xmm1, qword ptr [rdi + 0x10]
00ec2a70  488bd3                           mov      rdx, rbx
00ec2a73  498bcf                           mov      rcx, r15
00ec2a76  0f29442440                       movaps   xmmword ptr [rsp + 0x40], xmm0
00ec2a7b  f20f114c2450                     movsd    qword ptr [rsp + 0x50], xmm1
00ec2a81  41ff1424                         call     qword ptr [r12]
00ec2a85  ffc6                             inc      esi
00ec2a87  488d7f18                         lea      rdi, [rdi + 0x18]
00ec2a8b  4d8d7604                         lea      r14, [r14 + 4]
00ec2a8f  83fe0c                           cmp      esi, 0xc
00ec2a92  72cc                             jb       0xec2a60
00ec2a94  488b8db0000000                   mov      rcx, qword ptr [rbp + 0xb0]
00ec2a9b  4833cc                           xor      rcx, rsp
00ec2a9e  e8add20401                       call     0x1f0fd50
00ec2aa3  4c8d9c24c0010000                 lea      r11, [rsp + 0x1c0]
00ec2aab  498b5b38                         mov      rbx, qword ptr [r11 + 0x38]
00ec2aaf  498b7340                         mov      rsi, qword ptr [r11 + 0x40]
00ec2ab3  498be3                           mov      rsp, r11
00ec2ab6  415f                             pop      r15
00ec2ab8  415e                             pop      r14
00ec2aba  415c                             pop      r12
00ec2abc  5f                               pop      rdi
00ec2abd  5d                               pop      rbp
00ec2abe  c3                               ret      
