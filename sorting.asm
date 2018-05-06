INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA
    
    ARRAY DW 18 DUP(?)
    DIGITS DW ?
    NUM DW ?
    FLAG DW ?
    INDEX DW ?
    TELEMENTS DW ?
    TEMP DW ? 
    
    MINDEX DW ?
    COUNT DW ?
    TMP DW ?
    EL1 DW ? 
    EL2 DW ? 
    I DW ?
    J DW ?
    FL DW ?
    SL DW ?
    
.CODE

MAIN PROC
    
    MOV AH,@DATA
    MOV DS,AX
    
    ;INPUT
    ;DIGIT CONTAINS DIGITS NUMBER OF A NUMBER
    ;CX CONTAINS LOOP NUMBER. CX=DIGITS
    ;AX CONTAINS INPUT NUMBER, POPED NUMBER
    ;BX CONTAINS 10, MULTIPLIER
    ;NUM CONTAINS THE NUMBER
    ;DX CONTAINS RETREIVED NUMBER FROM THE STACK
    ;FLAG CONTAINS TRACK OF NEGATIVE NUMBERS
    ;INDEX CONTAINS index
    ;TOTAL ELEMENT NUMBER TELEMENTS
    
    MOV INDEX,0
    MOV TELEMENTS,0 ;INITIALIZING TOTAL ELEMENTS
    
    FOR:
        
        MOV DIGITS,0 ;COUNT HOW MANY DIGITS THE NUMBER CONTAIN
        MOV AH,1    ;SET FUNCTION FOR INPUT
        MOV FLAG,0
        
        INNER_FOR:
            
            INT 21H
            
            CMP AL,' '
            JE END_INNER_FOR    ;IF INPUT ==' ' THEN PROCESS THE NUMBER AND TAKE NEXT INPUT
            
            CMP AL,'X'
            JE END_FOR          ;IF INPUT=='X' THEN BREAK THE FOR LOOP
            
            CMP AL,'-'
            JE GO               ;IF NEGATIVE SIGN, THEN SET FLAG TO 1
            
            
            XOR BX,BX
            
            MOV BL,AL
            SUB BL,30H
            
            PUSH BX
                    
            INC DIGITS
            
            JMP INNER_FOR
            
            GO:
            MOV FLAG,1
            JMP INNER_FOR
            
        
        END_INNER_FOR:
        
        MOV CX,DIGITS
        MOV BX,1
        MOV NUM,0
        
        PROCESS_NUM:
        
             POP AX
             MUL BX
             ADD NUM,AX
             
             MOV AX,10
             ;MOV BX,10
             MUL BX
             MOV BX,AX
        
        LOOP PROCESS_NUM:
        
        MOV BX,INDEX
        CMP FLAG,1
        JNE GO2
        NEG NUM
        
        GO2:
        
        MOV AX,NUM
        MOV ARRAY[BX],AX
        ADD BX,2            ;ADDING INDEX 2
        MOV INDEX,BX
        MOV DX,AX
        
        INC TELEMENTS
        JMP FOR
    
    END_FOR:
    
    PRINTN
    PRINT "TOTAL ELEMENTS: "
    MOV AH,2
    MOV BX,TELEMENTS
    MOV DL,BL
    ADD DL,30H
    INT 21H
    PRINTN
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    ;PRINTING ARRAY
    CALL SHOW
    
    POP DX
    POP CX
    POP BX
    POP AX
    
    
    ;SAVING DATA
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    
    CALL SORTS
    
    ;RETREIVING DATA
    POP DX
    POP CX
    POP BX
    POP AX
    
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    ;PRINTING ARRAY
    CALL SHOW
    
    POP DX
    POP CX
    POP BX
    POP AX
    
    
    MOV AH,4CH
    INT 21H
MAIN ENDP


SORT PROC
    
    PRINTN "SORTING... ... "
    
    MOV I,0
    MOV AX,TELEMENTS    ;I=0
    MOV BX,2
    MUL BX
    MOV FL,AX           ;FL=N
    SUB FL,2              ;FL=N-1
    
    ;FOR(INT I=0;I<N-1;I++
    
    FORS:
        
        MOV AX,FL
        CMP I,AX
        JGE END_FORS ;IF(I>=N) BREAK;
        
        MOV AX,I
        MOV MINDEX,AX    ;MINDEX=I
        
        MOV J,AX
        ADD J,2
        
        WHILES:
            
            MOV BX,2
            MOV AX,TELEMENTS
            MUL BX
            CMP J,AX             ;IF(J>=N) BREAK
            JGE END_WHILES 
            
            MOV BX,J
            MOV AX,ARRAY[BX]     ;EL1=ARRAY[J]
            MOV EL1,AX
            
            MOV BX,MINDEX
            MOV AX,ARRAY[BX]     ;EL2=ARRAY[MINDEX]
            MOV EL2,AX
            
            CMP EL1,AX
            JLE ESCP             ;IF(EL1<EL2) MINDEX=AX
            MOV AX,J             ;MINDEX
            MOV MINDEX,AX
            
            ESCP:
            
            MOV BX,MINDEX
            MOV AX,ARRAY[BX]
            MOV EL1,AX          ;EL1=ARR[MINDEX] 
            
            MOV BX,I
            MOV AX,ARRAY[BX]    ;EL2=ARRAY[I]
            MOV EL2,AX
            
            MOV BX,MINDEX
            MOV ARRAY[BX],AX    ;ARRAY[MINDEX]=ARRAY[I]
            
            MOV BX,I
            MOV AX,EL1          ;ARRAY[I]=ARRAY[MINDEX]
            MOV ARRAY[BX],AX     
            
            ADD J,2
            
        JMP WHILES
        END_WHILES:
    
        ADD I,2
        
    JMP FORS
    END_FORS:
    
    
RET
SORT ENDP



SHOW PROC
    
    
     PRINTN
     PRINTN "PRINTING ARRAY: "
     
    ;PRINT ARRAY NUMBERS
    ;TELEMENTS CONTAINS TOTAL ELEMENTS 
    ;TEMP CONTAINS VARIABLE TEMPORARILLY
    ;INITIALIZING INDEX TO ITERATE ARRAY FROM ZERO TO TOP
    
    MOV CX,TELEMENTS
    MOV INDEX,0
    
    PRINT_NUM:
        
        MOV FLAG,0      ;INITIALIZING FLAG VARIABLE
        MOV BX,INDEX
        MOV AX,ARRAY[BX]
        
        CMP AX,0
        JGE GO3         ;CHECKING FOR NEGATIVE NUMBER
        NEG AX
        MOV FLAG,1      ;TRACKING IF NUMBER IS NEGATIVE
        
        GO3:
        MOV DX,0
        MOV DIGITS,0    ;COUNTING HOW MANY DIGITS IN THE NUMBER
        
        PUSH CX
        
        WHILE:
            
            MOV BX,10
            CMP AX,0
            JE END_WHILE
            
            DIV BX
            
            ;MOV TEMP,AX
            ;MOV AH,2
            ;ADD DL,30H
            ;INT 21H
            PUSH DX
            
            ;MOV AX,TEMP
            INC DIGITS
            MOV DX,0
            JMP WHILE
            
        END_WHILE:
        
        ;MOV TEMP, CX
        
        MOV CX,DIGITS
        MOV AH,2
        CMP FLAG,1
        JNE PWHILE
        MOV DL,'-'
        INT 21H
        
        PWHILE:
            
            POP DX
            ADD DL,30H
            INT 21H
        
        LOOP PWHILE: 
        
        POP CX
        
        ;MOV CX,TEMP
        
        ADD INDEX,2
        PRINT ' '
    
    LOOP PRINT_NUM
    
    PRINTN
    
RET
SHOW ENDP


END MAIN

