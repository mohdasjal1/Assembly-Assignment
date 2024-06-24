;Input a string and display it one char per line

.model small
.stack 100h
.data
    msg1 db 'Input a string : $'
    str1a db 20
    str1b db ?
    str1c db 20 dup(?)
    
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msg1
    mov ah, 9
    int 21h 
           
    mov dx, offset str1a       
    mov ah, 10
    int 21h
    
    mov cl, str1b
    mov ch, 0
    
    mov si, offset str1c
    
    call newline 
    
L1:    
    mov dl, [si]
    mov ah,2 
    int 21h
    
    call newline 
    
    inc si
    
    loop L1
    
    
    
    
exit:    
    mov ah, 4ch
    int 21h
    

main endp


newline proc 
    
    mov dx, 10
    mov ah, 2
    int 21h
             
    mov dx, 13         
    mov ah, 2
    int 21h 
    
    ret
    
newline endp       



end main