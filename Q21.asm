; Print the following:   

; A UBIT
; B UBIT
; C UBIT
; .
; .
; .
; Z UBIT


.model small
.stack 100h
.data   
    
    msg1 db 'UBIT $'
    ;msg3 db ' = $'
    newline db 10, 13, '$'
    input db ? 
    space db ' $'

.code   

main proc
    mov ax, @data
    mov ds, ax
    
    mov dl, 'A'
    
    mov cx, 26
    
    L1:         
        mov ah, 2
        int 21h
        inc dl
        push dx
        
        
        mov dx, offset space
        mov ah, 9
        int 21h
        
        
        mov dx, offset msg1
        mov ah, 9
        int 21h
        
        
        mov dx, offset newline
        mov ah, 9
        int 21h
        
        pop dx
        
        loop L1
        
    
   
exit:
    mov ah, 4ch
    int 21h    
        

main endp    
end main