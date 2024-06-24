;Define a string 'Computer' and then show it in given series using loops:

; iv) rZaeYbtXcuWdpVemUfoTgCSh (Both 'Computer and capital alphabets in reverse order but small alphabets in order after both characters)



.model small
.stack 100h
.data         
    msg1 db 'Computer$'
    msg2 db 'abcdefgh$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 8
    mov bl, 'Z'     
    mov si, offset msg1
    
L1: 
    mov dx, [si]
    push dx
    inc si
    loop L1
     
     
    mov si, offset msg2
     
    mov cx, 8
    
L2:    
    pop dx
    mov ah, 2
    int 21h
    
    mov dl, bl
    mov ah, 2
    int 21h
    dec bl
    
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    
    loop L2
    
    
    
exit:                                       
  mov ah,4ch
  int 21h
  
main endp
end main