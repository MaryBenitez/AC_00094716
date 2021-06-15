org 100h

    section .text

    XOR AX, AX
    XOR BX, BX
    XOR DX, DX
    XOR SI, SI

    call texto

    call cursor_pn
    call p_nombre

    call cursor_sn
    call s_nombre

    call cursor_pa
    call p_apellido

    call cursor_sa
    call s_apellido

    call buffer
    call exit

    texto:
        MOV AH, 00h
        MOV	AL, 03h
        INT 10h
        RET
    
    cursor_pn:
        MOV AH, 02h
        MOV DH, 4
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
        MOV DH, 6
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
        MOV DH, 8
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
        MOV DH, 10
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
