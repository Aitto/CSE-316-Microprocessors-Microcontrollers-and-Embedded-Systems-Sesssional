INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    
    
    ;FIRST FREE A REGISTER
    MOV BX,0
    ;FOR HEX INPUT WE HAVE TO MOVE THE REGISTER 4 BITS. INSTEAD OF 1 BIT LIKE THE BINARY INPUT
    
    MOV AH,1
    
    INPUT_START:
        INT 21H
        
        CMP AL,0DH
        JE INPUT_END
        
        CMP AL,'A'
        JGE LETTER:
        
        ;ELSE IT'S A NUMBER
        CMP AL,3AH
        JGE END
        CMP AL,2FH
        JLE END
        
        SUB AL,30H
        JMP SHIFT
        
        LETTER:
        CMP AL,'G'
        JGE END
        SUB AL,37H
        
        SHIFT:
        SHL BX,4
        OR BL,AL
        
        JMP INPUT_START   
        
    INPUT_END:
    PRINTN   
    PRINT "PRINTING HEXADECIMAL NUMBER: "
    
    MOV AH,2
    
    MOV CX,4
    
    PLOOP_START:
        MOV DL,BH
        SHL BX,4
        SHR DL,4
        
        ;CHECKING IF INPUT IS A NUMBER OR LATTER
        CMP DL,0AH
        JGE CHAR
        
        ADD DL,30H
        JMP PR
        
        CHAR:
        ADD DL,37H
        
        PR:
        INT 21H
        
    LOOP PLOOP_START:
        
    
    
    PRINTN
    PRINT "END OF PROGRAM"               
    
    END:
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN




