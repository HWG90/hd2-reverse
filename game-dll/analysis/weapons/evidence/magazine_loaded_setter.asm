007798c0  4156                             push     r14
007798c2  4883ec20                         sub      rsp, 0x20
007798c6  3b1504586c02                     cmp      edx, dword ptr [rip + 0x26c5804]
007798cc  458bf0                           mov      r14d, r8d
007798cf  4c8b15227f5602                   mov      r10, qword ptr [rip + 0x2567f22]
007798d6  7507                             jne      0x7798df
007798d8  b8ffffffff                       mov      eax, 0xffffffff
007798dd  eb7a                             jmp      0x779959
007798df  458b4a28                         mov      r9d, dword ptr [r10 + 0x28]
007798e3  4533c0                           xor      r8d, r8d
007798e6  48895c2430                       mov      qword ptr [rsp + 0x30], rbx
007798eb  418b5a30                         mov      ebx, dword ptr [r10 + 0x30]
007798ef  48896c2438                       mov      qword ptr [rsp + 0x38], rbp
007798f4  0fafda                           imul     ebx, edx
007798f7  418d69ff                         lea      ebp, [r9 - 1]
007798fb  4889742440                       mov      qword ptr [rsp + 0x40], rsi
00779900  48897c2448                       mov      qword ptr [rsp + 0x48], rdi
00779905  4585c9                           test     r9d, r9d
00779908  7436                             je       0x779940
0077990a  498b7a20                         mov      rdi, qword ptr [r10 + 0x20]
0077990e  418b722c                         mov      esi, dword ptr [r10 + 0x2c]
00779912  0f1f4000                         nop      dword ptr [rax]
00779916  66660f1f840000000000             nop      word ptr [rax + rax]
00779920  8bc5                             mov      eax, ebp
00779922  418d0c18                         lea      ecx, [r8 + rbx]
00779926  4823c8                           and      rcx, rax
00779929  8b04cf                           mov      eax, dword ptr [rdi + rcx*8]
0077992c  4c8d1ccf                         lea      r11, [rdi + rcx*8]
00779930  3bc6                             cmp      eax, esi
00779932  7462                             je       0x779996
00779934  3bc2                             cmp      eax, edx
00779936  7462                             je       0x77999a
00779938  41ffc0                           inc      r8d
0077993b  453bc1                           cmp      r8d, r9d
0077993e  72e0                             jb       0x779920
00779940  b8ffffffff                       mov      eax, 0xffffffff
00779945  488b742440                       mov      rsi, qword ptr [rsp + 0x40]
0077994a  488b6c2438                       mov      rbp, qword ptr [rsp + 0x38]
0077994f  488b5c2430                       mov      rbx, qword ptr [rsp + 0x30]
00779954  488b7c2448                       mov      rdi, qword ptr [rsp + 0x48]
00779959  8bd0                             mov      edx, eax
0077995b  488d0452                         lea      rax, [rdx + rdx*2]
0077995f  488d0c8500000000                 lea      rcx, [rax*4]
00779967  498b4250                         mov      rax, qword ptr [r10 + 0x50]
0077996b  4489740104                       mov      dword ptr [rcx + rax + 4], r14d
00779970  4d8b4250                         mov      r8, qword ptr [r10 + 0x50]
00779974  498b4238                         mov      rax, qword ptr [r10 + 0x38]
00779978  4983c004                         add      r8, 4
0077997c  4c03c1                           add      r8, rcx
0077997f  488b0cd0                         mov      rcx, qword ptr [rax + rdx*8]
00779983  ba3ed6a5d7                       mov      edx, 0xd7a5d63e
00779988  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
0077998b  4883c420                         add      rsp, 0x20
0077998f  415e                             pop      r14
00779991  e9eafd6e00                       jmp      0xe69780
00779996  3bc2                             cmp      eax, edx
00779998  75a6                             jne      0x779940
0077999a  418b4304                         mov      eax, dword ptr [r11 + 4]
0077999e  eba5                             jmp      0x779945
