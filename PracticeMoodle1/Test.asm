.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'ADITYA CHAKMA$'
MSG2 DB 'LEONEL MESSI$'

.CODE                  

MAIN PROC             
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    
    END MAIN
    