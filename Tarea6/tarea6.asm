org     100h

section	.text

        ;Escribe contraseña
        MOV DX, password
        call EscribirPassword

        ;Texto
        MOV BP, frase
        call LeerPassword

        ;Reescribe contraseña
        MOV DX, rewPassword
        call EscribirPassword

       ;Texto
        MOV DX, frase
        call LeerPassword

        ;Llama a comparar contraseñas
        call Comparar

        call EscribirPassword

        int 20h

section .data
        password db "Password: ", "$"
        rewPassword db "Confirme password: ", "$"
        verified db "BIENVENIDO$"
        notVerified db "INCORRECTO$"
        frase times 20 db " "

        Buffer:
                MOV AH, 01h
                INT 21h
                RET
        
        LeerPassword:
                XOR SI, SI
        
        while:
                call Buffer
                CMP AL, 0x0D
                JE exit
                MOV [BP+SI], AL
                INC SI
                JMP Comparar

        Comparar:
                MOV BL,[password]   
                MOV CL,[rewPassword]
                CMP BL,CL ;compara contraseña con la confirmacion de la misma
                JE Validated      	  
                JNE Invalidated   	   
                JMP while

        Validated:            
		MOV DX, verified
		JMP while

        Invalidated:
		MOV DX, notVerified
		JMP while
        
        exit:
                MOV byte [BP+SI], "$"
                RET
                
        EscribirPassword:
                MOV AH, 09h
                INT 21h
                RET   