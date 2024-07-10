; Input a number and then show its table.

.model small
.stack 100h
.data
    prompt1 db 'Input a number : $'    
    invalid db 10, 13, 'Invalid input : $'
    table db 10, 13, 'Its table is : $', 10, 13
    number dw 0  
    newline db 10, 13, '$'
    space db ' $'
        
.code  



print macro p1
    mov dx, offset p1
    mov ah, 9
    int 21h
    
endm    

inputNum macro num
    local dgt, warn, done 
    
    push ax
    push bx
    push cx
    
    mov cx, 10
    mov bx, 0
    
    dgt:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je done
        
        cmp al, 48
        jl warn
        
        cmp al, 57
        jg warn
        
        
        sub al, 48
        cbw
        
        xchg ax, bx
        mul cx
        xchg ax, bx
        add bx, ax
        
        jmp dgt
        
    warn:
        print invalid
        mov bx, 0
        
    done:
        mov number, bx
        
        pop cx
        pop bx
        pop ax    
            
        
endm

dispNum proc
    mov bp, sp
    add bp, 2
    
    push ax
    push bx
    push cx
    push dx
    
    mov ax, [bp]
    
    mov bx, 10
    mov cx, 0
    mov dx, 0
    
    calculation:
        div bx
        push dx
        
        mov dx, 0
        inc cx
        
        cmp ax, 0
        jne calculation
        
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
    mov ax, @data
    mov ds, ax
    
    print prompt1
    
    inputNum number 
    
    print newline
    print table    
    print newline
    print newline
    
    mov cx, 10     
    mov ax, number      
    mov bx, 1
    
L1:         
    
    push ax    
    call dispNum
    
    print space
    
    mov dx, 'X'
    mov ah, 2
    int 21h
    
    print space
    
    
    push bx
    call dispNum
    
    print space
    
    mov dx, '='
    mov ah, 2
    int 21h
    
    print space
    
    mov ax, number
    pop bx
    mul bx
    
    push ax
    call dispNum
    
    print newline
          
    mov ax, number          
    inc bx
    
    
    
    loop L1
    
    
    
    
        
main endp
end main
        


exit:
    mov ah, 4ch
    int 21h    
    
main endp
end main
    
        