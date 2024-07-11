;22> Assembly => String  
;    AAsCsEeGmIbKlMyO


.model small
.stack 100h
.data   
    
    msg1 db 'Assembly $'
    newline db 10, 13, '$'    
    space db ' $'

.code   

main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset msg1
    mov bl, 'A'
    mov cx, 8
    
    L1:
        mov dl, [si]
        mov ah, 2
        int 21h
        
        inc si
        
        mov dl, bl
        mov ah, 2
        int 21h
        
        add bl, 2
        
        loop L1
        
    
   
exit:
    mov ah, 4ch
    int 21h    
        

main endp    
end main