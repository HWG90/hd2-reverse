0074fbf0  48894c2408                       mov      qword ptr [rsp + 8], rcx
0074fbf5  53                               push     rbx
0074fbf6  55                               push     rbp
0074fbf7  56                               push     rsi
0074fbf8  57                               push     rdi
0074fbf9  4155                             push     r13
0074fbfb  4157                             push     r15
0074fbfd  4883ec38                         sub      rsp, 0x38
0074fc01  8b3dc9f46e02                     mov      edi, dword ptr [rip + 0x26ef4c9]
0074fc07  4533ff                           xor      r15d, r15d
0074fc0a  4c8b2dff1b5902                   mov      r13, qword ptr [rip + 0x2591bff]
0074fc11  8bda                             mov      ebx, edx
0074fc13  3bd7                             cmp      edx, edi
0074fc15  7451                             je       0x74fc68
0074fc17  458b4530                         mov      r8d, dword ptr [r13 + 0x30]
0074fc1b  418bd7                           mov      edx, r15d
0074fc1e  458b5538                         mov      r10d, dword ptr [r13 + 0x38]
0074fc22  440fafd3                         imul     r10d, ebx
0074fc26  418d68ff                         lea      ebp, [r8 - 1]
0074fc2a  4585c0                           test     r8d, r8d
0074fc2d  7439                             je       0x74fc68
0074fc2f  4d8b5d28                         mov      r11, qword ptr [r13 + 0x28]
0074fc33  418b7534                         mov      esi, dword ptr [r13 + 0x34]
0074fc37  660f1f840000000000               nop      word ptr [rax + rax]
0074fc40  8bc5                             mov      eax, ebp
0074fc42  428d0c12                         lea      ecx, [rdx + r10]
0074fc46  4823c8                           and      rcx, rax
0074fc49  418b04cb                         mov      eax, dword ptr [r11 + rcx*8]
0074fc4d  4d8d0ccb                         lea      r9, [r11 + rcx*8]
0074fc51  3bc6                             cmp      eax, esi
0074fc53  0f84e1000000                     je       0x74fd3a
0074fc59  3bc3                             cmp      eax, ebx
0074fc5b  0f84e1000000                     je       0x74fd42
0074fc61  ffc2                             inc      edx
0074fc63  413bd0                           cmp      edx, r8d
0074fc66  72d8                             jb       0x74fc40
0074fc68  beffffffff                       mov      esi, 0xffffffff
0074fc6d  8bc6                             mov      eax, esi
0074fc6f  4889442420                       mov      qword ptr [rsp + 0x20], rax
0074fc74  4c89642478                       mov      qword ptr [rsp + 0x78], r12
0074fc79  4c89742430                       mov      qword ptr [rsp + 0x30], r14
0074fc7e  488d0c80                         lea      rcx, [rax + rax*4]
0074fc82  498b4550                         mov      rax, qword ptr [r13 + 0x50]
0074fc86  488d04c8                         lea      rax, [rax + rcx*8]
0074fc8a  4889442470                       mov      qword ptr [rsp + 0x70], rax
0074fc8f  8b00                             mov      eax, dword ptr [rax]
0074fc91  84c0                             test     al, al
0074fc93  0f895d010000                     jns      0x74fdf6
0074fc99  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074fc9d  448be6                           mov      r12d, esi
0074fca0  4e8b24e0                         mov      r12, qword ptr [rax + r12*8]
0074fca4  498bcc                           mov      rcx, r12
0074fca7  e8f4bddaff                       call     0x4fbaa0
0074fcac  488b2d451b5902                   mov      rbp, qword ptr [rip + 0x2591b45]
0074fcb3  4c8bf8                           mov      r15, rax
0074fcb6  3bdf                             cmp      ebx, edi
0074fcb8  7447                             je       0x74fd01
0074fcba  448b4528                         mov      r8d, dword ptr [rbp + 0x28]
0074fcbe  33d2                             xor      edx, edx
0074fcc0  448b5530                         mov      r10d, dword ptr [rbp + 0x30]
0074fcc4  440fafd3                         imul     r10d, ebx
0074fcc8  458d70ff                         lea      r14d, [r8 - 1]
0074fccc  4585c0                           test     r8d, r8d
0074fccf  7430                             je       0x74fd01
0074fcd1  4c8b5d20                         mov      r11, qword ptr [rbp + 0x20]
0074fcd5  8b7d2c                           mov      edi, dword ptr [rbp + 0x2c]
0074fcd8  0f1f840000000000                 nop      dword ptr [rax + rax]
0074fce0  418bc6                           mov      eax, r14d
0074fce3  428d0c12                         lea      ecx, [rdx + r10]
0074fce7  4823c8                           and      rcx, rax
0074fcea  418b04cb                         mov      eax, dword ptr [r11 + rcx*8]
0074fcee  4d8d0ccb                         lea      r9, [r11 + rcx*8]
0074fcf2  3bc7                             cmp      eax, edi
0074fcf4  7455                             je       0x74fd4b
0074fcf6  3bc3                             cmp      eax, ebx
0074fcf8  7455                             je       0x74fd4f
0074fcfa  ffc2                             inc      edx
0074fcfc  413bd0                           cmp      edx, r8d
0074fcff  72df                             jb       0x74fce0
0074fd01  b9ffffffff                       mov      ecx, 0xffffffff
0074fd06  8bf9                             mov      edi, ecx
0074fd08  448bf1                           mov      r14d, ecx
0074fd0b  498bcc                           mov      rcx, r12
0074fd0e  48c1e704                         shl      rdi, 4
0074fd12  48037d48                         add      rdi, qword ptr [rbp + 0x48]
0074fd16  e845dbdcff                       call     0x51d860
0074fd1b  4180bf9c00000000                 cmp      byte ptr [r15 + 0x9c], 0
0074fd23  488bc8                           mov      rcx, rax
0074fd26  743f                             je       0x74fd67
0074fd28  8b07                             mov      eax, dword ptr [rdi]
0074fd2a  85c0                             test     eax, eax
0074fd2c  7439                             je       0x74fd67
0074fd2e  837f0400                         cmp      dword ptr [rdi + 4], 0
0074fd32  7521                             jne      0x74fd55
0074fd34  8b01                             mov      eax, dword ptr [rcx]
0074fd36  32d2                             xor      dl, dl
0074fd38  eb31                             jmp      0x74fd6b
0074fd3a  3bc3                             cmp      eax, ebx
0074fd3c  0f8526ffffff                     jne      0x74fc68
0074fd42  418b7104                         mov      esi, dword ptr [r9 + 4]
0074fd46  e922ffffff                       jmp      0x74fc6d
0074fd4b  3bc3                             cmp      eax, ebx
0074fd4d  75b2                             jne      0x74fd01
0074fd4f  418b4904                         mov      ecx, dword ptr [r9 + 4]
0074fd53  ebb1                             jmp      0x74fd06
0074fd55  ffc8                             dec      eax
0074fd57  99                               cdq      
0074fd58  f77f0c                           idiv     dword ptr [rdi + 0xc]
0074fd5b  4863c2                           movsxd   rax, edx
0074fd5e  32d2                             xor      dl, dl
0074fd60  418b448704                       mov      eax, dword ptr [r15 + rax*4 + 4]
0074fd65  eb04                             jmp      0x74fd6b
0074fd67  b201                             mov      dl, 1
0074fd69  33c0                             xor      eax, eax
0074fd6b  894708                           mov      dword ptr [rdi + 8], eax
0074fd6e  4180bf9c00000000                 cmp      byte ptr [r15 + 0x9c], 0
0074fd76  7404                             je       0x74fd7c
0074fd78  85c0                             test     eax, eax
0074fd7a  7402                             je       0x74fd7e
0074fd7c  ff0f                             dec      dword ptr [rdi]
0074fd7e  83feff                           cmp      esi, -1
0074fd81  0f8471020000                     je       0x74fff8
0074fd87  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074fd8b  8bce                             mov      ecx, esi
0074fd8d  488b0cc8                         mov      rcx, qword ptr [rax + rcx*8]
0074fd91  f6411401                         test     byte ptr [rcx + 0x14], 1
0074fd95  0f845d020000                     je       0x74fff8
0074fd9b  4180bf9c00000000                 cmp      byte ptr [r15 + 0x9c], 0
0074fda3  7439                             je       0x74fdde
0074fda5  84d2                             test     dl, dl
0074fda7  7435                             je       0x74fdde
0074fda9  4b8d0476                         lea      rax, [r14 + r14*2]
0074fdad  ba743e894a                       mov      edx, 0x4a893e74
0074fdb2  488d0c8500000000                 lea      rcx, [rax*4]
0074fdba  488b4550                         mov      rax, qword ptr [rbp + 0x50]
0074fdbe  c644010801                       mov      byte ptr [rcx + rax + 8], 1
0074fdc3  4c8b4550                         mov      r8, qword ptr [rbp + 0x50]
0074fdc7  488b4538                         mov      rax, qword ptr [rbp + 0x38]
0074fdcb  4983c008                         add      r8, 8
0074fdcf  4c03c1                           add      r8, rcx
0074fdd2  4a8b0cf0                         mov      rcx, qword ptr [rax + r14*8]
0074fdd6  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
0074fdd9  e8a2997100                       call     0xe69780
0074fdde  448b07                           mov      r8d, dword ptr [rdi]
0074fde1  8bd3                             mov      edx, ebx
0074fde3  e8d89a0200                       call     0x7798c0
0074fde8  488b442470                       mov      rax, qword ptr [rsp + 0x70]
0074fded  c6402000                         mov      byte ptr [rax + 0x20], 0
0074fdf1  e902020000                       jmp      0x74fff8
0074fdf6  0fbae008                         bt       eax, 8
0074fdfa  0f83be010000                     jae      0x74ffbe
0074fe00  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074fe04  8bce                             mov      ecx, esi
0074fe06  488b04c8                         mov      rax, qword ptr [rax + rcx*8]
0074fe0a  488bc8                           mov      rcx, rax
0074fe0d  4889842480000000                 mov      qword ptr [rsp + 0x80], rax
0074fe15  e8c663dbff                       call     0x5061e0
0074fe1a  488b2d8f205902                   mov      rbp, qword ptr [rip + 0x259208f]
0074fe21  4889842488000000                 mov      qword ptr [rsp + 0x88], rax
0074fe29  3bdf                             cmp      ebx, edi
0074fe2b  744c                             je       0x74fe79
0074fe2d  448b4530                         mov      r8d, dword ptr [rbp + 0x30]
0074fe31  418bd7                           mov      edx, r15d
0074fe34  448b5538                         mov      r10d, dword ptr [rbp + 0x38]
0074fe38  440fafd3                         imul     r10d, ebx
0074fe3c  458d70ff                         lea      r14d, [r8 - 1]
0074fe40  4585c0                           test     r8d, r8d
0074fe43  7434                             je       0x74fe79
0074fe45  4c8b5d28                         mov      r11, qword ptr [rbp + 0x28]
0074fe49  8b7d34                           mov      edi, dword ptr [rbp + 0x34]
0074fe4c  0f1f4000                         nop      dword ptr [rax]
0074fe50  418bc6                           mov      eax, r14d
0074fe53  428d0c12                         lea      ecx, [rdx + r10]
0074fe57  4823c8                           and      rcx, rax
0074fe5a  418b04cb                         mov      eax, dword ptr [r11 + rcx*8]
0074fe5e  4d8d0ccb                         lea      r9, [r11 + rcx*8]
0074fe62  3bc7                             cmp      eax, edi
0074fe64  0f84ad000000                     je       0x74ff17
0074fe6a  3bc3                             cmp      eax, ebx
0074fe6c  0f84ad000000                     je       0x74ff1f
0074fe72  ffc2                             inc      edx
0074fe74  413bd0                           cmp      edx, r8d
0074fe77  72d7                             jb       0x74fe50
0074fe79  b9ffffffff                       mov      ecx, 0xffffffff
0074fe7e  488b4550                         mov      rax, qword ptr [rbp + 0x50]
0074fe82  4c8b7558                         mov      r14, qword ptr [rbp + 0x58]
0074fe86  448be1                           mov      r12d, ecx
0074fe89  4b8d0c64                         lea      rcx, [r12 + r12*2]
0074fe8d  488d3cc8                         lea      rdi, [rax + rcx*8]
0074fe91  4b8d04a4                         lea      rax, [r12 + r12*4]
0074fe95  4c8d048500000000                 lea      r8, [rax*4]
0074fe9d  4d03f0                           add      r14, r8
0074fea0  4c89442470                       mov      qword ptr [rsp + 0x70], r8
0074fea5  83feff                           cmp      esi, -1
0074fea8  7440                             je       0x74feea
0074feaa  488b842480000000                 mov      rax, qword ptr [rsp + 0x80]
0074feb2  f6401401                         test     byte ptr [rax + 0x14], 1
0074feb6  7432                             je       0x74feea
0074feb8  8bd3                             mov      edx, ebx
0074feba  488bcd                           mov      rcx, rbp
0074febd  e8fe6c0300                       call     0x786bc0
0074fec2  84c0                             test     al, al
0074fec4  741f                             je       0x74fee5
0074fec6  49634604                         movsxd   rax, dword ptr [r14 + 4]
0074feca  837c870400                       cmp      dword ptr [rdi + rax*4 + 4], 0
0074fecf  7514                             jne      0x74fee5
0074fed1  8b4708                           mov      eax, dword ptr [rdi + 8]
0074fed4  41b801000000                     mov      r8d, 1
0074feda  034704                           add      eax, dword ptr [rdi + 4]
0074fedd  450fb6ff                         movzx    r15d, r15b
0074fee1  450f45f8                         cmovne   r15d, r8d
0074fee5  4c8b442470                       mov      r8, qword ptr [rsp + 0x70]
0074feea  488b942488000000                 mov      rdx, qword ptr [rsp + 0x88]
0074fef2  807a6800                         cmp      byte ptr [rdx + 0x68], 0
0074fef6  7438                             je       0x74ff30
0074fef8  49634e04                         movsxd   rcx, dword ptr [r14 + 4]
0074fefc  837c8f0400                       cmp      dword ptr [rdi + rcx*4 + 4], 0
0074ff01  742d                             je       0x74ff30
0074ff03  4532c9                           xor      r9b, r9b
0074ff06  85c9                             test     ecx, ecx
0074ff08  741e                             je       0x74ff28
0074ff0a  83f901                           cmp      ecx, 1
0074ff0d  752b                             jne      0x74ff3a
0074ff0f  8b4244                           mov      eax, dword ptr [rdx + 0x44]
0074ff12  894710                           mov      dword ptr [rdi + 0x10], eax
0074ff15  eb23                             jmp      0x74ff3a
0074ff17  3bc3                             cmp      eax, ebx
0074ff19  0f855affffff                     jne      0x74fe79
0074ff1f  418b4904                         mov      ecx, dword ptr [r9 + 4]
0074ff23  e956ffffff                       jmp      0x74fe7e
0074ff28  8b4240                           mov      eax, dword ptr [rdx + 0x40]
0074ff2b  894710                           mov      dword ptr [rdi + 0x10], eax
0074ff2e  eb0a                             jmp      0x74ff3a
0074ff30  c7471000000000                   mov      dword ptr [rdi + 0x10], 0
0074ff37  41b101                           mov      r9b, 1
0074ff3a  807a6800                         cmp      byte ptr [rdx + 0x68], 0
0074ff3e  7406                             je       0x74ff46
0074ff40  837f1000                         cmp      dword ptr [rdi + 0x10], 0
0074ff44  7408                             je       0x74ff4e
0074ff46  49634604                         movsxd   rax, dword ptr [r14 + 4]
0074ff4a  ff4c8704                         dec      dword ptr [rdi + rax*4 + 4]
0074ff4e  83feff                           cmp      esi, -1
0074ff51  0f84a1000000                     je       0x74fff8
0074ff57  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074ff5b  8bce                             mov      ecx, esi
0074ff5d  488b0cc8                         mov      rcx, qword ptr [rax + rcx*8]
0074ff61  f6411401                         test     byte ptr [rcx + 0x14], 1
0074ff65  0f848d000000                     je       0x74fff8
0074ff6b  807a6800                         cmp      byte ptr [rdx + 0x68], 0
0074ff6f  742f                             je       0x74ffa0
0074ff71  4584c9                           test     r9b, r9b
0074ff74  742a                             je       0x74ffa0
0074ff76  488b4558                         mov      rax, qword ptr [rbp + 0x58]
0074ff7a  ba743e894a                       mov      edx, 0x4a893e74
0074ff7f  41c644001001                     mov      byte ptr [r8 + rax + 0x10], 1
0074ff85  488b4558                         mov      rax, qword ptr [rbp + 0x58]
0074ff89  4883c010                         add      rax, 0x10
0074ff8d  4c03c0                           add      r8, rax
0074ff90  488b4540                         mov      rax, qword ptr [rbp + 0x40]
0074ff94  4a8b0ce0                         mov      rcx, qword ptr [rax + r12*8]
0074ff98  8b4910                           mov      ecx, dword ptr [rcx + 0x10]
0074ff9b  e8e0977100                       call     0xe69780
0074ffa0  49634604                         movsxd   rax, dword ptr [r14 + 4]
0074ffa4  8bd3                             mov      edx, ebx
0074ffa6  448b448704                       mov      r8d, dword ptr [rdi + rax*4 + 4]
0074ffab  e8b05e0300                       call     0x785e60
0074ffb0  4584ff                           test     r15b, r15b
0074ffb3  7443                             je       0x74fff8
0074ffb5  8bd3                             mov      edx, ebx
0074ffb7  e8a4550300                       call     0x785560
0074ffbc  eb3a                             jmp      0x74fff8
0074ffbe  0fbae00a                         bt       eax, 0xa
0074ffc2  7334                             jae      0x74fff8
0074ffc4  83feff                           cmp      esi, -1
0074ffc7  742f                             je       0x74fff8
0074ffc9  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074ffcd  8bce                             mov      ecx, esi
0074ffcf  488b0cc8                         mov      rcx, qword ptr [rax + rcx*8]
0074ffd3  f6411401                         test     byte ptr [rcx + 0x14], 1
0074ffd7  741f                             je       0x74fff8
0074ffd9  488b0d801c5902                   mov      rcx, qword ptr [rip + 0x2591c80]
0074ffe0  8bd3                             mov      edx, ebx
0074ffe2  e869dc0200                       call     0x77dc50
0074ffe7  85c0                             test     eax, eax
0074ffe9  740d                             je       0x74fff8
0074ffeb  41b801000000                     mov      r8d, 1
0074fff1  8bd3                             mov      edx, ebx
0074fff3  e818db0200                       call     0x77db10
0074fff8  498b4540                         mov      rax, qword ptr [r13 + 0x40]
0074fffc  4533c9                           xor      r9d, r9d
0074ffff  488b4c2420                       mov      rcx, qword ptr [rsp + 0x20]
00750004  41b86e992b07                     mov      r8d, 0x72b996e
0075000a  488b0cc8                         mov      rcx, qword ptr [rax + rcx*8]
0075000e  8b5108                           mov      edx, dword ptr [rcx + 8]
00750011  8b490c                           mov      ecx, dword ptr [rcx + 0xc]
00750014  4c8b742430                       mov      r14, qword ptr [rsp + 0x30]
00750019  4c8b642478                       mov      r12, qword ptr [rsp + 0x78]
0075001e  4883c438                         add      rsp, 0x38
00750022  415f                             pop      r15
00750024  415d                             pop      r13
00750026  5f                               pop      rdi
00750027  5e                               pop      rsi
00750028  5d                               pop      rbp
00750029  5b                               pop      rbx
0075002a  e9c1dc7100                       jmp      0xe6dcf0
