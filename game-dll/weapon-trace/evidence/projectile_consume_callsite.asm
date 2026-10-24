0061dc76  8b442464                         mov      eax, dword ptr [rsp + 0x64]
0061dc7a  894590                           mov      dword ptr [rbp - 0x70], eax
0061dc7d  ffc8                             dec      eax
0061dc7f  89442464                         mov      dword ptr [rsp + 0x64], eax
0061dc83  488b442470                       mov      rax, qword ptr [rsp + 0x70]
0061dc88  80782400                         cmp      byte ptr [rax + 0x24], 0
0061dc8c  7514                             jne      0x61dca2
0061dc8e  488b442468                       mov      rax, qword ptr [rsp + 0x68]
0061dc93  488b0d763b6c02                   mov      rcx, qword ptr [rip + 0x26c3b76]
0061dc9a  8b5008                           mov      edx, dword ptr [rax + 8]
0061dc9d  e84e1f1300                       call     0x74fbf0
