INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC
    
    
    CALL PRINT_FUNC
    
    PRINTN "NO I'VE RETURNED IN MAIN FUNCTION"
    
    
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP   
    
    PRINT_FUNC PROC
        
        PRINTN "INSIDE PRINT FUNCTION"
        PRINTN "THIS ONE IS TOO"
        PRINTN "EXITING PRINT FUNCTION"
        
        RET
    PRINT_FUNC ENDP
        
    
END MAIN

    