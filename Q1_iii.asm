.model small
.stack 100h
.data
    msg1 db 'Enter a letter : $'
    msg2 db 'given letter : $'
    msg3 db '  $'
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
    
     
    ;mov input, dl
    
    
    mov cx, 100
    
    
L1: 
    mov dl, input   
    mov ah, 2
    int 21h
    
    mov dx, offset msg3
    mov ah, 9
    int 21h
    
    loop L1    
    

    
exit:
    mov ah, 4ch
    int 21h    
    
main endp
end main
    
        