; Show following series:

; 30,0,27,3,24,6....6,24,3,27,0,30



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
  
    mov si, 30
    mov di, 0
    mov bx, 0
    mov cx, 11
    
L1: 
    ;print   
    add di, si
    push si
    call dispNum
    sub si, 3
    
    ; Seperation
    mov dl, ','
    mov ah, 2
    int 21h
    
    mov dl, ' '
    mov ah, 2
    int 21h
    
    ;print
    add di, bx
    push bx 
    call dispNum
    add bl, 3
    
    cmp cx, 1
    je exit
    
    ; Seperation
    mov dl, ','
    mov ah, 2
    int 21h
    
    mov dl, ' '
    mov ah, 2
    int 21h    
    
    loop L1

exit:                                                                                                                           
    mov ah, 4ch
    int 21h

main endp
end main