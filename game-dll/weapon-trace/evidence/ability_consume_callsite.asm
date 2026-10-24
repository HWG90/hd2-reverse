007e2253  41807c242000                     cmp      byte ptr [r12 + 0x20], 0
007e2259  0f28742430                       movaps   xmm6, xmmword ptr [rsp + 0x30]
007e225e  4c8b6c2450                       mov      r13, qword ptr [rsp + 0x50]
007e2263  488b9c2488000000                 mov      rbx, qword ptr [rsp + 0x88]
007e226b  7435                             je       0x7e22a2
007e226d  4084ed                           test     bpl, bpl
007e2270  7430                             je       0x7e22a2
007e2272  488b0d97f54f02                   mov      rcx, qword ptr [rip + 0x24ff597]
007e2279  8bd6                             mov      edx, esi
007e227b  e870d9f6ff                       call     0x74fbf0
007e2280  488b0d89f54f02                   mov      rcx, qword ptr [rip + 0x24ff589]
007e2287  8bd6                             mov      edx, esi
007e2289  e862cef6ff                       call     0x74f0f0
007e228e  488b0d0bfc4f02                   mov      rcx, qword ptr [rip + 0x24ffc0b]
007e2295  41b101                           mov      r9b, 1
007e2298  448bc0                           mov      r8d, eax
007e229b  8bd6                             mov      edx, esi
007e229d  e88ec8f7ff                       call     0x75eb30
