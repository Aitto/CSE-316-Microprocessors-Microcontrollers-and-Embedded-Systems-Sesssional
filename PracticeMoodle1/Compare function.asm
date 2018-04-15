.MODEL SMALL
.STACK 100H
.DATA

NUM1 DB ?
NUM2 DB ?

MSG1 DB 'IS GREATER THAN $'
MSG2 DB 'IS LESS THAN OR EQUAL $'
MSG3 DB 'IS EQUAL TO $'

.CODE

MAIN PROC
    
    ;MOVING DATA SEGMENT TO MEMORY 
    MOV AX,@DATA
    MOV DS,AX
    
    ;INPUT FIRST NUMBER
    MOV AH,1
    INT 21H
    MOV NUM1,AL
    
    ;PRINTING A NEWLINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;INPUT SECOND NUMBER
    MOV AH,1
    INT 21H
    MOV NUM2,AL
    
    ;PRINTING NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV BL,NUM1
    
    ;COMPARE FUNCTION
    CMP BL,NUM2
    ;IF BL > NUM2 THEN JUMP TO L2,ELSE TO L1
    JG L2
    
    L1:
    
    MOV DL, BL
    INT 21H
    MOV DL, ' '
    INT 21H
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,2
    MOV DL,NUM2
    INT 21H
    
    JMP END_IF
    
    L2:
    
    MOV DL, BL
    INT 21H 
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H   
    
    
    MOV DL,NUM2
    INT 21H
    
    JMP END_IF
    
    END_IF:
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN