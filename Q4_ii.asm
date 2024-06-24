;Define a string 'Computer' and then show it in given series using loops:

; ii) CZoYmXpWuVtUeTrS   (Alphabets in reverse order after each character)  



.model small
.stack 100h
.data         
    msg1 db 'Computer$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 8
    mov bl, 'Z'
    mov si, offset msg1
    
L1: 
    mov dl, [si]
    mov ah, 2
    int 21h
    
    inc si
    
    mov dl, bl
    mov ah, 2
    int 21h
    dec bl
    
    loop L1
    
    
    
exit:                                       
  mov ah,4ch
  int 21h
  
main endp
end main