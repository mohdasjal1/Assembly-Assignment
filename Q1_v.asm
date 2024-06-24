.model small
.stack 100h
.data   
    msg1 db 'Enter a letter : $'
    ;msg2 db 'Given letter is : $'
    ;msg3 db ' = $'
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
    mov bl, al
    
    mov dx, offset newline
    mov ah, 9 
    int 21h 
    
    mov dl, 'A'   
    
    
    mov ah, 2
    int 21h
    
    cmp bl, dl
    jne L1
    je exit
    
          
    mov cx, 26          


L1:       

    inc dl
    mov ah, 2
    int 21h
          
    cmp dl, bl          
    jne L1
    je exit
    
    
exit:
    mov ah, 4ch
    int 21h    
        

main endp    
end main