; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC
    MOV BX,1       ; moving 1 to base register
    MOV CX,5       ; moving 5 to counter register
    
    Loop1:         ; Main Loop
    Push CX        ; loop will terminate if counter register reaches 5
    MOV CX,BX      ; moving bx value for inner loop counter
     
      Loop2:       ; inner loop
        MOV DL,"*" ; print *
        MOV AH,02  ; Intrupt for display
        INT 21h
     
      loop Loop2   ; ending inner loop
      
    INC BX         ; incrementing bx for inner loop
        
    MOV DL,0Ah     ; new line
    MOV AH,02
    INT 21H 
      
    MOV DL,0Dh     ; carige return
    MOV AH,02
    INT 21h 
    
    POP CX         ; pop to cx for outer loop
    loop Loop1
    
    INT 20h
 Func ENDP
 
 
 end func