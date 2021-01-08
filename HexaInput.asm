; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC
    
    XOR BX,BX          ;CLEAR BX
    MOV CL,4           ;COUNTER TO SHIFT 4 TIMES
    MOV AH, 1          ;INPUT CHARACTER
    INT 21H
    WHILE:
        CMP AL,0DH     ;CHECK FOR CARRIAGE RETURN
        JE END
        
        CMP AL,0DH     ;CHECK IF INPUT NUMBER
        JC LETTER
        
        AND AL,0FH     ;CONVERT DIGIT TO BINARY
        JMP SHIFT
        
        LETTER:
        
            SUB AL,37H ;CONVERT LETTER TO BINARY
            
        SHIFT:
            SHL BX,CL  ;MAKE SPACE FOR NEW VALUE
            OR BL,AL   ;INSERT INTO BX
            INT 21H
            JMP WHILE
        END:
            
    
    
    
    
    
 Func ENDP
 
 
 end func