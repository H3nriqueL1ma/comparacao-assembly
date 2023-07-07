%include 'lib.inc'

section .data
    x           DD 50
    y           DD 10

    msg1        DB "X é maior que Y", LF, NULL
    size1       EQU $- msg1
    msg2        DB "Y é maior que X", LF, NULL
    size2       EQU $- msg2

section .text

global _start

_start:
    MOV         EAX, DWORD[x]
    MOV         EBX, DWORD[y]

    CMP         EAX, EBX
    JGE         bigger
    MOV         ECX, msg2
    MOV         EDX, size2
    JMP         _exit

bigger:
    MOV         ECX, msg1
    MOV         EDX, size1

_exit:
    MOV         EAX, SYS_WRITE
    MOV         EBX, STD_OUT
    INT         SYS_CALL

    mov         EAX, SYS_EXIT
    mov         EBX, RET_EXIT
    int         SYS_CALL
