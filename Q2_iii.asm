;Draw following series using loops:
;A a B b C c D d . . . X x Y y Z z


.model small
.stack 100h
.data

.code

main proc      
    
    mov dl, 'A'    
    mov cx, 26
    
L1: 
    mov ah, 2
    int 21h
    
    add dl, 32
    
    mov ah, 2
    int 21h
         
    sub dl, 31
    
    loop L1    
    
    
exit:
    mov ah, 4ch 
    int 21h    
    
end main
main endp    