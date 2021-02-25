; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

   AMP Dw 3,6,7,2,8,4,0,2,8,1
   POW_DASH Dw 10 dup(?)

.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX
 MOV ES, AX
 
 CLD
 MOV SI,OFFSET AMP
 MOV DI,OFFSET POW_DASH
 L1:
   LODSW
   MOV CX, si
   MOV AX, di
   DEC CX
 L2:
   ADD AX,BX
 LOOP L2
   STOSW
   CMP SI, 20
 JNE L1
  
 MOV AH, 4Ch
 INT 21H  
 
 main endp


PRINTDEC proc  
  
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
 PRINTDEC endp 
 
end main