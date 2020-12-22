.LC0:
        .string ""
.LC1:
        .string "\nArray of randomly generated numbers:"
.LC2:
        .string "Sorted array:"
main:
        push    rbp
        mov     rbp, rsp
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbx
        sub     rsp, 40
        mov     rax, rsp
        mov     rbx, rax
        mov     eax, OFFSET FLAT:.LC0
        mov     edi, eax
        call    srand
        mov     DWORD PTR [rbp-56], 10
        mov     eax, DWORD PTR [rbp-56]
        cdqe
        sub     rax, 1
        mov     QWORD PTR [rbp-64], rax
        mov     eax, DWORD PTR [rbp-56]
        cdqe
        mov     r14, rax
        mov     r15d, 0
        mov     eax, DWORD PTR [rbp-56]
        cdqe
        mov     r12, rax
        mov     r13d, 0
        mov     eax, DWORD PTR [rbp-56]
        cdqe
        lea     rdx, [0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     esi, 16
        mov     edx, 0
        div     rsi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR [rbp-72], rax
        mov     DWORD PTR [rbp-52], 0
        jmp     .L2
.L3:
        call    rand
        movsx   rdx, eax
        imul    rdx, rdx, 1374389535
        shr     rdx, 32
        sar     edx, 5
        mov     ecx, eax
        sar     ecx, 31
        sub     edx, ecx
        imul    ecx, edx, 100
        sub     eax, ecx
        mov     edx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     ecx, DWORD PTR [rbp-52]
        movsx   rcx, ecx
        mov     DWORD PTR [rax+rcx*4], edx
        add     DWORD PTR [rbp-52], 1
.L2:
        mov     eax, DWORD PTR [rbp-52]
        cmp     eax, DWORD PTR [rbp-56]
        jl      .L3
        mov     edi, OFFSET FLAT:.LC1
        call    puts
        mov     edx, DWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, edx
        mov     rdi, rax
        call    printArray
        mov     edx, DWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, edx
        mov     rdi, rax
        call    bubbleSort
        mov     QWORD PTR [rbp-80], rax
        mov     edi, OFFSET FLAT:.LC2
        call    puts
        mov     edx, DWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-80]
        mov     esi, edx
        mov     rdi, rax
        call    printArray
        mov     rsp, rbx
        nop
        lea     rsp, [rbp-40]
        pop     rbx
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        pop     rbp
        ret
bubbleSort:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     DWORD PTR [rbp-4], 1
        jmp     .L5
.L9:
        mov     eax, DWORD PTR [rbp-4]
        mov     DWORD PTR [rbp-8], eax
        jmp     .L6
.L8:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        sal     rax, 2
        lea     rdx, [rax-4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rcx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rcx
        mov     eax, DWORD PTR [rax]
        cmp     edx, eax
        jle     .L7
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        sal     rax, 2
        lea     rdx, [rax-4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-8]
        movsx   rdx, edx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        mov     eax, DWORD PTR [rbp-4]
        cdq
        sal     rax, 2
        lea     rdx, [rax-4]
        mov     rax, QWORD PTR [rbp-24]
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-12]
        mov     DWORD PTR [rdx], eax
.L7:
        add     DWORD PTR [rbp-8], 1
.L6:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L8
        add     DWORD PTR [rbp-4], 1
.L5:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L9
        mov     rax, QWORD PTR [rbp-24]
        pop     rbp
        ret
.LC3:
        .string "%d\n"
printArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L12
.L13:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    printf
        add     DWORD PTR [rbp-4], 1
.L12:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L13
        mov     edi, 10
        call    putchar
        nop
        leave
        ret
