00669450 48895c2408                       mov      qword ptr [rsp + 8], rbx
00669455 57                               push     rdi
00669456 4883ec20                         sub      rsp, 0x20
0066945a 0fb601                           movzx    eax, byte ptr [rcx]
0066945d 33ff                             xor      edi, edi
0066945f 488bd9                           mov      rbx, rcx
00669462 84c0                             test     al, al
00669464 743e                             je       0x1406694a4
00669466 3c2e                             cmp      al, 0x2e
00669468 752f                             jne      0x140669499
0066946a 8bd3                             mov      edx, ebx
0066946c 4533c0                           xor      r8d, r8d
0066946f 2bd1                             sub      edx, ecx
00669471 e89abcfaff                       call     0x140615110
00669476 48c1e820                         shr      rax, 0x20
0066947a 69c895e9d15b                     imul     ecx, eax, 0x5bd1e995
00669480 69ff95e9d15b                     imul     edi, edi, 0x5bd1e995
00669486 8bc1                             mov      eax, ecx
00669488 c1e818                           shr      eax, 0x18
0066948b 33c1                             xor      eax, ecx
0066948d 69c895e9d15b                     imul     ecx, eax, 0x5bd1e995
00669493 33f9                             xor      edi, ecx
00669495 488d4b01                         lea      rcx, [rbx + 1]
00669499 0fb64301                         movzx    eax, byte ptr [rbx + 1]
0066949d 48ffc3                           inc      rbx
006694a0 84c0                             test     al, al
006694a2 75c2                             jne      0x140669466
006694a4 2bd9                             sub      ebx, ecx
006694a6 4533c0                           xor      r8d, r8d
006694a9 8bd3                             mov      edx, ebx
006694ab e860bcfaff                       call     0x140615110
006694b0 488b5c2430                       mov      rbx, qword ptr [rsp + 0x30]
006694b5 48c1e820                         shr      rax, 0x20
006694b9 69c895e9d15b                     imul     ecx, eax, 0x5bd1e995
006694bf 8bc1                             mov      eax, ecx
006694c1 c1e818                           shr      eax, 0x18
006694c4 33c1                             xor      eax, ecx
006694c6 69cf95e9d15b                     imul     ecx, edi, 0x5bd1e995
006694cc 69c095e9d15b                     imul     eax, eax, 0x5bd1e995
006694d2 33c1                             xor      eax, ecx
006694d4 4883c420                         add      rsp, 0x20
006694d8 5f                               pop      rdi
006694d9 c3                               ret      
