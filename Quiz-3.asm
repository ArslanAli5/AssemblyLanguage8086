; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    LOWER DB 50 DUP(?) ; exemple varible
    UPPER DB 50 DUP(?) 
    NUMERIC DB 50 DUP(?)   
    OTHERS DB 50 DUP(?)
    C1 DW 0   
    C2 DW 0
    C3 DW 0
    C4 DW 0
    
.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX  

 call func
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

func proc
 
 MOV AH, 1   ;read first character
 INT 21H
 WHILE_:
	 CMP AL, 027d	
	 JE END_WHILE 
	 
	 CMP AL,0DH
	 JBE OTHERS1	 	 
	 CMP AL,02FH
	 JBE OTHERS1	 	 
	 
	 CMP AL,'0'
	 JBE NUMBERI1	 	 
	 CMP AL,'9'
	 JBE NUMBERI1
	 
	 CMP AL,54d
	 JBE OTHERS1	 	 
	 CMP AL,64d
	 JBE OTHERS1	 
	 
	 CMP AL,'A'
	 JBE UPPER1	 	 
	 CMP AL,'Z'
	 JBE UPPER1

	 CMP AL,91D
	 JBE OTHERS1	 	 
	 CMP AL,96D
	 JBE OTHERS1	  	 
	 
	 CMP AL,'a'
	 JBE LOWER1
	 CMP AL,'z'
	 JBE LOWER1
	 	  
	 JMP ELSE
	 LOWER1: 
	   MOV BX,C1   
	   MOV SI,0 
	   MOV LOWER[BX+SI],AL
	   INC C1
	   JMP ELSE

	 UPPER1:	 	   
	   MOV BX,C2   
	   MOV SI,0 
	   MOV UPPER[BX+SI],AL
	   INC C2
	   JMP ELSE	   
	 
	 NUMBERI1:
	   MOV BX,C3   
	   MOV SI,0 
	   MOV NUMERIC[BX+SI],AL
	   INC C3
	   JMP ELSE

	 OTHERS1:
	   MOV BX,C4   
	   MOV SI,0 
	   MOV OTHERS[BX+SI],AL
	   INC C4
	   JMP ELSE		   	 	 
	 
	 ELSE:
	 INT 21H
	 JMP WHILE_
 END_WHILE:
  
 func endp
 
end main