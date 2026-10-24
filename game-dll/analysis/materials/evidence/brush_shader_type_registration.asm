019c4940  4883ec28                         sub      rsp, 0x28
019c4944  488b05e5cd7c01                   mov      rax, qword ptr [rip + 0x17ccde5]
019c494b  4885c0                           test     rax, rax
019c494e  7521                             jne      0x19c4971
019c4950  4c8d0579010000                   lea      r8, [rip + 0x179]
019c4957  488d15d2000000                   lea      rdx, [rip + 0xd2]
019c495e  488d0df31f7e00                   lea      rcx, [rip + 0x7e1ff3]
019c4965  e8964afaff                       call     0x1969400
019c496a  488905bfcd7c01                   mov      qword ptr [rip + 0x17ccdbf], rax
019c4971  4883c428                         add      rsp, 0x28
019c4975  c3                               ret      
