    org 100h

    section .text

        XOR AX, AX 
        XOR SI, SI 
        XOR BX, BX
        MOV CX, 5d 
        MOV byte[20bh], 1d
        jmp iterar
        
    iterar:

        MOV AL,[20BH]
        MOV BL, CL
        MUL BL
        MOV [20BH],AL
        LOOP iterar 

    exit:
        int 20h