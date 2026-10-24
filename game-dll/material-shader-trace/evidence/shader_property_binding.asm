01991912  4c89642460                       mov      qword ptr [rsp + 0x60], r12
01991917  4c897c2448                       mov      qword ptr [rsp + 0x48], r15
0199191c  4c8b7b18                         mov      r15, qword ptr [rbx + 0x18]
01991920  e81b300300                       call     0x19c4940
01991925  b908000000                       mov      ecx, 8
0199192a  4c8be0                           mov      r12, rax
0199192d  e8f6eb5700                       call     0x1f10528
01991932  488b0d7f9d4b01                   mov      rcx, qword ptr [rip + 0x14b9d7f]
01991939  4c8bf0                           mov      r14, rax
0199193c  488d0545457f00                   lea      rax, [rip + 0x7f4545]
01991943  ba60000000                       mov      edx, 0x60
01991948  498906                           mov      qword ptr [r14], rax
0199194b  ff151f673401                     call     qword ptr [rip + 0x134671f]
01991951  488bf8                           mov      rdi, rax
01991954  4885c0                           test     rax, rax
01991957  0f8493000000                     je       0x19919f0
0199195d  488d0dc01b8100                   lea      rcx, [rip + 0x811bc0]
01991964  e8f7f9feff                       call     0x1981360
01991969  4c896f08                         mov      qword ptr [rdi + 8], r13
0199196d  488d0d1c698100                   lea      rcx, [rip + 0x81691c]
01991974  c7471401000000                   mov      dword ptr [rdi + 0x14], 1
0199197b  4c8bc6                           mov      r8, rsi
0199197e  4c897f20                         mov      qword ptr [rdi + 0x20], r15
01991982  816754000000ff                   and      dword ptr [rdi + 0x54], 0xff000000
01991989  44896f50                         mov      dword ptr [rdi + 0x50], r13d
0199198d  c6475701                         mov      byte ptr [rdi + 0x57], 1
01991991  48890f                           mov      qword ptr [rdi], rcx
01991994  488d4f58                         lea      rcx, [rdi + 0x58]
01991998  48894f48                         mov      qword ptr [rdi + 0x48], rcx
0199199c  488bcf                           mov      rcx, rdi
0199199f  488b5720                         mov      rdx, qword ptr [rdi + 0x20]
019919a3  44896f10                         mov      dword ptr [rdi + 0x10], r13d
019919a7  4c896718                         mov      qword ptr [rdi + 0x18], r12
019919ab  4c897728                         mov      qword ptr [rdi + 0x28], r14
019919af  4c896f30                         mov      qword ptr [rdi + 0x30], r13
019919b3  4c896f38                         mov      qword ptr [rdi + 0x38], r13
019919b7  4c896f40                         mov      qword ptr [rdi + 0x40], r13
019919bb  894758                           mov      dword ptr [rdi + 0x58], eax
019919be  44886f5c                         mov      byte ptr [rdi + 0x5c], r13b
019919c2  e8e9460400                       call     0x19d60b0
019919c7  488bd7                           mov      rdx, rdi
019919ca  488bcb                           mov      rcx, rbx
