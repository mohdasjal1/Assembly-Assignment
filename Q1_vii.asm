;Input a character and then show is it a digit or a capital letter or a small letter
.model small
.stack 100h
.data
    msg db 'Enter a character: $'
    digit_msg db 'It is a digit.$'
    capital_msg db 'It is a capital letter.$'
    small_msg db 'It is a small letter.$'
    other_msg db 'It is neither a digit nor a letter.$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display prompt message
    lea dx, msg
    mov ah, 09h
    int 21h
    
    ; Read a character input
    mov ah, 01h
    int 21h
    mov bl, al
    
    ; Check if it's a digit (ASCII codes 48 to 57)
    cmp bl, 48
    jb check_uppercase
    cmp bl, 57
    jbe is_digit
    
    ; Check if it's a capital letter (ASCII codes 65 to 90)
    check_uppercase:
    cmp bl, 65
    jb check_lowercase
    cmp bl, 90
    jbe is_capital
    
    ; Check if it's a small letter (ASCII codes 97 to 122)
    check_lowercase:
    cmp bl, 97
    jb not_digit_or_letter
    cmp bl, 122
    jbe is_small
    
    ; If it's not a digit, capital letter, or small letter
    not_digit_or_letter:
    lea dx, other_msg
    jmp exit
    
    is_digit:
    lea dx, digit_msg
    jmp exit
    
    is_capital:
    lea dx, capital_msg
    jmp exit
    
    is_small:
    lea dx, small_msg
    
    exit:
    mov ah, 09h  ; Print the message
    int 21h
    
    mov ah, 4ch  ; Terminate the program
    int 21h
main endp
end main
