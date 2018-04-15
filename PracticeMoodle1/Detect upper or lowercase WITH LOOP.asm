.MODEL SMALL
.STACK 100H

.DATA
MSG DB 'ENTER VALUE: $'
GREATER DB 'ENTERED LETTER IS UPPERCASE$'
LESSER DB 'ENTERED LETTER IS LOWERCASE$'

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX  
ST:
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    CMP BH,'A'
    JGE GRE
    
    JMP EXIT
    
GRE:
    
    CMP BH,'Z'
    JLE LSE 
    
    CMP BH,'a'
    JGE GREL
    JMP EXIT
    
GREL:
    
    CMP BH,'z'
    JLE LSEL
    JMP EXIT
LSEL:
    LEA DX,LESSER
    MOV AH,9
    INT 21H 
    JMP NEWLINE   
    
LSE:
    LEA DX,GREATER
    MOV AH,9
    INT 21H 
    JMP NEWLINE
    
NEWLINE:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    JMP ST:
    
EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    