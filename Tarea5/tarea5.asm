org 100h

    section .text

    xor SI, SI
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    call texto

    ;Primer nombre
    call cursor_pn
    call p_nombre
    call buffer ;Espera tecla

    ;Segundo nombre
    call cursor_sn
    call s_nombre
    call buffer ;Espera tecla

    ;Primer apellido
    call cursor_pa
    call p_apellido
    call buffer ;Espera tecla

    ;Segundo apellido
    call cursor_sa
    call s_apellido
    call buffer ;Espera tecla

    call exit 

    texto:
        MOV AH, 00h
        MOV	AL, 03h
        INT 10h
        RET
    
    cursor_pn:
        MOV AH, 02h
        MOV DH, 10
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
    
    p_nombre:
        MOV AH, 09h 
        MOV DX, pnombre
        INT 21h
        RET
    
    cursor_sn:
        MOV AH, 02h
        MOV DH, 12
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
    
    s_nombre:
        MOV AH, 09h 
        MOV DX, snombre
        INT 21h
        ret

    cursor_pa:
        MOV AH, 02h
        MOV DH, 14
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
    
    p_apellido:
        MOV AH, 09h 
        MOV DX, papellido
        INT 21h
        RET

    cursor_sa:
        MOV AH, 02h
        MOV DH, 16
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
    
    s_apellido:
        MOV AH, 09h 
        MOV DX, sapellido
        INT 21h
        RET

    buffer:
        MOV AH, 00h
        INT 16h
        RET
    
exit:
    INT 20h

section .data
    pnombre   DB "Andrea $"
    snombre   DB "Marisol $"
    papellido DB "Benitez $"
    sapellido DB "Dominguez $"
