%include 'lib.inc'

section .data
    x           DD 50                          ; Declaração da variável x como um double word (4 bytes) e atribui o valor 50.
    y           DD 10                          ; Declaração da variável y como um double word (4 bytes) e atribui o valor 10.

    msg1        DB "X é maior que Y", LF, NULL ; Declaração da mensagem "X é maior que Y" seguida por uma nova linha (LF) e um caractere nulo (NULL) no final.
    size1       EQU $- msg1                    ; Define a constante size1 como o tamanho da mensagem "msg1".

    msg2        DB "Y é maior que X", LF, NULL ; Declaração da mensagem "Y é maior que X" seguida por uma nova linha (LF) e um caractere nulo (NULL) no final.
    size2       EQU $- msg2                    ; Define a constante size2 como o tamanho da mensagem "msg2".

section .text

global _start

_start:
    MOV         EAX, DWORD[x]                  ; Move o valor da variável x para o registrador EAX.
    MOV         EBX, DWORD[y]                  ; Move o valor da variável y para o registrador EBX.

    CMP         EAX, EBX                       ; Compara os valores em EAX (x) e EBX (y).
    JGE         bigger                         ; Se x >= y, salta para o rótulo "bigger" (X é maior ou igual a Y).
    MOV         ECX, msg2                      ; Move o endereço da mensagem "msg2" para o registrador ECX (mensagem a ser exibida).
    MOV         EDX, size2                     ; Move o tamanho da mensagem "msg2" para o registrador EDX (tamanho da mensagem).
    JMP         _exit                          ; Salta para o rótulo "_exit" para realizar a chamada de sistema e encerrar o programa.

bigger:
    MOV         ECX, msg1                      ; Move o endereço da mensagem "msg1" para o registrador ECX (mensagem a ser exibida).
    MOV         EDX, size1                     ; Move o tamanho da mensagem "msg1" para o registrador EDX (tamanho da mensagem).

_exit:
    MOV         EAX, SYS_WRITE                 ; Move o número da chamada de sistema para exibir texto (SYS_WRITE) para o registrador EAX.
    MOV         EBX, STD_OUT                   ; Move o número do descritor de arquivo para saída padrão (STD_OUT) para o registrador EBX.
    INT         SYS_CALL                       ; Chama o sistema operacional para exibir a mensagem na saída padrão.

    MOV         EAX, SYS_EXIT                  ; Move o número da chamada de sistema para encerrar o programa (SYS_EXIT) para o registrador EAX.
    MOV         EBX, RET_EXIT                  ; Move o código de retorno para a chamada de sistema SYS_EXIT (RET_EXIT) para o registrador EBX.
    INT         SYS_CALL                       ; Chama o sistema operacional para encerrar o programa.
