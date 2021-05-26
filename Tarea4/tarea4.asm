 org 100h

    section .text

    mov BP, arregloNum
    call parImparFuncion

    int 20h

    section .data

    arregloNum db 99,53,18,74,37,75,78,16,23,15

    parImparFuncion:
        xor SI,SI

    while:
        mov AL,[BP+SI]
        mov dl, al
        
        cmp AL,10
        je end

        mov bl,01h
        and AL,bl
        
        cmp AL,01h  
        jnz PAR
        
        mov [0320H+SI],dl
        
        inc SI
        jmp while

    PAR:
        mov [0300H+SI],dl

        inc SI
        jmp while

    end
    ret