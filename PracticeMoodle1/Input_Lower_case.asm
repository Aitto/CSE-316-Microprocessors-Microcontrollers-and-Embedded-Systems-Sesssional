.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 'Input a lowercase character: $'
MSG2 DB 'The Converted uppercase character: $'

.CODE

MAIN PROC         ;STAR OF MAIN PROGRAM
    
    MOV AX,@DATA  ;INITIALIZATION OF DATA SEGMENT
    MOV DS,AX     
    
    LEA DX,MSG1   ;LOAD EFFECTIVE ADDRESS
    MOV AH,9      ;PRINTING MESSAGE 1
    INT 21H
    
    MOV AH,1 
    
    INT 21H       ;TAKING INPUT
    MOV BH,AL
    
    MOV BL,'a'
    NEG BL        ;PUTTING 'a' TO BL AND MAKING IT NEGATIVE
    ADD BL,BH     ;SUB. 'a' FROM INPUT CHARACTER
    ADD BL,'A'    ;ADDING 'A' TO THAT CHARACTER | X-'a'+A
             
    MOV AH,2
    
    MOV DL,0AH
    INT 21H       ;PRINTING NEW LINE
    MOV DL,0DH
    INT 21H       
    
    LEA DX,MSG2
    MOV AH,9      ;PRINTING MESSAGE 2
    INT 21H
    
    MOV AH,2
             
    MOV DL,BL     ;PRINTING UPPERCASE CHARACTER
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    

END MAIN
