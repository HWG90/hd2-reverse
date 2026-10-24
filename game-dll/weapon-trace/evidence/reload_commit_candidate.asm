00782000  44884c2420                       mov      byte ptr [rsp + 0x20], r9b
00782005  48894c2408                       mov      qword ptr [rsp + 8], rcx
0078200a  53                               push     rbx
0078200b  56                               push     rsi
0078200c  4157                             push     r15
0078200e  4883ec60                         sub      rsp, 0x60
00782012  3b15ccd06b02                     cmp      edx, dword ptr [rip + 0x26bd0cc]
00782018  458bf8                           mov      r15d, r8d
0078201b  488b350efc5502                   mov      rsi, qword ptr [rip + 0x255fc0e]
00782022  8bda                             mov      ebx, edx
00782024  4889742428                       mov      qword ptr [rsp + 0x28], rsi
00782029  0f84cf0c0000                     je       0x782cfe
0078202f  448b4628                         mov      r8d, dword ptr [rsi + 0x28]
00782033  448b5630                         mov      r10d, dword ptr [rsi + 0x30]
00782037  48897c2458                       mov      qword ptr [rsp + 0x58], rdi
0078203c  4c89642450                       mov      qword ptr [rsp + 0x50], r12
00782041  4533e4                           xor      r12d, r12d
00782044  440fafd3                         imul     r10d, ebx
00782048  418d78ff                         lea      edi, [r8 - 1]
0078204c  418bcc                           mov      ecx, r12d
0078204f  4585c0                           test     r8d, r8d
00782052  0f849c0c0000                     je       0x782cf4
00782058  4c8b4e20                         mov      r9, qword ptr [rsi + 0x20]
0078205c  448b5e2c                         mov      r11d, dword ptr [rsi + 0x2c]
00782060  8bc7                             mov      eax, edi
00782062  428d1411                         lea      edx, [rcx + r10]
00782066  4823d0                           and      rdx, rax
00782069  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078206d  413bc3                           cmp      eax, r11d
00782070  7410                             je       0x782082
00782072  3bc3                             cmp      eax, ebx
00782074  7414                             je       0x78208a
00782076  ffc1                             inc      ecx
00782078  413bc8                           cmp      ecx, r8d
0078207b  72e3                             jb       0x782060
0078207d  e9720c0000                       jmp      0x782cf4
00782082  3bc3                             cmp      eax, ebx
00782084  0f856a0c0000                     jne      0x782cf4
0078208a  4c896c2448                       mov      qword ptr [rsp + 0x48], r13
0078208f  bfffffffff                       mov      edi, 0xffffffff
00782094  458b6cd104                       mov      r13d, dword ptr [r9 + rdx*8 + 4]
00782099  4489ac2488000000                 mov      dword ptr [rsp + 0x88], r13d
007820a1  443bef                           cmp      r13d, edi
007820a4  0f84450c0000                     je       0x782cef
007820aa  488b4638                         mov      rax, qword ptr [rsi + 0x38]
007820ae  4c896c2430                       mov      qword ptr [rsp + 0x30], r13
007820b3  4a8b0ce8                         mov      rcx, qword ptr [rax + r13*8]
007820b7  f6411401                         test     byte ptr [rcx + 0x14], 1
007820bb  0f842e0c0000                     je       0x782cef
007820c1  4889ac2490000000                 mov      qword ptr [rsp + 0x90], rbp
007820c9  4c89742440                       mov      qword ptr [rsp + 0x40], r14
007820ce  e8bd34d8ff                       call     0x505590
007820d3  488b0d36f75502                   mov      rcx, qword ptr [rip + 0x255f736]
007820da  8bd3                             mov      edx, ebx
007820dc  4889442438                       mov      qword ptr [rsp + 0x38], rax
007820e1  e87abdfcff                       call     0x74de60
007820e6  3b1de4cf6b02                     cmp      ebx, dword ptr [rip + 0x26bcfe4]
007820ec  8be8                             mov      ebp, eax
007820ee  0f84ae020000                     je       0x7823a2
007820f4  488b35fdf65502                   mov      rsi, qword ptr [rip + 0x255f6fd]
007820fb  418bcc                           mov      ecx, r12d
007820fe  448b4628                         mov      r8d, dword ptr [rsi + 0x28]
00782102  448b4e30                         mov      r9d, dword ptr [rsi + 0x30]
00782106  440fafcb                         imul     r9d, ebx
0078210a  458d70ff                         lea      r14d, [r8 - 1]
0078210e  4585c0                           test     r8d, r8d
00782111  743b                             je       0x78214e
00782113  4c8b5620                         mov      r10, qword ptr [rsi + 0x20]
00782117  448b5e2c                         mov      r11d, dword ptr [rsi + 0x2c]
0078211b  4489ac2488000000                 mov      dword ptr [rsp + 0x88], r13d
00782123  0f1f4000                         nop      dword ptr [rax]
00782127  660f1f840000000000               nop      word ptr [rax + rax]
00782130  418bc6                           mov      eax, r14d
00782133  428d1409                         lea      edx, [rcx + r9]
00782137  4823d0                           and      rdx, rax
0078213a  418b04d2                         mov      eax, dword ptr [r10 + rdx*8]
0078213e  413bc3                           cmp      eax, r11d
00782141  7467                             je       0x7821aa
00782143  3bc3                             cmp      eax, ebx
00782145  7467                             je       0x7821ae
00782147  ffc1                             inc      ecx
00782149  413bc8                           cmp      ecx, r8d
0078214c  72e2                             jb       0x782130
0078214e  488b055bfd5502                   mov      rax, qword ptr [rip + 0x255fd5b]
00782155  418bcc                           mov      ecx, r12d
00782158  448b4030                         mov      r8d, dword ptr [rax + 0x30]
0078215c  448b4838                         mov      r9d, dword ptr [rax + 0x38]
00782160  440fafcb                         imul     r9d, ebx
00782164  418d70ff                         lea      esi, [r8 - 1]
00782168  4585c0                           test     r8d, r8d
0078216b  0f8439020000                     je       0x7823aa
00782171  4c8b5028                         mov      r10, qword ptr [rax + 0x28]
00782175  448b5834                         mov      r11d, dword ptr [rax + 0x34]
00782179  0f1f8000000000                   nop      dword ptr [rax]
00782180  8bc6                             mov      eax, esi
00782182  428d1409                         lea      edx, [rcx + r9]
00782186  4823d0                           and      rdx, rax
00782189  418b04d2                         mov      eax, dword ptr [r10 + rdx*8]
0078218d  413bc3                           cmp      eax, r11d
00782190  0f84ad000000                     je       0x782243
00782196  3bc3                             cmp      eax, ebx
00782198  0f84ad000000                     je       0x78224b
0078219e  ffc1                             inc      ecx
007821a0  413bc8                           cmp      ecx, r8d
007821a3  72db                             jb       0x782180
007821a5  e900020000                       jmp      0x7823aa
007821aa  3bc3                             cmp      eax, ebx
007821ac  75a0                             jne      0x78214e
007821ae  41397cd204                       cmp      dword ptr [r10 + rdx*8 + 4], edi
007821b3  7499                             je       0x78214e
007821b5  488b4c2428                       mov      rcx, qword ptr [rsp + 0x28]
007821ba  498bc5                           mov      rax, r13
007821bd  488b4938                         mov      rcx, qword ptr [rcx + 0x38]
007821c1  488b0cc1                         mov      rcx, qword ptr [rcx + rax*8]
007821c5  e8d698d7ff                       call     0x4fbaa0
007821ca  448b4628                         mov      r8d, dword ptr [rsi + 0x28]
007821ce  4c8bf0                           mov      r14, rax
007821d1  448b4e30                         mov      r9d, dword ptr [rsi + 0x30]
007821d5  418bcc                           mov      ecx, r12d
007821d8  440fafcb                         imul     r9d, ebx
007821dc  418d68ff                         lea      ebp, [r8 - 1]
007821e0  4585c0                           test     r8d, r8d
007821e3  7428                             je       0x78220d
007821e5  4c8b5620                         mov      r10, qword ptr [rsi + 0x20]
007821e9  448b5e2c                         mov      r11d, dword ptr [rsi + 0x2c]
007821ed  0f1f00                           nop      dword ptr [rax]
007821f0  8bc5                             mov      eax, ebp
007821f2  428d1409                         lea      edx, [rcx + r9]
007821f6  4823d0                           and      rdx, rax
007821f9  418b04d2                         mov      eax, dword ptr [r10 + rdx*8]
007821fd  413bc3                           cmp      eax, r11d
00782200  7436                             je       0x782238
00782202  3bc3                             cmp      eax, ebx
00782204  7436                             je       0x78223c
00782206  ffc1                             inc      ecx
00782208  413bc8                           cmp      ecx, r8d
0078220b  72e3                             jb       0x7821f0
0078220d  8bc7                             mov      eax, edi
0078220f  418bae88000000                   mov      ebp, dword ptr [r14 + 0x88]
00782216  8bc8                             mov      ecx, eax
00782218  48c1e104                         shl      rcx, 4
0078221c  48034e48                         add      rcx, qword ptr [rsi + 0x48]
00782220  4538a69c000000                   cmp      byte ptr [r14 + 0x9c], r12b
00782227  7408                             je       0x782231
00782229  44396108                         cmp      dword ptr [rcx + 8], r12d
0078222d  7502                             jne      0x782231
0078222f  ffcd                             dec      ebp
00782231  8929                             mov      dword ptr [rcx], ebp
00782233  e972010000                       jmp      0x7823aa
00782238  3bc3                             cmp      eax, ebx
0078223a  75d1                             jne      0x78220d
0078223c  418b44d204                       mov      eax, dword ptr [r10 + rdx*8 + 4]
00782241  ebcc                             jmp      0x78220f
00782243  3bc3                             cmp      eax, ebx
00782245  0f855f010000                     jne      0x7823aa
0078224b  41397cd204                       cmp      dword ptr [r10 + rdx*8 + 4], edi
00782250  0f8454010000                     je       0x7823aa
00782256  8bd3                             mov      edx, ebx
00782258  e813c7fcff                       call     0x74e970
0078225d  3be8                             cmp      ebp, eax
0078225f  7517                             jne      0x782278
00782261  8bd3                             mov      edx, ebx
00782263  e8f8320000                       call     0x785560
00782268  488b0da1f55502                   mov      rcx, qword ptr [rip + 0x255f5a1]
0078226f  8bd3                             mov      edx, ebx
00782271  e8eabbfcff                       call     0x74de60
00782276  8be8                             mov      ebp, eax
00782278  488b4c2428                       mov      rcx, qword ptr [rsp + 0x28]
0078227d  498bc5                           mov      rax, r13
00782280  488b4938                         mov      rcx, qword ptr [rcx + 0x38]
00782284  488b0cc1                         mov      rcx, qword ptr [rcx + rax*8]
00782288  e8533fd8ff                       call     0x5061e0
0078228d  8b153dce6b02                     mov      edx, dword ptr [rip + 0x26bce3d]
00782293  4c8b0d16fc5502                   mov      r9, qword ptr [rip + 0x255fc16]
0078229a  4889842480000000                 mov      qword ptr [rsp + 0x80], rax
007822a2  3bda                             cmp      ebx, edx
007822a4  7450                             je       0x7822f6
007822a6  458b5130                         mov      r10d, dword ptr [r9 + 0x30]
007822aa  418bcc                           mov      ecx, r12d
007822ad  458b5938                         mov      r11d, dword ptr [r9 + 0x38]
007822b1  440fafdb                         imul     r11d, ebx
007822b5  458d6aff                         lea      r13d, [r10 - 1]
007822b9  4585d2                           test     r10d, r10d
007822bc  7438                             je       0x7822f6
007822be  498b7128                         mov      rsi, qword ptr [r9 + 0x28]
007822c2  458b7134                         mov      r14d, dword ptr [r9 + 0x34]
007822c6  66660f1f840000000000             nop      word ptr [rax + rax]
007822d0  418bc5                           mov      eax, r13d
007822d3  468d0419                         lea      r8d, [rcx + r11]
007822d7  4c23c0                           and      r8, rax
007822da  428b04c6                         mov      eax, dword ptr [rsi + r8*8]
007822de  413bc6                           cmp      eax, r14d
007822e1  0f849e000000                     je       0x782385
007822e7  3bc3                             cmp      eax, ebx
007822e9  0f849e000000                     je       0x78238d
007822ef  ffc1                             inc      ecx
007822f1  413bca                           cmp      ecx, r10d
007822f4  72da                             jb       0x7822d0
007822f6  8bcf                             mov      ecx, edi
007822f8  8bc1                             mov      eax, ecx
007822fa  488d0c40                         lea      rcx, [rax + rax*2]
007822fe  498b4150                         mov      rax, qword ptr [r9 + 0x50]
00782302  4c8d2cc8                         lea      r13, [rax + rcx*8]
00782306  488b842480000000                 mov      rax, qword ptr [rsp + 0x80]
0078230e  03685c                           add      ebp, dword ptr [rax + 0x5c]
00782311  44386068                         cmp      byte ptr [rax + 0x68], r12b
00782315  7408                             je       0x78231f
00782317  45396510                         cmp      dword ptr [r13 + 0x10], r12d
0078231b  7502                             jne      0x78231f
0078231d  ffcd                             dec      ebp
0078231f  3bda                             cmp      ebx, edx
00782321  744a                             je       0x78236d
00782323  458b4130                         mov      r8d, dword ptr [r9 + 0x30]
00782327  418bcc                           mov      ecx, r12d
0078232a  458b5138                         mov      r10d, dword ptr [r9 + 0x38]
0078232e  440fafd3                         imul     r10d, ebx
00782332  458d70ff                         lea      r14d, [r8 - 1]
00782336  4585c0                           test     r8d, r8d
00782339  7432                             je       0x78236d
0078233b  4d8b5928                         mov      r11, qword ptr [r9 + 0x28]
0078233f  418b7134                         mov      esi, dword ptr [r9 + 0x34]
00782343  0f1f4000                         nop      dword ptr [rax]
00782347  660f1f840000000000               nop      word ptr [rax + rax]
00782350  418bc6                           mov      eax, r14d
00782353  428d1411                         lea      edx, [rcx + r10]
00782357  4823d0                           and      rdx, rax
0078235a  418b04d3                         mov      eax, dword ptr [r11 + rdx*8]
0078235e  3bc6                             cmp      eax, esi
00782360  7435                             je       0x782397
00782362  3bc3                             cmp      eax, ebx
00782364  7435                             je       0x78239b
00782366  ffc1                             inc      ecx
00782368  413bc8                           cmp      ecx, r8d
0078236b  72e3                             jb       0x782350
0078236d  8bc7                             mov      eax, edi
0078236f  8bc8                             mov      ecx, eax
00782371  498b4158                         mov      rax, qword ptr [r9 + 0x58]
00782375  488d1489                         lea      rdx, [rcx + rcx*4]
00782379  48634c9004                       movsxd   rcx, dword ptr [rax + rdx*4 + 4]
0078237e  41896c8d04                       mov      dword ptr [r13 + rcx*4 + 4], ebp
00782383  eb25                             jmp      0x7823aa
00782385  3bc3                             cmp      eax, ebx
00782387  0f8569ffffff                     jne      0x7822f6
0078238d  428b4cc604                       mov      ecx, dword ptr [rsi + r8*8 + 4]
00782392  e961ffffff                       jmp      0x7822f8
00782397  3bc3                             cmp      eax, ebx
00782399  75d2                             jne      0x78236d
0078239b  418b44d304                       mov      eax, dword ptr [r11 + rdx*8 + 4]
007823a0  ebcd                             jmp      0x78236f
007823a2  4489ac2488000000                 mov      dword ptr [rsp + 0x88], r13d
007823aa  488b0d5ff45502                   mov      rcx, qword ptr [rip + 0x255f45f]
007823b1  448bc5                           mov      r8d, ebp
007823b4  8bd3                             mov      edx, ebx
007823b6  e855b4fcff                       call     0x74d810
007823bb  448b350ecd6b02                   mov      r14d, dword ptr [rip + 0x26bcd0e]
007823c2  413bde                           cmp      ebx, r14d
007823c5  0f844d020000                     je       0x782618
007823cb  4c8b2d36fb5502                   mov      r13, qword ptr [rip + 0x255fb36]
007823d2  418bcc                           mov      ecx, r12d
007823d5  458b4530                         mov      r8d, dword ptr [r13 + 0x30]
007823d9  418b7538                         mov      esi, dword ptr [r13 + 0x38]
007823dd  448bd6                           mov      r10d, esi
007823e0  440fafd3                         imul     r10d, ebx
007823e4  418d68ff                         lea      ebp, [r8 - 1]
007823e8  4585c0                           test     r8d, r8d
007823eb  0f84ed000000                     je       0x7824de
007823f1  4d8b4d28                         mov      r9, qword ptr [r13 + 0x28]
007823f5  458b5d34                         mov      r11d, dword ptr [r13 + 0x34]
007823f9  0f1f8000000000                   nop      dword ptr [rax]
00782400  8bc5                             mov      eax, ebp
00782402  428d1411                         lea      edx, [rcx + r10]
00782406  4823d0                           and      rdx, rax
00782409  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078240d  413bc3                           cmp      eax, r11d
00782410  7410                             je       0x782422
00782412  3bc3                             cmp      eax, ebx
00782414  7414                             je       0x78242a
00782416  ffc1                             inc      ecx
00782418  413bc8                           cmp      ecx, r8d
0078241b  72e3                             jb       0x782400
0078241d  e9bc000000                       jmp      0x7824de
00782422  3bc3                             cmp      eax, ebx
00782424  0f85b4000000                     jne      0x7824de
0078242a  41397cd104                       cmp      dword ptr [r9 + rdx*8 + 4], edi
0078242f  0f84a9000000                     je       0x7824de
00782435  0faff3                           imul     esi, ebx
00782438  458d50ff                         lea      r10d, [r8 - 1]
0078243c  418bcc                           mov      ecx, r12d
0078243f  90                               nop      
00782440  418bc2                           mov      eax, r10d
00782443  8d1431                           lea      edx, [rcx + rsi]
00782446  4823d0                           and      rdx, rax
00782449  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078244d  413bc3                           cmp      eax, r11d
00782450  0f84eb000000                     je       0x782541
00782456  3bc3                             cmp      eax, ebx
00782458  0f84eb000000                     je       0x782549
0078245e  ffc1                             inc      ecx
00782460  413bc8                           cmp      ecx, r8d
00782463  72db                             jb       0x782440
00782465  8b8c2488000000                   mov      ecx, dword ptr [rsp + 0x88]
0078246c  898c2488000000                   mov      dword ptr [rsp + 0x88], ecx
00782473  8bc7                             mov      eax, edi
00782475  448bf0                           mov      r14d, eax
00782478  ba363802a5                       mov      edx, 0xa5023836
0078247d  498b4558                         mov      rax, qword ptr [r13 + 0x58]
00782481  4b8d3476                         lea      rsi, [r14 + r14*2]
00782485  448964b004                       mov      dword ptr [rax + rsi*4 + 4], r12d
0078248a  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0078248e  4d8b4558                         mov      r8, qword ptr [r13 + 0x58]
00782492  4983c004                         add      r8, 4
00782496  4a8b0cf0                         mov      rcx, qword ptr [rax + r14*8]
0078249a  4d8d04b0                         lea      r8, [r8 + rsi*4]
0078249e  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
007824a1  e8da726e00                       call     0xe69780
007824a6  488b0d5bfa5502                   mov      rcx, qword ptr [rip + 0x255fa5b]
007824ad  ba535c27f6                       mov      edx, 0xf6275c53
007824b2  488b4158                         mov      rax, qword ptr [rcx + 0x58]
007824b6  448864b008                       mov      byte ptr [rax + rsi*4 + 8], r12b
007824bb  4c8b4158                         mov      r8, qword ptr [rcx + 0x58]
007824bf  488b4140                         mov      rax, qword ptr [rcx + 0x40]
007824c3  4983c008                         add      r8, 8
007824c7  4a8b0cf0                         mov      rcx, qword ptr [rax + r14*8]
007824cb  4d8d04b0                         lea      r8, [r8 + rsi*4]
007824cf  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
007824d2  e8a9726e00                       call     0xe69780
007824d7  448b35f2cb6b02                   mov      r14d, dword ptr [rip + 0x26bcbf2]
007824de  413bde                           cmp      ebx, r14d
007824e1  0f8431010000                     je       0x782618
007824e7  4c8b2d9af35502                   mov      r13, qword ptr [rip + 0x255f39a]
007824ee  418bcc                           mov      ecx, r12d
007824f1  458b4558                         mov      r8d, dword ptr [r13 + 0x58]
007824f5  458b5d60                         mov      r11d, dword ptr [r13 + 0x60]
007824f9  418bf3                           mov      esi, r11d
007824fc  0faff3                           imul     esi, ebx
007824ff  418d68ff                         lea      ebp, [r8 - 1]
00782503  4585c0                           test     r8d, r8d
00782506  0f840c010000                     je       0x782618
0078250c  4d8b4d50                         mov      r9, qword ptr [r13 + 0x50]
00782510  458b555c                         mov      r10d, dword ptr [r13 + 0x5c]
00782514  0f1f4000                         nop      dword ptr [rax]
00782518  0f1f840000000000                 nop      dword ptr [rax + rax]
00782520  8bc5                             mov      eax, ebp
00782522  8d1431                           lea      edx, [rcx + rsi]
00782525  4823d0                           and      rdx, rax
00782528  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078252c  413bc2                           cmp      eax, r10d
0078252f  7422                             je       0x782553
00782531  3bc3                             cmp      eax, ebx
00782533  7426                             je       0x78255b
00782535  ffc1                             inc      ecx
00782537  413bc8                           cmp      ecx, r8d
0078253a  72e4                             jb       0x782520
0078253c  e9d7000000                       jmp      0x782618
00782541  3bc3                             cmp      eax, ebx
00782543  0f852affffff                     jne      0x782473
00782549  418b44d104                       mov      eax, dword ptr [r9 + rdx*8 + 4]
0078254e  e922ffffff                       jmp      0x782475
00782553  3bc3                             cmp      eax, ebx
00782555  0f85bd000000                     jne      0x782618
0078255b  41397cd104                       cmp      dword ptr [r9 + rdx*8 + 4], edi
00782560  0f84b2000000                     je       0x782618
00782566  440fafdb                         imul     r11d, ebx
0078256a  418d70ff                         lea      esi, [r8 - 1]
0078256e  418bcc                           mov      ecx, r12d
00782571  0f1f4000                         nop      dword ptr [rax]
00782575  6666660f1f840000000000           nop      word ptr [rax + rax]
00782580  8bc6                             mov      eax, esi
00782582  428d1419                         lea      edx, [rcx + r11]
00782586  4823d0                           and      rdx, rax
00782589  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078258d  413bc2                           cmp      eax, r10d
00782590  0f8464010000                     je       0x7826fa
00782596  3bc3                             cmp      eax, ebx
00782598  0f8464010000                     je       0x782702
0078259e  ffc1                             inc      ecx
007825a0  413bc8                           cmp      ecx, r8d
007825a3  72db                             jb       0x782580
007825a5  8b8c2488000000                   mov      ecx, dword ptr [rsp + 0x88]
007825ac  898c2488000000                   mov      dword ptr [rsp + 0x88], ecx
007825b3  8bc7                             mov      eax, edi
007825b5  4d8b4500                         mov      r8, qword ptr [r13]
007825b9  48b92d7f954c2df45158             movabs   rcx, 0x5851f42d4c957f2d
007825c3  4c0fafc1                         imul     r8, rcx
007825c7  8bd0                             mov      edx, eax
007825c9  48b94f8167f77e7b0514             movabs   rcx, 0x14057b7ef767814f
007825d3  4c03c1                           add      r8, rcx
007825d6  4d894500                         mov      qword ptr [r13], r8
007825da  498b8580000000                   mov      rax, qword ptr [r13 + 0x80]
007825e1  488d0c52                         lea      rcx, [rdx + rdx*2]
007825e5  49c1e820                         shr      r8, 0x20
007825e9  488d4902                         lea      rcx, [rcx + 2]
007825ed  44890488                         mov      dword ptr [rax + rcx*4], r8d
007825f1  498b8580000000                   mov      rax, qword ptr [r13 + 0x80]
007825f8  4c8d0488                         lea      r8, [rax + rcx*4]
007825fc  498b4568                         mov      rax, qword ptr [r13 + 0x68]
00782600  488b0cd0                         mov      rcx, qword ptr [rax + rdx*8]
00782604  ba4ec53070                       mov      edx, 0x7030c54e
00782609  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
0078260c  e86f716e00                       call     0xe69780
00782611  448b35b8ca6b02                   mov      r14d, dword ptr [rip + 0x26bcab8]
00782618  4438a42498000000                 cmp      byte ptr [rsp + 0x98], r12b
00782620  0f84a4060000                     je       0x782cca
00782626  8b2db8ca6b02                     mov      ebp, dword ptr [rip + 0x26bcab8]
0078262c  413bde                           cmp      ebx, r14d
0078262f  7454                             je       0x782685
00782631  4c8b0d10f25502                   mov      r9, qword ptr [rip + 0x255f210]
00782638  418bcc                           mov      ecx, r12d
0078263b  458b4120                         mov      r8d, dword ptr [r9 + 0x20]
0078263f  458b5128                         mov      r10d, dword ptr [r9 + 0x28]
00782643  440fafd3                         imul     r10d, ebx
00782647  458d68ff                         lea      r13d, [r8 - 1]
0078264b  4585c0                           test     r8d, r8d
0078264e  7435                             je       0x782685
00782650  4d8b5918                         mov      r11, qword ptr [r9 + 0x18]
00782654  418b7124                         mov      esi, dword ptr [r9 + 0x24]
00782658  0f1f840000000000                 nop      dword ptr [rax + rax]
00782660  418bc5                           mov      eax, r13d
00782663  428d1411                         lea      edx, [rcx + r10]
00782667  4823d0                           and      rdx, rax
0078266a  418b04d3                         mov      eax, dword ptr [r11 + rdx*8]
0078266e  3bc6                             cmp      eax, esi
00782670  0f8496000000                     je       0x78270c
00782676  3bc3                             cmp      eax, ebx
00782678  0f8496000000                     je       0x782714
0078267e  ffc1                             inc      ecx
00782680  413bc8                           cmp      ecx, r8d
00782683  72db                             jb       0x782660
00782685  89ac2480000000                   mov      dword ptr [rsp + 0x80], ebp
0078268c  488d842480000000                 lea      rax, [rsp + 0x80]
00782694  8b30                             mov      esi, dword ptr [rax]
00782696  3bdd                             cmp      ebx, ebp
00782698  0f8445020000                     je       0x7828e3
0078269e  488b0503f75502                   mov      rax, qword ptr [rip + 0x255f703]
007826a5  418bcc                           mov      ecx, r12d
007826a8  448b4020                         mov      r8d, dword ptr [rax + 0x20]
007826ac  448b4828                         mov      r9d, dword ptr [rax + 0x28]
007826b0  440fafcb                         imul     r9d, ebx
007826b4  418d68ff                         lea      ebp, [r8 - 1]
007826b8  4585c0                           test     r8d, r8d
007826bb  0f8422020000                     je       0x7828e3
007826c1  4c8b5018                         mov      r10, qword ptr [rax + 0x18]
007826c5  448b5824                         mov      r11d, dword ptr [rax + 0x24]
007826c9  0f1f8000000000                   nop      dword ptr [rax]
007826d0  8bc5                             mov      eax, ebp
007826d2  428d1409                         lea      edx, [rcx + r9]
007826d6  4823d0                           and      rdx, rax
007826d9  418b04d2                         mov      eax, dword ptr [r10 + rdx*8]
007826dd  413bc3                           cmp      eax, r11d
007826e0  0f84a3000000                     je       0x782789
007826e6  3bc3                             cmp      eax, ebx
007826e8  0f84a3000000                     je       0x782791
007826ee  ffc1                             inc      ecx
007826f0  413bc8                           cmp      ecx, r8d
007826f3  72db                             jb       0x7826d0
007826f5  e9e9010000                       jmp      0x7828e3
007826fa  3bc3                             cmp      eax, ebx
007826fc  0f85b1feffff                     jne      0x7825b3
00782702  418b44d104                       mov      eax, dword ptr [r9 + rdx*8 + 4]
00782707  e9a9feffff                       jmp      0x7825b5
0078270c  3bc3                             cmp      eax, ebx
0078270e  0f8571ffffff                     jne      0x782685
00782714  41397cd304                       cmp      dword ptr [r11 + rdx*8 + 4], edi
00782719  0f8466ffffff                     je       0x782685
0078271f  458b5128                         mov      r10d, dword ptr [r9 + 0x28]
00782723  458d68ff                         lea      r13d, [r8 - 1]
00782727  440fafd3                         imul     r10d, ebx
0078272b  418bcc                           mov      ecx, r12d
0078272e  4585c0                           test     r8d, r8d
00782731  742a                             je       0x78275d
00782733  0f1f4000                         nop      dword ptr [rax]
00782737  660f1f840000000000               nop      word ptr [rax + rax]
00782740  418bc5                           mov      eax, r13d
00782743  428d1411                         lea      edx, [rcx + r10]
00782747  4823d0                           and      rdx, rax
0078274a  418b04d3                         mov      eax, dword ptr [r11 + rdx*8]
0078274e  3bc6                             cmp      eax, esi
00782750  742c                             je       0x78277e
00782752  3bc3                             cmp      eax, ebx
00782754  742c                             je       0x782782
00782756  ffc1                             inc      ecx
00782758  413bc8                           cmp      ecx, r8d
0078275b  72e3                             jb       0x782740
0078275d  8bc7                             mov      eax, edi
0078275f  8bc8                             mov      ecx, eax
00782761  498b4138                         mov      rax, qword ptr [r9 + 0x38]
00782765  4869d1ac000000                   imul     rdx, rcx, 0xac
0078276c  488d4c2420                       lea      rcx, [rsp + 0x20]
00782771  8b1402                           mov      edx, dword ptr [rdx + rax]
00782774  e8a7716e00                       call     0xe69920
00782779  e916ffffff                       jmp      0x782694
0078277e  3bc3                             cmp      eax, ebx
00782780  75db                             jne      0x78275d
00782782  418b44d304                       mov      eax, dword ptr [r11 + rdx*8 + 4]
00782787  ebd6                             jmp      0x78275f
00782789  3bc3                             cmp      eax, ebx
0078278b  0f8552010000                     jne      0x7828e3
00782791  41397cd204                       cmp      dword ptr [r10 + rdx*8 + 4], edi
00782796  0f8447010000                     je       0x7828e3
0078279c  488b0d6df05502                   mov      rcx, qword ptr [rip + 0x255f06d]
007827a3  8bd3                             mov      edx, ebx
007827a5  e836cffcff                       call     0x74f6e0
007827aa  85c0                             test     eax, eax
007827ac  0f852a010000                     jne      0x7828dc
007827b2  458bc7                           mov      r8d, r15d
007827b5  488d942480000000                 lea      rdx, [rsp + 0x80]
007827bd  e81e912300                       call     0x9bb8e0
007827c2  488b442428                       mov      rax, qword ptr [rsp + 0x28]
007827c7  488b5038                         mov      rdx, qword ptr [rax + 0x38]
007827cb  488b442430                       mov      rax, qword ptr [rsp + 0x30]
007827d0  488b0cc2                         mov      rcx, qword ptr [rdx + rax*8]
007827d4  4885c9                           test     rcx, rcx
007827d7  7505                             jne      0x7827de
007827d9  4d8bf4                           mov      r14, r12
007827dc  eb0b                             jmp      0x7827e9
007827de  488b09                           mov      rcx, qword ptr [rcx]
007827e1  e89ad4d7ff                       call     0x4ffc80
007827e6  4c8bf0                           mov      r14, rax
007827e9  8b942480000000                   mov      edx, dword ptr [rsp + 0x80]
007827f0  3b15eec86b02                     cmp      edx, dword ptr [rip + 0x26bc8ee]
007827f6  0f84ce040000                     je       0x782cca
007827fc  3b15cec86b02                     cmp      edx, dword ptr [rip + 0x26bc8ce]
00782802  0f84c2040000                     je       0x782cca
00782808  4c8b1589ef5502                   mov      r10, qword ptr [rip + 0x255ef89]
0078280f  418bcc                           mov      ecx, r12d
00782812  458b4a28                         mov      r9d, dword ptr [r10 + 0x28]
00782816  458b5a30                         mov      r11d, dword ptr [r10 + 0x30]
0078281a  440fafda                         imul     r11d, edx
0078281e  418d69ff                         lea      ebp, [r9 - 1]
00782822  4585c9                           test     r9d, r9d
00782825  0f849f040000                     je       0x782cca
0078282b  498b5a20                         mov      rbx, qword ptr [r10 + 0x20]
0078282f  418b722c                         mov      esi, dword ptr [r10 + 0x2c]
00782833  0f1f4000                         nop      dword ptr [rax]
00782837  660f1f840000000000               nop      word ptr [rax + rax]
00782840  8bc5                             mov      eax, ebp
00782842  468d0419                         lea      r8d, [rcx + r11]
00782846  4c23c0                           and      r8, rax
00782849  428b04c3                         mov      eax, dword ptr [rbx + r8*8]
0078284d  3bc6                             cmp      eax, esi
0078284f  7410                             je       0x782861
00782851  3bc2                             cmp      eax, edx
00782853  7414                             je       0x782869
00782855  ffc1                             inc      ecx
00782857  413bc9                           cmp      ecx, r9d
0078285a  72e4                             jb       0x782840
0078285c  e969040000                       jmp      0x782cca
00782861  3bc2                             cmp      eax, edx
00782863  0f8561040000                     jne      0x782cca
00782869  42397cc304                       cmp      dword ptr [rbx + r8*8 + 4], edi
0078286e  0f8456040000                     je       0x782cca
00782874  458b4228                         mov      r8d, dword ptr [r10 + 0x28]
00782878  458b4a30                         mov      r9d, dword ptr [r10 + 0x30]
0078287c  440fafca                         imul     r9d, edx
00782880  418d70ff                         lea      esi, [r8 - 1]
00782884  4585c0                           test     r8d, r8d
00782887  742f                             je       0x7828b8
00782889  4c8bdb                           mov      r11, rbx
0078288c  418b5a2c                         mov      ebx, dword ptr [r10 + 0x2c]
00782890  8bc6                             mov      eax, esi
00782892  438d0c0c                         lea      ecx, [r12 + r9]
00782896  4823c8                           and      rcx, rax
00782899  418b04cb                         mov      eax, dword ptr [r11 + rcx*8]
0078289d  3bc3                             cmp      eax, ebx
0078289f  740e                             je       0x7828af
007828a1  3bc2                             cmp      eax, edx
007828a3  740e                             je       0x7828b3
007828a5  41ffc4                           inc      r12d
007828a8  453be0                           cmp      r12d, r8d
007828ab  72e3                             jb       0x782890
007828ad  eb09                             jmp      0x7828b8
007828af  3bc2                             cmp      eax, edx
007828b1  7505                             jne      0x7828b8
007828b3  418b7ccb04                       mov      edi, dword ptr [r11 + rcx*8 + 4]
007828b8  498b4250                         mov      rax, qword ptr [r10 + 0x50]
007828bc  8bcf                             mov      ecx, edi
007828be  833cc800                         cmp      dword ptr [rax + rcx*8], 0
007828c2  0f8602040000                     jbe      0x782cca
007828c8  458b4614                         mov      r8d, dword ptr [r14 + 0x14]
007828cc  41b101                           mov      r9b, 1
007828cf  498bca                           mov      rcx, r10
007828d2  e8c9a61000                       call     0x88cfa0
007828d7  e9ee030000                       jmp      0x782cca
007828dc  448b35edc76b02                   mov      r14d, dword ptr [rip + 0x26bc7ed]
007828e3  488b442438                       mov      rax, qword ptr [rsp + 0x38]
007828e8  4438603c                         cmp      byte ptr [rax + 0x3c], r12b
007828ec  7457                             je       0x782945
007828ee  413bf6                           cmp      esi, r14d
007828f1  7452                             je       0x782945
007828f3  4c8b159eee5502                   mov      r10, qword ptr [rip + 0x255ee9e]
007828fa  418bcc                           mov      ecx, r12d
007828fd  458b4228                         mov      r8d, dword ptr [r10 + 0x28]
00782901  458b4a30                         mov      r9d, dword ptr [r10 + 0x30]
00782905  440fafce                         imul     r9d, esi
00782909  458d68ff                         lea      r13d, [r8 - 1]
0078290d  4585c0                           test     r8d, r8d
00782910  7433                             je       0x782945
00782912  4d8b5a20                         mov      r11, qword ptr [r10 + 0x20]
00782916  418b6a2c                         mov      ebp, dword ptr [r10 + 0x2c]
0078291a  660f1f440000                     nop      word ptr [rax + rax]
00782920  418bc5                           mov      eax, r13d
00782923  428d1409                         lea      edx, [rcx + r9]
00782927  4823d0                           and      rdx, rax
0078292a  418b04d3                         mov      eax, dword ptr [r11 + rdx*8]
0078292e  3bc5                             cmp      eax, ebp
00782930  0f8414010000                     je       0x782a4a
00782936  3bc6                             cmp      eax, esi
00782938  0f8414010000                     je       0x782a52
0078293e  ffc1                             inc      ecx
00782940  413bc8                           cmp      ecx, r8d
00782943  72db                             jb       0x782920
00782945  413bde                           cmp      ebx, r14d
00782948  0f847c030000                     je       0x782cca
0078294e  4c8b35b3f55502                   mov      r14, qword ptr [rip + 0x255f5b3]
00782955  418bcc                           mov      ecx, r12d
00782958  458b4630                         mov      r8d, dword ptr [r14 + 0x30]
0078295c  458b5e38                         mov      r11d, dword ptr [r14 + 0x38]
00782960  418bf3                           mov      esi, r11d
00782963  0faff3                           imul     esi, ebx
00782966  418d68ff                         lea      ebp, [r8 - 1]
0078296a  4585c0                           test     r8d, r8d
0078296d  7435                             je       0x7829a4
0078296f  4d8b4e28                         mov      r9, qword ptr [r14 + 0x28]
00782973  458b5634                         mov      r10d, dword ptr [r14 + 0x34]
00782977  660f1f840000000000               nop      word ptr [rax + rax]
00782980  8bc5                             mov      eax, ebp
00782982  8d1431                           lea      edx, [rcx + rsi]
00782985  4823d0                           and      rdx, rax
00782988  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
0078298c  413bc2                           cmp      eax, r10d
0078298f  0f84de000000                     je       0x782a73
00782995  3bc3                             cmp      eax, ebx
00782997  0f84de000000                     je       0x782a7b
0078299d  ffc1                             inc      ecx
0078299f  413bc8                           cmp      ecx, r8d
007829a2  72dc                             jb       0x782980
007829a4  488b2d4dee5502                   mov      rbp, qword ptr [rip + 0x255ee4d]
007829ab  418bcc                           mov      ecx, r12d
007829ae  448b4528                         mov      r8d, dword ptr [rbp + 0x28]
007829b2  448b5d30                         mov      r11d, dword ptr [rbp + 0x30]
007829b6  418bf3                           mov      esi, r11d
007829b9  0faff3                           imul     esi, ebx
007829bc  458d70ff                         lea      r14d, [r8 - 1]
007829c0  4585c0                           test     r8d, r8d
007829c3  7430                             je       0x7829f5
007829c5  4c8b4d20                         mov      r9, qword ptr [rbp + 0x20]
007829c9  448b552c                         mov      r10d, dword ptr [rbp + 0x2c]
007829cd  0f1f00                           nop      dword ptr [rax]
007829d0  418bc6                           mov      eax, r14d
007829d3  8d1431                           lea      edx, [rcx + rsi]
007829d6  4823d0                           and      rdx, rax
007829d9  418b04d1                         mov      eax, dword ptr [r9 + rdx*8]
007829dd  413bc2                           cmp      eax, r10d
007829e0  0f84fe000000                     je       0x782ae4
007829e6  3bc3                             cmp      eax, ebx
007829e8  0f84fe000000                     je       0x782aec
007829ee  ffc1                             inc      ecx
007829f0  413bc8                           cmp      ecx, r8d
007829f3  72db                             jb       0x7829d0
007829f5  488b35b4f45502                   mov      rsi, qword ptr [rip + 0x255f4b4]
007829fc  418bcc                           mov      ecx, r12d
007829ff  448b4630                         mov      r8d, dword ptr [rsi + 0x30]
00782a03  448b4e38                         mov      r9d, dword ptr [rsi + 0x38]
00782a07  440fafcb                         imul     r9d, ebx
00782a0b  418d68ff                         lea      ebp, [r8 - 1]
00782a0f  4585c0                           test     r8d, r8d
00782a12  0f84b2020000                     je       0x782cca
00782a18  4c8b5628                         mov      r10, qword ptr [rsi + 0x28]
00782a1c  448b5e34                         mov      r11d, dword ptr [rsi + 0x34]
00782a20  8bc5                             mov      eax, ebp
00782a22  428d1409                         lea      edx, [rcx + r9]
00782a26  4823d0                           and      rdx, rax
00782a29  418b04d2                         mov      eax, dword ptr [r10 + rdx*8]
00782a2d  413bc3                           cmp      eax, r11d
00782a30  0f843d010000                     je       0x782b73
00782a36  3bc3                             cmp      eax, ebx
00782a38  0f843d010000                     je       0x782b7b
00782a3e  ffc1                             inc      ecx
00782a40  413bc8                           cmp      ecx, r8d
00782a43  72db                             jb       0x782a20
00782a45  e980020000                       jmp      0x782cca
00782a4a  3bc6                             cmp      eax, esi
00782a4c  0f85f3feffff                     jne      0x782945
00782a52  41397cd304                       cmp      dword ptr [r11 + rdx*8 + 4], edi
00782a57  0f84e8feffff                     je       0x782945
00782a5d  4533c9                           xor      r9d, r9d
00782a60  8bd6                             mov      edx, esi
00782a62  498bca                           mov      rcx, r10
00782a65  458d4101                         lea      r8d, [r9 + 1]
00782a69  e832a51000                       call     0x88cfa0
00782a6e  e957020000                       jmp      0x782cca
00782a73  3bc3                             cmp      eax, ebx
00782a75  0f8529ffffff                     jne      0x7829a4
00782a7b  41397cd104                       cmp      dword ptr [r9 + rdx*8 + 4], edi
00782a80  0f841effffff                     je       0x7829a4
00782a86  440fafdb                         imul     r11d, ebx
00782a8a  418d50ff                         lea      edx, [r8 - 1]
00782a8e  6690                             nop      
00782a90  8bc2                             mov      eax, edx
00782a92  438d0c1c                         lea      ecx, [r12 + r11]
00782a96  4823c8                           and      rcx, rax
00782a99  418b04c9                         mov      eax, dword ptr [r9 + rcx*8]
00782a9d  413bc2                           cmp      eax, r10d
00782aa0  741c                             je       0x782abe
00782aa2  3bc3                             cmp      eax, ebx
00782aa4  741c                             je       0x782ac2
00782aa6  41ffc4                           inc      r12d
00782aa9  453be0                           cmp      r12d, r8d
00782aac  72e2                             jb       0x782a90
00782aae  8b842488000000                   mov      eax, dword ptr [rsp + 0x88]
00782ab5  89842488000000                   mov      dword ptr [rsp + 0x88], eax
00782abc  eb09                             jmp      0x782ac7
00782abe  3bc3                             cmp      eax, ebx
00782ac0  7505                             jne      0x782ac7
00782ac2  418b7cc904                       mov      edi, dword ptr [r9 + rcx*8 + 4]
00782ac7  498b4e58                         mov      rcx, qword ptr [r14 + 0x58]
00782acb  8bd7                             mov      edx, edi
00782acd  4c8d0452                         lea      r8, [rdx + rdx*2]
00782ad1  42832c8101                       sub      dword ptr [rcx + r8*4], 1
00782ad6  498b4640                         mov      rax, qword ptr [r14 + 0x40]
00782ada  488b0cd0                         mov      rcx, qword ptr [rax + rdx*8]
00782ade  498b4658                         mov      rax, qword ptr [r14 + 0x58]
00782ae2  eb6e                             jmp      0x782b52
00782ae4  3bc3                             cmp      eax, ebx
00782ae6  0f8509ffffff                     jne      0x7829f5
00782aec  41397cd104                       cmp      dword ptr [r9 + rdx*8 + 4], edi
00782af1  0f84fefeffff                     je       0x7829f5
00782af7  440fafdb                         imul     r11d, ebx
00782afb  418d50ff                         lea      edx, [r8 - 1]
00782aff  90                               nop      
00782b00  8bc2                             mov      eax, edx
00782b02  438d0c1c                         lea      ecx, [r12 + r11]
00782b06  4823c8                           and      rcx, rax
00782b09  418b04c9                         mov      eax, dword ptr [r9 + rcx*8]
00782b0d  413bc2                           cmp      eax, r10d
00782b10  741c                             je       0x782b2e
00782b12  3bc3                             cmp      eax, ebx
00782b14  741c                             je       0x782b32
00782b16  41ffc4                           inc      r12d
00782b19  453be0                           cmp      r12d, r8d
00782b1c  72e2                             jb       0x782b00
00782b1e  8b842488000000                   mov      eax, dword ptr [rsp + 0x88]
00782b25  89842488000000                   mov      dword ptr [rsp + 0x88], eax
00782b2c  eb09                             jmp      0x782b37
00782b2e  3bc3                             cmp      eax, ebx
00782b30  7505                             jne      0x782b37
00782b32  418b7cc904                       mov      edi, dword ptr [r9 + rcx*8 + 4]
00782b37  488b4d50                         mov      rcx, qword ptr [rbp + 0x50]
00782b3b  8bd7                             mov      edx, edi
00782b3d  4c8d0452                         lea      r8, [rdx + rdx*2]
00782b41  42832c8101                       sub      dword ptr [rcx + r8*4], 1
00782b46  488b4538                         mov      rax, qword ptr [rbp + 0x38]
00782b4a  488b0cd0                         mov      rcx, qword ptr [rax + rdx*8]
00782b4e  488b4550                         mov      rax, qword ptr [rbp + 0x50]
00782b52  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
00782b55  4e8d0480                         lea      r8, [rax + r8*4]
00782b59  ba8b9164ec                       mov      edx, 0xec64918b
00782b5e  0f94c3                           sete     bl
00782b61  e81a6c6e00                       call     0xe69780
00782b66  84db                             test     bl, bl
00782b68  0f845c010000                     je       0x782cca
00782b6e  e9af000000                       jmp      0x782c22
00782b73  3bc3                             cmp      eax, ebx
00782b75  0f854f010000                     jne      0x782cca
00782b7b  41397cd204                       cmp      dword ptr [r10 + rdx*8 + 4], edi
00782b80  0f8444010000                     je       0x782cca
00782b86  488b442428                       mov      rax, qword ptr [rsp + 0x28]
00782b8b  488b4838                         mov      rcx, qword ptr [rax + 0x38]
00782b8f  488b442430                       mov      rax, qword ptr [rsp + 0x30]
00782b94  488b0cc1                         mov      rcx, qword ptr [rcx + rax*8]
00782b98  e84336d8ff                       call     0x5061e0
00782b9d  8b5630                           mov      edx, dword ptr [rsi + 0x30]
00782ba0  488be8                           mov      rbp, rax
00782ba3  448b4e38                         mov      r9d, dword ptr [rsi + 0x38]
00782ba7  440fafcb                         imul     r9d, ebx
00782bab  448d5aff                         lea      r11d, [rdx - 1]
00782baf  85d2                             test     edx, edx
00782bb1  7437                             je       0x782bea
00782bb3  4c8b4628                         mov      r8, qword ptr [rsi + 0x28]
00782bb7  448b5634                         mov      r10d, dword ptr [rsi + 0x34]
00782bbb  0f1f440000                       nop      dword ptr [rax + rax]
00782bc0  418bc3                           mov      eax, r11d
00782bc3  438d0c0c                         lea      ecx, [r12 + r9]
00782bc7  4823c8                           and      rcx, rax
00782bca  418b04c8                         mov      eax, dword ptr [r8 + rcx*8]
00782bce  413bc2                           cmp      eax, r10d
00782bd1  740e                             je       0x782be1
00782bd3  3bc3                             cmp      eax, ebx
00782bd5  740e                             je       0x782be5
00782bd7  41ffc4                           inc      r12d
00782bda  443be2                           cmp      r12d, edx
00782bdd  72e1                             jb       0x782bc0
00782bdf  eb09                             jmp      0x782bea
00782be1  3bc3                             cmp      eax, ebx
00782be3  7505                             jne      0x782bea
00782be5  418b7cc804                       mov      edi, dword ptr [r8 + rcx*8 + 4]
00782bea  488b4658                         mov      rax, qword ptr [rsi + 0x58]
00782bee  8bd7                             mov      edx, edi
00782bf0  488d0c92                         lea      rcx, [rdx + rdx*4]
00782bf4  8b1c88                           mov      ebx, dword ptr [rax + rcx*4]
00782bf7  2b5d5c                           sub      ebx, dword ptr [rbp + 0x5c]
00782bfa  891c88                           mov      dword ptr [rax + rcx*4], ebx
00782bfd  488b4658                         mov      rax, qword ptr [rsi + 0x58]
00782c01  4c8d0488                         lea      r8, [rax + rcx*4]
00782c05  488b4640                         mov      rax, qword ptr [rsi + 0x40]
00782c09  488b0cd0                         mov      rcx, qword ptr [rax + rdx*8]
00782c0d  ba36c3349a                       mov      edx, 0x9a34c336
00782c12  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
00782c15  e8666b6e00                       call     0xe69780
00782c1a  85db                             test     ebx, ebx
00782c1c  0f85a8000000                     jne      0x782cca
00782c22  488b3defe95502                   mov      rdi, qword ptr [rip + 0x255e9ef]
00782c29  8b1db5c46b02                     mov      ebx, dword ptr [rip + 0x26bc4b5]
00782c2f  83bf8800000000                   cmp      dword ptr [rdi + 0x88], 0
00782c36  7415                             je       0x782c4d
00782c38  8b97a8030000                     mov      edx, dword ptr [rdi + 0x3a8]
00782c3e  488d8c2480000000                 lea      rcx, [rsp + 0x80]
00782c46  e8f56e6e00                       call     0xe69b40
00782c4b  eb0f                             jmp      0x782c5c
00782c4d  899c2480000000                   mov      dword ptr [rsp + 0x80], ebx
00782c54  488d842480000000                 lea      rax, [rsp + 0x80]
00782c5c  443b38                           cmp      r15d, dword ptr [rax]
00782c5f  7569                             jne      0x782cca
00782c61  83bf8800000000                   cmp      dword ptr [rdi + 0x88], 0
00782c68  740d                             je       0x782c77
00782c6a  488b87e8000000                   mov      rax, qword ptr [rdi + 0xe8]
00782c71  4883c008                         add      rax, 8
00782c75  eb07                             jmp      0x782c7e
00782c77  488d0566c46b02                   lea      rax, [rip + 0x26bc466]
00782c7e  8b10                             mov      edx, dword ptr [rax]
00782c80  3bd3                             cmp      edx, ebx
00782c82  7432                             je       0x782cb6
00782c84  e8d7d1e8ff                       call     0x60fe60
00782c89  488b0df0eb5502                   mov      rcx, qword ptr [rip + 0x255ebf0]
00782c90  488bd0                           mov      rdx, rax
00782c93  41b822000000                     mov      r8d, 0x22
00782c99  e8127cefff                       call     0x67a8b0
00782c9e  84c0                             test     al, al
00782ca0  740e                             je       0x782cb0
00782ca2  448b053bc46b02                   mov      r8d, dword ptr [rip + 0x26bc43b]
00782ca9  badf3ec23f                       mov      edx, 0x3fc23edf
00782cae  eb0e                             jmp      0x782cbe
00782cb0  8b1d2ec46b02                     mov      ebx, dword ptr [rip + 0x26bc42e]
00782cb6  448bc3                           mov      r8d, ebx
00782cb9  bab7e4b7df                       mov      edx, 0xdfb7e4b7
00782cbe  488b0da35a6a02                   mov      rcx, qword ptr [rip + 0x26a5aa3]
00782cc5  e826c9a900                       call     0x121f5f0
00782cca  8b942488000000                   mov      edx, dword ptr [rsp + 0x88]
00782cd1  49c7c0feffffff                   mov      r8, 0xfffffffffffffffe
00782cd8  488b4c2428                       mov      rcx, qword ptr [rsp + 0x28]
00782cdd  e8ced1ffff                       call     0x77feb0
00782ce2  4c8b742440                       mov      r14, qword ptr [rsp + 0x40]
00782ce7  488bac2490000000                 mov      rbp, qword ptr [rsp + 0x90]
00782cef  4c8b6c2448                       mov      r13, qword ptr [rsp + 0x48]
00782cf4  488b7c2458                       mov      rdi, qword ptr [rsp + 0x58]
00782cf9  4c8b642450                       mov      r12, qword ptr [rsp + 0x50]
00782cfe  4883c460                         add      rsp, 0x60
00782d02  415f                             pop      r15
00782d04  5e                               pop      rsi
00782d05  5b                               pop      rbx
00782d06  c3                               ret      
