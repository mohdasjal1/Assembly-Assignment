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
