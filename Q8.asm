;input two strings them show :
;both are in size OR First is larger OR Second is larger

.model small
.stack 100h
.data    
    prompt1 db 'Input 1st string : $'
    prompt2 db 10, 13, 'Input 2nd string : $' 
    
    str1a db 20
    str1b db ?
    str1c db 20 dup(?)
    
    str2a db 20
    str2b db ?
    str2c db 20 dup(?)
    
    msg1 db 10, 13, 'The size of both the strings are equal$' 
    msg2 db 10, 13, 'Size of the first string is larger$' 
    msg3 db 10, 13, 'Size of the second string is larger$' 
    

.code
        
        
print macro string
    mov dx, offset string
    mov ah, 9
    int 21h
    
endm


main proc
    mov ax, @data
    mov ds, ax
    
    
    ;prompt 1st msg
    print prompt1  
    
    ;input String1
    mov dx, offset str1a
    mov ah, 10
    int 21h
    
    ;prompt 2nd msg
    print prompt2
    
    ;input string2
    mov dx, offset str2a
    mov ah, 10
    int 21h
    
    mov bl, str1b
    mov dl, str2b
    cmp dl, bl
    je equal
    jl first
    jg second
    
equal:
    mov dx, offset msg1
    mov ah, 9
    int 21h
    
    jmp exit 
    
    
first:   
    mov dx, offset msg2
    mov ah, 9
    int 21h 
    
    jmp exit 
    
second:
    mov dx, offset msg3
    mov ah, 9
    int 21h
    
    jmp exit     
    
    
exit:
    mov ah, 4ch
    int 21h    
    
    
main endp
end main