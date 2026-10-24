00ad3460  488983483d0000                   mov      qword ptr [rbx + 0x3d48], rax
00ad3467  f30f5983483d0000                 mulss    xmm0, dword ptr [rbx + 0x3d48]
00ad346f  f30f59bb4c3d0000                 mulss    xmm7, dword ptr [rbx + 0x3d4c]
00ad3477  f30f5883503d0000                 addss    xmm0, dword ptr [rbx + 0x3d50]
00ad347f  f30f58bb543d0000                 addss    xmm7, dword ptr [rbx + 0x3d54]
00ad3487  f30f1183503d0000                 movss    dword ptr [rbx + 0x3d50], xmm0
00ad348f  f30f11bb543d0000                 movss    dword ptr [rbx + 0x3d54], xmm7
00ad3497  e854f23e00                       call     0xec26f0
