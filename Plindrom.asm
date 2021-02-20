; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

 STRING DB 10 dup(?) 
 PLINDROM DB "STRING IS PLINDROM$"
 NOTPLINDROM DB "STRING IS NOT PRLNDORM$"

.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX
 
 call func
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

func proc
 
 MOV SI,OFFSET STRING
 MOV AH,1
 INT 21H
 WHILE:  
    MOV AH,1 
    INT 21H
    MOV [SI],AL 
    XOR AH,AH
    PUSH AX
    CMP AL,'$'
    JE END_WHILE

    INC SI

    JMP WHILE      
 END_WHILE:
 MOV SI,OFFSET STRING 
 WHILE1:
    MOV AL,[SI]
    CMP AL,'$'
    JE PLINDROM1
    XOR AH,AH
    POP BX
    CMP AL,BL
    JNE NOTPLINDROM1
    INC SI
 JMP WHILE1      
 NOTPLINDROM1:
    MOV AH,9
    LEA DX,NOTPLINDROM
    INT 21H
    JMP ELSE 
 PLINDROM1:
    MOV AH,9
    LEA DX,PLINDROM 
    INT 21H
 ELSE:
 
 func endp
 
end main