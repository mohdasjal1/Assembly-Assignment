;Display given patterns using loops:
; ii)  J J J J J J J J J J
;      I I I I I I I I I
;      .
;      .
;      CCC
;      BB
;      A  

.model small
.stack 100h
.data         
    newline db 10, 13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 10
    mov bl, 'J'
    
L1: 
    push cx
    
L2:       
    mov dl, bl
    mov ah, 2
    int 21h
    loop L2
        
    ;newline  
    mov dx, offset newline
    mov ah, 9
    int 21h  
    
          
    dec bl          
    pop cx
    dec cx
    jnz L1 
    
    
exit:                                       
  mov ah,4ch
  int 21h
  
main endp
end main