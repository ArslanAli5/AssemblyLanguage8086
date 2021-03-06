; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    msg db 'HELLO','$' ; exemple varible


.CODE   ; Code section


 MAIN PROC
    XOR BX,BX
    MOV CL,4 
    MOV AH,1
    INT 21H
    
    WHILE:
        CMP AL,0DH
        JE END_WHILE
        
        CMP AL,39H
        JG L
        
        AND AL,0FH
        JMP DO
        
        L:
        
        SUB AL,37H
        
        DO:
        SHL BX,CL
        OR BL,BL
        
        INT 21H
        JMP WHILE
     END_WHILE:
     AND BX,1
     JNZ END
     MOV AH,9
     MOV DX, OFFSET MSG
     INT 21H
     
     END:
     
     MOV AH,4CH
     INT 21H        
    
    
    
    
    
    
 MAIN ENDP
 
 
 ;end main