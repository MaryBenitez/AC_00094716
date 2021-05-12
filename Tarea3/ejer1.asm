        org 100h

        section .text

                XOR AX, AX
                XOR BX, BX
                XOR DI, DI
                MOV byte[200h],0d
                MOV byte[201h],0d
                MOV byte[202h],0d
                MOV byte[203h],9d
                MOV byte[204h],4d
                MOV byte[205h],7d
                MOV byte[206h],1d
                MOV byte[207h],6d

                jmp suma

        suma:
                cmp DI, 8d
                jmp promedio
                ADC AL, [200h+DI]
                INC DI
                jmp suma

        promedio:
                MOV BL, 8d
                DIV BL
                MOV [20Ah], AL

        exit:
                int 20h