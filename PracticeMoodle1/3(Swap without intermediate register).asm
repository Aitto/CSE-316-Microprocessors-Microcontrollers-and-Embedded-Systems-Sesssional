.MODEL SMALL
.STACK 100H                 
.DATA

MSG1 DB 'Insert 1st number: $'
MSG2 DB 'Insert 2nd number: $'   
MSG3 DB 'You have entered: $'
MSG4 DB 'After swapping: $'

.CODE

MAIN PROC   
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9         ;PRINTING 1ST MESSAGE
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    MOV AH,2
    MOV DL,0AH       ;NEW LINE
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9         ;PRINTING 2ND MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H          ;NEW LINE
    MOV DL, 0DH
    INT 21H
    
    ;XCHG CH,CL
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
        
    MOV AH,2
    
    MOV DL,CH
    INT 21H
    
    MOV DL,' '
    INT 21H
    
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H         ;NEW LINE
    MOV DL, 0DH
    INT 21H          
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    XCHG CH,CL      ;EXCHANGE WITHOUT INTERMEDIATE REGISTER
    
    MOV AH,2
    MOV DL,CH
    INT 21H  
    
    MOV DL, ' '
    INT 21H
    
    MOV DL,CL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP 

END MAIN