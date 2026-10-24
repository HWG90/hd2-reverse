009eb540  48895c2408                       mov      qword ptr [rsp + 8], rbx
009eb545  48896c2410                       mov      qword ptr [rsp + 0x10], rbp
009eb54a  4889742418                       mov      qword ptr [rsp + 0x18], rsi
009eb54f  48897c2420                       mov      qword ptr [rsp + 0x20], rdi
009eb554  4154                             push     r12
009eb556  4156                             push     r14
009eb558  4157                             push     r15
009eb55a  4883ec20                         sub      rsp, 0x20
009eb55e  4d8bf1                           mov      r14, r9
009eb561  418bd8                           mov      ebx, r8d
009eb564  8bfa                             mov      edi, edx
009eb566  4532ff                           xor      r15b, r15b
009eb569  41bc08000000                     mov      r12d, 8
009eb56f  90                               nop      
009eb570  498d7608                         lea      rsi, [r14 + 8]
009eb574  bd08000000                       mov      ebp, 8
009eb579  0f1f8000000000                   nop      dword ptr [rax]
009eb580  391e                             cmp      dword ptr [rsi], ebx
009eb582  7521                             jne      0x9eb5a5
009eb584  488b053d5f2f02                   mov      rax, qword ptr [rip + 0x22f5f3d]
009eb58b  4533c9                           xor      r9d, r9d
009eb58e  4c8b4608                         mov      r8, qword ptr [rsi + 8]
009eb592  8bcf                             mov      ecx, edi
009eb594  418b16                           mov      edx, dword ptr [r14]
009eb597  41b701                           mov      r15b, 1
009eb59a  4c8b5018                         mov      r10, qword ptr [rax + 0x18]
009eb59e  41ff9280010000                   call     qword ptr [r10 + 0x180]
009eb5a5  4883c610                         add      rsi, 0x10
009eb5a9  4883ed01                         sub      rbp, 1
009eb5ad  75d1                             jne      0x9eb580
009eb5af  4981c688000000                   add      r14, 0x88
009eb5b6  4983ec01                         sub      r12, 1
009eb5ba  75b4                             jne      0x9eb570
009eb5bc  488b5c2440                       mov      rbx, qword ptr [rsp + 0x40]
009eb5c1  410fb6c7                         movzx    eax, r15b
009eb5c5  488b6c2448                       mov      rbp, qword ptr [rsp + 0x48]
009eb5ca  488b742450                       mov      rsi, qword ptr [rsp + 0x50]
009eb5cf  488b7c2458                       mov      rdi, qword ptr [rsp + 0x58]
009eb5d4  4883c420                         add      rsp, 0x20
009eb5d8  415f                             pop      r15
009eb5da  415e                             pop      r14
009eb5dc  415c                             pop      r12
009eb5de  c3                               ret      
