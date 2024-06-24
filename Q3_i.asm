; Display given patterns using loops:        

; i) ABCDEFGHIJ
;    ABCDEFGHI
;    .
;    .
;    ABC
;    AB
;    A

.model small
.stack 100h
.data

.code
main proc
    mov cx, 10   
    
L1:             
    push cx
    mov dl, 'A'
    
    
L2:
    mov ah, 2
    int 21h
    
    inc dl
    loop L2
    
    mov dx, 10
    mov ah, 2
    int 21h
    
    mov dx, 13
    mov ah, 2
    int 21h
    
    pop cx
    dec cx
    jnz loop L1
    
exit:                                       
  mov ah,4ch
  int 21h
  
main endp
end main