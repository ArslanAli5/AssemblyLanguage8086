; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section

main proc

 CALL pfact   
 
 mov dx,ax   
 
 main endp

pfact proc
    
 MOV CX,5 
 MOV AX,1

 TOP:
    MUL CX
 LOOP TOP
 
 ;RET            
 pfact endp
 
 
end main