INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC
    
    ;CLEARING REGISTER
    MOV BX,0
    MOV AH,1
    
    
    LOOP_START:  
        ;INPUT
        INT 21H
        
        CMP AL,0DH ;CHECKING FOR ENTER    
        JE END_LOOP
        ;MOV BL,AL
        SHL BX,1
        
        SUB AL,30H
        OR BL,AL   
        JMP LOOP_START
    
    END_LOOP: 
    
    PRINTN    
    MOV CX,16
    
    TOP:
        SHL BX,1
        JC PRINT1
        
        PRINT "0"
        JCXZ END
        LOOP TOP 
        
        PRINT1:
        PRINT "1"
        JCXZ END
        LOOP TOP
    END:
    
    PRINTN
    PRINTN "END OF PROGRAM"
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN



