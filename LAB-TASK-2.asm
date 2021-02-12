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
 WHILE_:

     MOV AH,0
	 SUB AL,30H 
	   
	 MOV CX,AX
	 
	 MOV AX,10
	 MOV BX,DS:[TOTAL]
	 MUL BX
	 
	 MOV TOTAL,AX
     
     ADD [TOTAL],CX
     
	 MOV AH,1
	 INT 21H
	  
	 CMP AL, 0Dh	
	 JE END_WHILE	
	  
	 JMP WHILE_
 END_WHILE:

 MOV AH,2
 MOV DL,0AH
 INT 21H
 
 MOV DL,0DH
 INT 21H
 
 MOV DX,DS:[TOTAL]   ; saving last value in DX
    
 func endp
 
end main