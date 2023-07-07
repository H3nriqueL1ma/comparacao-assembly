segment .data
    LF          EQU 0xA     ; Quebra de linha
    NULL        EQU 0xD     ; Final da String
    SYS_CALL    EQU 0x80    ; Envio da informação ao SO

    ; EAX
    SYS_EXIT    EQU 0x1     ; Código de chamada de finalização
    SYS_READ    EQU 0x3     ; Read
    SYS_WRITE   EQU 0x4     ; Write

    ; EBX
    RET_EXIT    EQU 0x0     ; Operação finalizada
    STD_IN      EQU 0x0     ; Entrada padrão
    STD_OUT     EQU 0x1     ; Saída padrão
