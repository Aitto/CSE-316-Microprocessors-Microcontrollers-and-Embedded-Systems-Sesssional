.MODEL SMALL
.STACK 100H
.DATA

NUM DB 5

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;LEA DL,NUM  
    MOV DL,NUM  
    ADD DL,'0'
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN