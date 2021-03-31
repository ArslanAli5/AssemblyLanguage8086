; Define Question

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    ALPHA DB 4 ; exemple varible


.CODE   ; Code section


 Func PROC
    
       XOR    Bl,10101010b        ; Set Bl    
       MOV    Cl,8
RLOOP: 
       RCR    Al,1 
       RCL    Bl,1 
       LOOP   RLOOP        ; Do 8 times     
    
    
    
    
    
 Func ENDP
 
 
 end func