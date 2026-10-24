001f6bc0 48895c2408                       mov      qword ptr [rsp + 8], rbx
001f6bc5 57                               push     rdi
001f6bc6 4883ec20                         sub      rsp, 0x20
001f6bca 8bfa                             mov      edi, edx
001f6bcc e8df9aeaff                       call     0x1400a06b0
001f6bd1 488bc8                           mov      rcx, rax
001f6bd4 488bd8                           mov      rbx, rax
001f6bd7 4c8b00                           mov      r8, qword ptr [rax]
001f6bda 41ff90f8000000                   call     qword ptr [r8 + 0xf8]
001f6be1 4c8b03                           mov      r8, qword ptr [rbx]
001f6be4 8bd7                             mov      edx, edi
001f6be6 488bcb                           mov      rcx, rbx
001f6be9 488b5c2430                       mov      rbx, qword ptr [rsp + 0x30]
001f6bee 4883c420                         add      rsp, 0x20
001f6bf2 5f                               pop      rdi
001f6bf3 49ffa008010000                   jmp      qword ptr [r8 + 0x108]
