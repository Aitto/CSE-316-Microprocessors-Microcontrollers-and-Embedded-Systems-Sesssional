.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC 
    
    MOV AX,'X'
    PUSH AX  
    
    START:
    
    ;TAKING INPUT 2 DIGITS
    MOV AH,1
    INT 21H
  
    CMP AL,'X'
    JE END        ;CHECKING IF INPUT IS X, FOR TERMINATION
 
    MOV BH,AL
    INT 21H
    MOV BL,AL       
    
    ;PUSH THOSE TWO NUMBERS
    
    MOV AX,BX
    PUSH AX; 
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    JMP START:
    END:
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
     
    
    ;PRINTING ELEMENTS 
    
    PSTART:
    
    MOV AH,2
    POP BX 
    
    CMP BX,'X'
    JE PEND
    
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H 
    
    MOV DL,' '
    INT 21H
    
    JMP PSTART;
    PEND:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    