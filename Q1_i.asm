.model small
.stack 100h
.data
    msg1 db 'Enter an alphabet : $'
    msg2 db 'The next alphabet is : $'
    newline db 10, 13, '$'
    input db ?
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msg1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov input, al
    
    mov dx, offset newline
    mov ah, 9 
    int 21h
    
    
    mov dx, offset msg2
    mov ah, 9
    int 21h
    
    mov dl, input
    inc dl
       
    
    mov input, dl
    mov ah, 2
    int 21h
    
exit:
    mov ah, 4ch
    int 21h    
    
main endp
end main
    
        