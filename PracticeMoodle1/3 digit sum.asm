.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Enter 1st number: $'
MSG2 DB 'Enter 2nd number: $'
MSG3 DB 'Enter 3rd number: $'

NUM1 DB ?
NUM2 DB ?
NUM3 DB ?

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL
    
    ;CODE FOR NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    
    ;CODE FOR NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    
    ;ADDITON PART
    ADD AL,NUM1
    MOV AH,0
    
    AAA
    
    ADD AL,NUM2
    
    AAA 
    
    MOV BX,AX
    
    ;CODE FOR NEW LINE  
    ADD BH,30H
    ADD BL,30H
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,BH
    MOV AH,2
    INT 21H
    MOV DL,BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN