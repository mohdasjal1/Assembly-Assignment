; Draw following series using loops:
;Z X V T R P N L J H F D B

.model small
.stack 100h
.data

.code
main proc
  mov dl,'Z'
  mov cx, 13
  
L1:      
  mov ah,2
  int 21h
  
  sub dl, 2
  loop L1
  
  mov ah,4ch
  int 21h
  
main endp
end main