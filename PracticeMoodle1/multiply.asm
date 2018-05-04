INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    
    CALL MULTIPLY
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP

MULTIPLY PROC
    
    MOV AH,1
    PRINT "ENTER FIRST NUMBER: " 
    INT 21H
    MOV BL,AL
    SUB BL,30H  
    
    PRINTN
    
    PRINT "ENTER SECOND NUMBER: "    
    
    INT 21H
    MOV CL,AL
    SUB CL,30H
    
    PRINTN
    
    MOV DL,0
    
    FOR:
        CMP CL,0
        JE END_FOR
        
        SHR CL,1
        JNC CHECK
        
        ADD DL,BL
        
        CHECK:
        SHL BL,1
        JMP FOR
        
    END_FOR:
    
    MOV CL,DL
    
    PRINTN
    PRINT "RESULT: "
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    RET
MULTIPLY ENDP    

END MAIN


