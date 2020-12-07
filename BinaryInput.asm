; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC

    XOR BX, BX
    MOV AH,1
    INT 21H
    
    WHILE_:
        CMP AL, 0DH
        JE END_WHILE
        
        AND AL, 0FH
        SHL BX, 1
        OR BL, AL
        INT 21H
        JMP WHILE_
    END_WHILE:
        
    
    
    
    
    
 Func ENDP
 
 
 end func