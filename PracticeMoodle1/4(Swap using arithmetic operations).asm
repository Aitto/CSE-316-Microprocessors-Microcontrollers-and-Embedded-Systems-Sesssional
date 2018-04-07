.MODEL SMALL
.STACK 100 H
    
.DATA

MSG1 DB 'Enter 1st number: $'
MSG2 DB 'Enter 2nd number: $'
MSG3 DB 'Number you entered; $'
MSG4 DB 'After swapping: $'    

.CODE

MAIN PROC
    
    ;INITIALIZING VARIABLE
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;LOADING AND PRINTING MESSAGE
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    ;TAKING INPUTS
    
    MOV AH,1
    INT 21H
    MOV CH,AL 
          
    ;NEW LINE  
          
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    ;LOADING AND PRINTING DATA
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    ;TAKING INPUT 2
    
    MOV AH,1
    INT 21H
    MOV CL,AL   
    
    ;NEW LINE  
          
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;LOAD AND PRINT
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
    
    
    ;NEW LINE  
          
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;LOAD AND PRINT
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H         
    
    
    ;ARITHMATIC OPERATIONS
    
    ADD CH,CL
    MOV BH,CH
    
    SUB BH,CL
    MOV CL,BH
    
    SUB CH,CL
    
    ;PRINTING SWAPED NUMBERS
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,' '
    INT 21H
    MOV DL,CL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN