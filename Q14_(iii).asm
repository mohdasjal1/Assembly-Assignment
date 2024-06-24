; Show following series:

; 128,64,32,16,8,4,2,1


.model small
.stack 100h
.data

.code

dispNum proc

    mov bp, sp
    add bp, 2
    mov ax, [bp]

    push ax
    push bx
    push cx 
    push dx

    mov bx, 10
    mov cx, 0
    mov dx, 0

calculation:
    div bx
    push dx

    mov dx, 0
    inc cx
    cmp ax, 0

    jnz calculation

printLoop:
    pop dx  
    add dl, 30h
    mov ah, 2
    int 21h

    loop printLoop

    pop dx
    pop cx
    pop bx
    pop ax

    ret     
dispNum endp


main proc
    mov ax, 256
    mov bx, 2
    mov cx, 8

divNum:
    mov dx, 0
    div bx
    push ax

    call dispNum
 
    cmp cx, 1
    je exit

    mov dl, ','
    mov ah, 2
    int 21h
    
    pop ax
    
    loop divNum  

exit:                                                                                                                           
    mov ah, 4ch
    int 21h

main endp
end main