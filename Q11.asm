; Input a string and then show its size

.model small
.stack 100h
.data                
    
    msg1 db 10, 13, 'Enter a string : $'
    msg2 db 10, 13, 'The size of the given string is : $'
    
    str1a db 20
    str1b db ?
    str1c db 20 dup(?)
    
.code


dispnum proc

    
    mov bp , sp
    add bp , 2
    mov ax , [bp] 
        
    push ax
    push bx
    push cx
    push dx   
    
    mov bx , 10 
    mov cx , 0  
    mov dx , 0 
    
    abc:                                    
    
    div bx
    push dx
    
    mov dx , 0
    inc cx 
    cmp ax , 0
    jnz abc
    
    printloop:
    
    
    pop dx
    add dl , 30h 
    mov ah , 2
    int 21h 
    
    loop printloop
       
    pop dx
    pop cx
    pop bx
    pop ax
    
    ret
    dispnum endp

main proc
    
    mov ax, @data        
    mov ds, ax           
    
    mov dx, offset msg1 
    mov ah, 9
    int 21h 
            
    mov dx, offset str1a            
    mov ah, 10
    int 21h 
    
    mov dx, offset msg2
    mov ah, 9
    int 21h
    
    mov al, str1b
    cbw
    push ax
    
    call dispnum
    
    mov ah, 4ch
    int 21h
    
main endp
end main
                                                





