;Input any capital letter and then show all capital letters
; from Z to given input in reverse order 


.model small
.stack 100h
.data
    msg1 db 'Enter a capital letter letter : $'
    msg2 db 'Given letter is : $'
    newline db 10, 13, '$'       
    input db ?
    

.code                    

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, offset msg1 
    mov ah, 9     
    int 21h 
           
   ;input       
    mov ah, 1
    int 21h
    mov input, al
    
   ;newline 
    lea dx, newline
    mov ah, 9
    int 21h
    
   ;putting Z 
    
    mov bl, input
    mov dl, 'Z'
    
   ;printing Z
    mov ah, 2
    int 21h
    
    cmp dl, bl
    je exit
    
    mov cx, 26
    
L1: 
    dec dl
    mov ah, 2
    int 21h
    
    cmp dl, bl    
    je exit   
    
    loop L1
        
    
    
exit:
    mov ah, 4ch
    int 21h    
    
    
    
end main
main endp    
    
