; Show following series:

; 7's Table
; 7x1=7
; 7x2=14
; .
; .
;
; 7x10=70


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
    mov ax, 7
    mov bx, 1
    mov cx, 10

L1:
    ;number
    push ax
    call dispNum    

    ;extras
    mov dl, ' '
    mov ah, 2
    int 21h

    mov dl, 'X'
    mov ah, 2
    int 21h

    mov dl, ' '
    mov ah, 2
    int 21h

    ;multiplier
    push bx
    call dispNum
    
    ;extras
    mov dl, ' '
    mov ah, 2
    int 21h

    mov dl, '='
    mov ah, 2
    int 21h   
    
    mov dl, ' '
    mov ah, 2
    int 21h
    
    ;calulation
    mov ax, 7
    pop bx
    mul bx
    push ax
    call dispNum
    pop ax
    
    ;newline
    mov dl, 10
    mov ah, 2
    int 21h
    
    mov dl, 13
    mov ah, 2
    int 21h
    
    mov ax, 7
    inc bx 
    
    loop L1   

exit:                                                                                                                           
    mov ah, 4ch
    int 21h

main endp
end main