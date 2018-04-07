.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Input uppercase character: $'
MSG2 DB 'The converted lowercase character: $'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV BL,'A'
    NEG BL
    ADD BL,BH
    ADD BL,'a'
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

END MAIN
    
    