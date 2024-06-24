; Show following series:

; 0,1,3,6,10,15,21,28,36,45,55 


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
    mov di, 0
    mov si, 0
    mov cx, 11

L1:
    add si, di
    push si
    call dispNum

    cmp cx, 0
    je exit

    mov dl, ','
    mov ah, 2
    int 21h

    inc di

    loop L1


exit:   
    mov ah, 4ch
    int 21h

main endp
end main