; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    TOTAL DW 0 ; exemple varible

.CODE   ; Code section

main proc
 
 call func2
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

func2 proc  
 MOV AX,4327D  
 CMP AX,0 
 JL IF
 JMP END_IF
 IF:
    NEG AX
    MOV BX,AX
    MOV dX,'-'
    MOV AH,2
    INT 21H
    MOV AX,BX
 END_IF:
 XOR BX,BX
 REPEAT:
    XOR DX,DX
    MOV CX,10
    DIV CX
    CMP DX,0
    JE QUOTIENT
            
    PUSH DX
    INC BX

 JMP REPEAT 
 QUOTIENT:
 MOV AH,2
 MOV CX,BX   
 LOOP1:
    POP DX
    ADD DX,30H
    
    INT 21H 
 LOOP LOOP1
 RET  
 func2 endp
 
end main