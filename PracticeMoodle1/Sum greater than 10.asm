.MODEL SMALL
.STACK 100H  
.DATA

NUM1 DB ?
NUM2 DB ?

.CODE

MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1 
    
    INT 21H
    SUB AL,30H
    MOV NUM1,AL 
    
    INT 21H 
    SUB AL,30H
    MOV NUM2,AL
    
    INT 21H
    SUB AL,30H 
    
    ADD AL,NUM1
    MOV AH,0
    
    AAA  
    
    ADD AL,NUM2
    
    AAA   
    
    
    MOV BX,AX
    
    MOV AH,2
    
    ;NEW LINE
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ADD BH,30H
    ADD BL,30H
    MOV DL,BH
    INT 21H
    MOV DL,BL  
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN