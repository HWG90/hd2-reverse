001f50e0 48895c2408                       mov      qword ptr [rsp + 8], rbx
001f50e5 57                               push     rdi
001f50e6 4883ec20                         sub      rsp, 0x20
001f50ea 498bd8                           mov      rbx, r8
001f50ed 8bfa                             mov      edi, edx
001f50ef e8bcb5eaff                       call     0x1400a06b0
001f50f4 4c8bcb                           mov      r9, rbx
001f50f7 488d542440                       lea      rdx, [rsp + 0x40]
001f50fc 448bc7                           mov      r8d, edi
001f50ff 488bc8                           mov      rcx, rax
001f5102 4c8b10                           mov      r10, qword ptr [rax]
001f5105 41ff9200020000                   call     qword ptr [r10 + 0x200]
001f510c 488b5c2430                       mov      rbx, qword ptr [rsp + 0x30]
001f5111 488b00                           mov      rax, qword ptr [rax]
001f5114 4883c420                         add      rsp, 0x20
001f5118 5f                               pop      rdi
001f5119 c3                               ret      
