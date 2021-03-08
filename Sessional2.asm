; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    NUMBER DW 123
    X DW ?
    Y DW ?
    Z DW ? 
    TOTAL DW ? 
    EQUAL DB " = $"
    NEQUAL DB " != $"
    STRING1 DB "The given number is DigiCube$"
    STRING2 DB "The given number is not DigiCube$"
    
    
.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX
 
 call digicube
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

digicube proc
    MOV AX,NUMBER
    XOR BX,BX
    REPEAT:
        XOR DX,DX
        MOV CX,10
        DIV CX
        CMP DX,0
        JE QUOTIENT
            
        PUSH DX
        JMP REPEAT
    QUOTIENT:
    POP AX 
    MOV BX,AX
    
    IMUL BX 
    IMUL BX
    MOV [X],AX 

    POP AX 
    MOV BX,AX
    
    IMUL BX 
    IMUL BX
    MOV [Y],AX  

    POP AX 
    MOV BX,AX
    
    IMUL BX 
    IMUL BX
    MOV [Z],AX  
     
    MOV AX, [X]
    ADD [TOTAL],AX
    
    MOV AX, [Y]
    ADD [TOTAL],AX
    
    MOV AX, [Z]
    ADD [TOTAL],AX 
    
    MOV AX, [NUMBER]
    CMP [TOTAL],AX  
    JE ELSE
    IF: 
       call digiout 
       LEA DX,[NEQUAL]
       MOV AH,9       
       INT 21H
       MOV AX,[TOTAL] 
       CALL digiout 
       call NEWLINE
       MOV AH,9
       LEA DX,[STRING2]
       INT 21H 
       JMP ELSE_
    ELSE: 
       call digiout 
       LEA DX,[EQUAL]
       MOV AH,9       
       INT 21H
       MOV AX,[TOTAL] 
       CALL digiout 
       call NEWLINE
       MOV AH,9     
       ;call digiout
       
       LEA DX,[STRING1]
       INT 21H 
    ELSE_:
    
    MOV AH,4CH
    INT 21H     
        
 
 digicube endp  


digiout proc    
 XOR BX,BX
 REPEAT1:
    XOR DX,DX
    MOV CX,10
    DIV CX
    CMP DX,0
    JE QUOTIENT1
            
    PUSH DX
    INC BX

 JMP REPEAT1 
 QUOTIENT1:
 MOV AH,2
 MOV CX,BX   
 LOOP2:
    POP DX
    ADD DX,30H
    
    INT 21H 
 LOOP LOOP2
 RET  
 digiout endp 

NEWLINE proc
    MOV AH,2
    MOV Dl,0AH
    INT 21H
    
    MOV DX,0DH
    INT 21H 
    ret
    NEWLINE ENDP
    
end main