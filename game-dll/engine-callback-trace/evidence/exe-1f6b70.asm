001f6b70 4883ec28                         sub      rsp, 0x28
001f6b74 e8379beaff                       call     0x1400a06b0
001f6b79 488bc8                           mov      rcx, rax
001f6b7c 488b10                           mov      rdx, qword ptr [rax]
001f6b7f 4883c428                         add      rsp, 0x28
001f6b83 48ffa2f8000000                   jmp      qword ptr [rdx + 0xf8]
