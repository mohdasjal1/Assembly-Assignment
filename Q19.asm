;19) Input an alphabet, if it is small then show its equivalent capital letter. If it is capital then show its equivalent small letter. If it is not an alphabet then show error message.

.model small
.stack 100h
.data   
    prompt1 db 'Input an alphabet : $'
    prompt2 db 10, 13, 'Invalid Input! $'

    

.code
    
    
main proc
    mov ax, @data
    mov ds, ax    
    
    mov dx, offset prompt1
    mov ah, 9
    int 21h 
    
    
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
    mov ah, 2
    int 21h
    
    jmp exit
is_small:       
       
    sub dl, 32      
    mov ah, 2
    int 21h
    
    jmp exit      
    
error:
    mov dx, offset prompt2
    mov ah, 9
    int 21h 
    
        
    
    
exit:
    mov ah, 4ch
    int 21h    
    
    
    ;65 - 90  A - Z   32
    ;97 - 122 a - z
    
     
    
    
main endp  


end main