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
        JE end
        
        CMP AL,39H     ;CHECK IF INPUT NUMBER
        JG LETTER
        
        AND AL,0FH     ;CONVERT DIGIT TO BINARY
        JMP SHIFT
        
        LETTER:
        
            SUB AL,37H ;CONVERT LETTER TO BINARY
            
        SHIFT:
            SHL BX,CL  ;MAKE SPACE FOR NEW VALUE
            OR BL,AL   ;INSERT INTO BX
            INT 21H
            JMP WHILE
     end:
     
     MOV CX,4
     MOV AH,2
     
     LOOP1:
        MOV DL,BH
        SHR DL,4        
        
        CMP DL,0Ah
        JNL LETTER1
        
        ADD DL,30h
        INT 21H
        JMP LOOP2
        
        LETTER1:
            ADD DL,37h
            INT 21H
            
        LOOP2:
        SHL BX,4  
     LOOP LOOP1
     
     MOV AH,4CH
     INT 21H
     
   
 Func ENDP
 
 
 end func