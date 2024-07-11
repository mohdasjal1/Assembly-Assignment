; Input two numbers then show all numbers between these two numbers.

.model small
.stack 100h
.data   
    prompt1 db 10, 13, 'Enter a first number : $'
    prompt2 db 10, 13, 'Enter a second number : $'      
    newline db 10, 13, '$'
    number1 dw 0
    number2 dw 0
    comma db ', $'
    invalid db 'Invalid Input !!$'

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
    
            
    mov bx, 0
    mov cx, 10
    
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
        mov num, bx
               
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
        
        inc cx
        mov dx, 0
        
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
    mov ax, @data
    mov ds, ax
    
    print prompt1
    inputNum number1
    
    print prompt2
    inputNum number2
    
    mov bx, number1
    mov dx, number2
    
    sub dl, bl
    cbw
    dec dx
    mov cx, dx
    
    mov bx, number1
    
    print newline
    
   L1: 
    
    inc bx
    
    push bx
    
    
    
    call dispNum
    
    cmp cx, 1
    je exit
    
    print comma
    
    loop L1
    

    
    
exit:
    mov ah, 4ch
    int 21h    
        

main endp    
end main