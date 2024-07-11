; Input a number and then show all numbers from 1 to that number.

.model small
.stack 100h
.data
    prompt1 db 'Input a number : $'
    newline db 10, 13, '$'
    space db ' $' 
    comma db ', $'
    invalid db 'Invalid input !!!$'
    number dw 0
    

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
    
    inputNum number 
    cmp number, 0
    je exit
    
    print newline
    
    mov cx, number
    push cx
    mov bl, 1
    
  L1:
    mov dl, bl
    cbw
    push dx
    call dispNum
    
    cmp cx, 1
    je exit
    
    
          
    push dx      
          
    print comma
          
    pop dx          
    inc bl 
    
    loop L1
    
    
    
    exit:
        mov ah, 4ch
        int 21h
    
     
 
main endp
end main