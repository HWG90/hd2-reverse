00313780 448b4158                         mov      r8d, dword ptr [rcx + 0x58]
00313784 33c0                             xor      eax, eax
00313786 4585c0                           test     r8d, r8d
00313789 7412                             je       0x14031379d
0031378b 4c8b4960                         mov      r9, qword ptr [rcx + 0x60]
0031378f 90                               nop      
00313790 413b1481                         cmp      edx, dword ptr [r9 + rax*4]
00313794 740c                             je       0x1403137a2
00313796 ffc0                             inc      eax
00313798 413bc0                           cmp      eax, r8d
0031379b 72f3                             jb       0x140313790
0031379d b8ffffffff                       mov      eax, 0xffffffff
003137a2 c3                               ret      
