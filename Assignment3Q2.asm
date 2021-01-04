; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

   ROW DW 1
       DW 2
       DW 3
       DW 4      
          
   COLUMN DW 4,3,2,1 
   
   ROWSIZE DW 4
   
   COLUMNSIZE DW 4
   COUNT DW 0
   
   PRODUCT DW 0
   STRING DB "Multiplication is not possible$" 
   STRING1 DB "Vector Product = $"

.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX

 MOV BX,COLUMNSIZE
 CMP ROWSIZE,BX
 JNE NOTPOSSIBLE
 MOV CX,ROWSIZE
 LOOP1:
    MOV SI,offset COLUMN
    ADD SI,COUNT
    MOV AX,[SI]  
    MOV SI,offset ROW
    ADD SI,COUNT    
    MOV BX,[SI]    
    IMUL BX
    ADD COUNT,2 
    ADD PRODUCT,AX
 LOOP LOOP1
 MOV AH,9
 LEA DX,STRING1
 INT 21H
 
 mov ah,2
 MOV dX,[PRODUCT]
 int 21h
 JMP ELSE

 NOTPOSSIBLE:
  MOV AH,9
  LEA DX,STRING
  INT 21H  
 ELSE:
 
 MOV AH, 4Ch
 INT 21H  
 
 main endp

end main