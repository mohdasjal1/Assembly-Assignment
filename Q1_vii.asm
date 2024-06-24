; Draw following series using loops:
; i) Z Y X . . . C B A

.model small
.stack 100h
.data
    msg1 db ' .$'

.code

main proc      
    mov ax, @data
    mov ds, ax
    
    mov dl, 'Z'    
    mov cx, 26
    
L1: 
    mov ah, 2
    int 21h     
    dec dl
    
    loop L1    
    
    
exit:
    mov ah, 4ch 
    int 21h    
    
end main
main endp    