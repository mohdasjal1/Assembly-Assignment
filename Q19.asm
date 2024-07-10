;19) Input an alphabet, if it is small then show its equivalent capital letter. If it is capital then show its equivalent small letter. If it is not an alphabet then show error message.

.model small
.stack 100h
.data   
    prompt1 db 'Input an alphabet : $'
    prompt2 db 10, 13, 'Invalid Input! $'
    prompt3 db 'Its equivalent small letter is : $'
    prompt4 db 'Its equivalent capital letter is : $'

.code

print macro p1
    
    mov dx, offset p1
    mov ah, 9
    int 21h    
        
endm        

newline proc
    
    mov dx, 10
    mov ah, 2
    int 21h
    
    mov dx, 13
    mov ah, 2
    int 21h
        
    ret
newline endp
        
main proc
    mov ax, @data
    mov ds, ax    
     
    print prompt1 
    
    mov ah, 1
    int 21h   
    mov dl, al
    
check_capital:
    cmp dl, 65
    jb check_small
    cmp dl, 90
    jbe is_capital
     
     
check_small:
    cmp dl, 97
    jb error
    cmp dl, 122
    jbe is_small
    
is_capital:   
    add dl, 32
    push dx
    
    call newline
    print prompt3
    
    pop dx    
    mov ah, 2
    int 21h
    
    jmp exit
is_small:       
       
    sub dl, 32      
    push dx
    
    call newline 
    print prompt4
    
    pop dx    
    
    mov ah, 2
    int 21h
    
    jmp exit      
    
error:
    print prompt2
    
        
    
    
exit:
    mov ah, 4ch
    int 21h    
    
    
    ;65 - 90  A - Z  , 97 - 65 = 32
    ;97 - 122 a - z
    
     
    
    
main endp  


end main
