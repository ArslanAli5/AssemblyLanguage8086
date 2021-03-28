; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC
    
    XOR AX,AX
    MOV CX,0
    MOV BX,1101001001000011B
    TOP:
       CMP CX,16
       JE END_
     
       INC CX
     
       ROL BX,1
       JC NEXT
       INC AX
    NEXT:
        JMP TOP
 
    END_:
    ADD AX,30H  
    MOV AH,2
    MOV DX,AX
    INT 21H
                 
    MOV AH,4CH
    INT 21H 
    
 Func ENDP
 
 
 end func