
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL ;64kb code and 64kb data


.STACK 100h  ; stack size


.DATA      ; variables section

    arr dw 51 dup(0000h),'BC34',0Ah,57AEh
    COUNT DB 2 
    count1 dw 4
.CODE   ; Code section

main proc
 MOV AX,@DATA
 MOV DS,AX 
 
 xor ax,ax
 MOV BX,0102h
 
 lea bx, arr+102+3d
 mov dx,[bx] 
 
 MOV DI,BX
 mov dx,[dI]
 
 ADD AL,[DI+1]
 
 
 MOV DX,-2[BX]
 
 SUB 3[BX],AX