; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC
    
    MOV CX,1234H
    ROL CX,8
    
    ROL CL,4
    ROL CH,4
    
    MOV DX,8765H
    ROL DX,16
    
    MOV AH,4CH
    INT 21H     
    
    
    
    
    
    
 Func ENDP
 
 
 end func