;20>Input any letter,then show 'UBIT' equivalent to its ASCII value

.model small
.stack 100h
.data   
    msg1 db 'Enter a letter : $'
    msg2 db 'UBIT $'
    ;msg3 db ' = $'
    newline db 10, 13, '$'
    input db ?

.code   

main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msg1
    mov ah, 9
    int 21h 
    
    mov ah, 1
    int 21h
    
    mov bl, al
    
    mov cl, bl
    mov ch, 0
    
    L1:
        mov dx, offset newline
        mov ah, 9
        int 21h   
        
        
        mov dx, offset msg2
        mov ah, 9
        int 21h
              
        loop L1
   
exit:
    mov ah, 4ch
    int 21h    
        

main endp    
end main