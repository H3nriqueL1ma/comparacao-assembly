%include 'lib.inc'

section .data
    x           dd 50
    y           dd 10

    msg1        db "X é maior que Y", LF, NULL
    size1       equ $- msg1
    msg2        db "Y é maior que X", LF, NULL
    size2       equ $- msg2

section .text

global _start

_start:
    mov         EAX, DWORD[x]
    mov         EBX, DWORD[y]

    cmp         EAX, EBX
    jge         bigger
    mov         ECX, msg2
    mov         EDX, size2
    jmp         _exit

bigger:
    mov         ECX, msg1
    mov         EDX, size1

_exit:
    mov         EAX, SYS_WRITE
    mov         EBX, STD_OUT
    int         SYS_CALL

    mov         EAX, SYS_EXIT
    mov         EBX, RET_EXIT
    int         SYS_CALL
