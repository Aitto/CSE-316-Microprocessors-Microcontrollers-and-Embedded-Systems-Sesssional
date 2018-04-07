.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 'Enter 2 numbers: $'
MSG2 DB 'Sum is: $'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,1  
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    ADD BH,BL
    MOV AH,2
    MOV DL,BH
    SUB DL,'0'
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN