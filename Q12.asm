; Input a string and then input a letter, then search this letter in string,if it is not in the string then show not found ,otherwise 
;show letter position in given string.

.model small
.stack 100h
.data
    prompt1 db 10, 13, 'Enter a String : $'

    str1a db 20
    str1b db ?
    str1c db 20 dup(?)
 
    prompt2 db 10, 13, 'Enter a letter : $'

    printFound db 10, 13, 'Not Found $'
    printNotFound db 10, 13, 'the letter is at index : $'

    
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


    ; prompt msg1
    mov dx, offset prompt1
    mov ah, 9
    int 21h

    ; input a string
    mov dx, offset str1a
    mov ah, 10
    int 21h

    ; promt msg2
    mov dx, offset prompt2
    mov ah, 9
    int 21h

    ;input a letter
    mov ah, 1
    int 21h
    mov bl, al

    mov si, offset str1c


L1:
    mov al, [si]
    cmp bl, al
    je Found
    
    cmp al, '$'
    je NotFound

    inc si
    loop L1

Found:

    ; Calculate the position of the found character  
    
    mov dx, si         ; DX now holds the address of the found letter
    sub dx, offset str1c ; Subtract the base address of the string to get the position
    ;inc dx             ; Adjust position to start from 1
   
    push dx            ; Push the position onto the stack  
    

    mov dx, offset printFound
    mov ah, 9
    int 21h     
    
    call dispnum
    
    jmp exit    

NotFound:
    
       
    
    mov dx, offset printNotFound
    mov ah, 9
    int 21h    
    
    
    jmp exit

exit:
    mov ah, 4ch
    int 21h

main endp
end main
