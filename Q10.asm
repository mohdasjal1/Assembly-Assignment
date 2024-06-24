.model small
.stack 100h
.data
  prompt db 0Ah,0Dh,'Please input first string:$'   
  prompt1 db 0Ah,0Dh,'Please input second string:$'
  prompt2 db 0Ah,0Dh,'Please input third string:$' 
  
  msg1 db 0Ah,0Dh,'First string is larger$'
  msg2 db 0Ah,0Dh,'Second string is larger$'
  msg3 db 0Ah,0Dh,'Third string is larger$'
  msg4 db 0Ah,0Dh,'All strings are equal$'
  
  str1a db 20
  str1b db ?
  str1c db 20 dup(?)
  
  str2a db 20
  str2b db ?
  str2c db 20 dup(?)  
  
  str3a db 20
  str3b db ?
  str3c db 20 dup(?)
  
.code
main proc
    mov ax,@data
    mov ds,ax  
    
    lea dx,prompt
    mov ah,9
    int 21h
    
    lea dx,str1a
    mov ah,0Ah
    int 21h   
    
    lea dx,prompt1
    mov ah,9
    int 21h
    
    lea dx,str2a
    mov ah,0Ah
    int 21h 
    
    lea dx,prompt2
    mov ah,9
    int 21h
    
    lea dx,str3a
    mov ah,0Ah
    int 21h       
    
    mov bl,str1b
    mov dl,str2b     
    mov cl,str3b
    
    cmp bl,dl 
    je check
    ja firstLarge
    jb secondLarge
    
    
    check:
    cmp bl,cl
    je equal
    ja firstLarge
    jb secondLarge
    
    
    firstLarge:
    cmp bl,cl   
    ja displayFirst
    jb thirdLarge
    
    
    
    displayFirst:
    lea dx,msg1
    mov ah,9
    int 21h     
    
    jmp exit
    
    secondLarge:
    cmp dl,cl
    ja displaySecond
    jb thirdLarge
    
    displaySecond:
    lea dx,msg2
    mov ah,9
    int 21h  
    
    jmp exit
    
    thirdLarge:
      lea dx,msg3
      mov ah,9
      int 21h 
      
      jmp exit
    
    equal:
    lea dx,msg4
    mov ah,9
    int 21h
    
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    
      
main endp
end main