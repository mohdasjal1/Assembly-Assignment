org 100h
.model small
.stack 100h
.data
  lastal db 'Z'
  space db ' '
.code
main proc
mov cx, 26 
mov dl, lastal
L1:
mov ah,2
int 21h
mov dl, space
mov ah,2 
int 21h
dec lastal
mov dl, lastal
loop L1
main endp
 end main