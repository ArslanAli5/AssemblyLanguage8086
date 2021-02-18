; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    TOTAL DW 0 ; exemple varible

.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX
 
 call func
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

func proc
 XOR AX,AX  
 MOV AH, 1   ;read first character
 INT 21H
 CMP AL,02DH 
 JE IF
 JMP WHILE_
 IF:
    PUSH 1
    JMP END_IF
 WHILE_:

     MOV AH,0
	 SUB AL,30H 
	   
	 MOV CX,AX
	 
	 MOV AX,10
	 MOV BX,DS:[TOTAL]
	 MUL BX
	 
	 MOV TOTAL,AX
     
     ADD [TOTAL],CX
     
     
     END_IF:
        
	 MOV AH,1
	 INT 21H
	  
	 CMP AL, 0Dh	
	 JE END_WHILE	
	  
	 JMP WHILE_
 END_WHILE:

 POP AX
 CMP AX,1
 JE IF1
 JMP ELSE
 IF1:
    MOV DX,DS:[TOTAL]   ; saving last value in DX IF number is NEG
    XOR DX,1111111111111110B  
    JMP ELSE_1
 ELSE: 
    MOV DX,DS:[TOTAL]   ; saving last value in DX IF number is POS
 ELSE_1:   
 func endp
 
end main