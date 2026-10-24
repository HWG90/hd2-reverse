01a2e270  4883ec28                         sub      rsp, 0x28
01a2e274  488b0505377601                   mov      rax, qword ptr [rip + 0x1763705]
01a2e27b  4885c0                           test     rax, rax
01a2e27e  7521                             jne      0x1a2e2a1
01a2e280  4c8d0549010000                   lea      r8, [rip + 0x149]
01a2e287  488d15a2000000                   lea      rdx, [rip + 0xa2]
01a2e28e  488d0d3bf47700                   lea      rcx, [rip + 0x77f43b]
01a2e295  e866b1f3ff                       call     0x1969400
01a2e29a  488905df367601                   mov      qword ptr [rip + 0x17636df], rax
01a2e2a1  4883c428                         add      rsp, 0x28
01a2e2a5  c3                               ret      
