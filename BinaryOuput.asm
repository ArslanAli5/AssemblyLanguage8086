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
                
    
    MOV CX,16         ; LOOP COUNTER

   
    Loop1:
        ROL BX,1      ;SHIFTING EVERY DIGIT TO CARRY FLAG
        JNC CF0
        MOV DL,31H    ; IF CF ==1
        JMP DISPLAY   ; JUMP TO DISPLAY 1
   
        CF0:  
            MOV DL,30H  ; IF CF==0
            JMP DISPLAY ; JUMP TO DISPLAY 0
   
        DISPLAY:
            MOV AH,2
            INT 21H
    LOOP Loop1
   
        MOV AH,4CH
        INT 21H
    
    
    
    
    
    
 Func ENDP
 
 
 end func