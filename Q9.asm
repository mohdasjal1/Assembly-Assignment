;Input a string and then show letter "a" after each character

.model small
.stack 100h
.data    
    prompt db 'Enter a string : $'
    str1a db 20
    str1b db ?
    str1c db 20 dup(?) 
    newline db 10, 13, '$'
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset prompt
    mov ah, 9
    int 21h
    
    
    ;input
    mov dx, offset str1a
    mov ah, 10
    int 21h
    
    mov si, offset str1c
    
    mov cl, str1b
    mov ch, 0     
     
    mov dx, offset newline
    mov ah, 9
    int 21h  
    

L1:    
    mov dl, [si]
    mov ah, 2
    int 21h             
    
    inc si
    
    mov dl, 'a'
    mov ah, 2
    int 21h 
    
    loop L1
    
    
exit:
    mov ah, 4ch
    int 21h    
    
    
main endp
end main