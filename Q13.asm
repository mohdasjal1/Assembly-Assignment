; Input five strings and then show size of:

; -Largest string
; -Smallest string
; -Total size of all strings  

.model small
.stack 100h
.data
     
    prompt1 db 0Ah,0Dh,'Please input first string:$'
    str1a db 100
    str1b db ?
    str1c db 100 dup(?)  
    msg1 db 0Ah,0Dh,'First string is largest and its size is: $' 
    msg1b db 0Ah,0Dh,'First string is smallest and its size is:$'
    
    prompt2 db 0Ah,0Dh,'Please input second string:$'    
    str2a db 100
    str2b db ?
    str2c db 100 dup(?)
    msg2 db 0Ah,0Dh,'Second string is largest and its size is: $' 
    msg2b db 0Ah,0Dh,'Second string is smallest and its size is:$'                             
    
    prompt3 db 0Ah,0Dh,'Please input third string:$'   
    str3a db 100
    str3b db ?
    str3c db 100 dup(?)
    msg3 db 0Ah,0Dh,'Third string is largest and its size is: $'
    msg3b db 0Ah,0Dh,'Third string is smallest and its size is:$'
    
    prompt4 db 0Ah,0Dh,'Please input fourth string:$'
    str4a db 100
    str4b db ?
    str4c db 100 dup(?)   
    msg4 db 0Ah,0Dh,'Fourth string is largest and its size is: $'
    msg4b db 0Ah,0Dh,'Fouth string is smallest and its size is:$'
    
    prompt5 db 0Ah,0Dh,'Please input fifth string:$'       
    str5a db 100
    str5b db ?
    str5c db 100 dup(?) 
    msg5 db 0Ah,0Dh,'Fifth string is largest and its size is: $'
    msg5b db 0Ah,0Dh,'Fifth string is smallest and its size is:$'        
    
    msgSize db 0Ah,0Dh,'Total size of all strings is:$'
    
     
.code

;.....macro......

printStr macro p1
    lea dx,p1
    mov ah,9
    int 21h
    
endm   

inputStr macro p2
    lea dx,p2
    mov ah,10
    int 21h
    
endm  

dispNum proc
    
    mov bp,sp
    add bp,2
    
    push ax 
    mov ax,[bp]
    
    push bx
    
    push cx
    
    push dx 
    mov bx,0Ah
    mov cx,0
    mov dx,0
    
    dispLoop:
    
    div bx
    push dx
    mov dx,0
    inc cx
    cmp ax,0 
    
    jnz dispLoop
    
    showLoop:
    pop dx
    add dl,30h
    mov ah,2
    int 21h
    
    loop showLoop
    
    pop dx
    pop cx 
    pop bx
    pop ax
    
    ret
    
    dispNum endp   
    
main proc
       mov ax,@data
       mov ds,ax
       
       printStr prompt1 
       inputStr str1a
       
       printStr prompt2
       inputStr str2a
       
       printStr prompt3
       inputStr str3a
       
       printStr prompt4
       inputStr str4a
       
       printStr prompt5
       inputStr str5a   
       
       call large  
                           
       exit:
       mov ah,4ch
       int 21h
       
    
main endp

  
;.....for large 
large proc
    
       mov al,str1b
       mov bl,str2b
       mov cl,str3b
       mov dl,str4b
       
       cmp al,bl 
       
       ja firstLarge 
       jb secondLarge
       
       
       firstLarge:
       cmp al,cl
       ja firstLarge1
       jb secondLarge      
       
       firstLarge1:
       cmp al,dl
       ja firstLarge2
       jb secondLarge1
       
       
       firstLarge2:
       cmp al,str5b
       ja displayFirst
       jb displayFifth
       
       
       displayFirst:
       
       printStr msg1 
       
       mov al,str1b
       cbw
       push ax  
       
       call dispNum
       jmp small    
       
       
       secondLarge:
       
       cmp bl,cl
       ja secondLarge1 
       jb thirdLarge
       
       
       secondLarge1:
       cmp bl,dl
       ja secondLarge2 
      ; jb thirdLarge
       
       
       secondLarge2:
       cmp bl,str5b
       ja displaySecond   
       jb displayFifth
       
       displaySecond:
       
       printStr msg2  
       
       mov al,str2b
       cbw
       push ax
       call dispNum
       
       jmp small
       
       thirdLarge:
       cmp cl,dl
       ja thirdLarge1 
       jb fourthLarge
       
       thirdLarge1:
       cmp cl,str5b
       ja displayThird   
       jb displayFifth  
   
       
       displayThird:
       printStr msg3  
       
       mov al,str3b
       cbw
       push ax
       call dispNum
       
       jmp small  
       
       fourthLarge:
       cmp dl,str5b
       ja displayFourth 
       jb displayFifth
       
       displayFourth:  
       
       printStr msg4
       mov al,str4b
       cbw
       push ax
       call dispNum
       
       jmp small   
       
       
       displayFifth:
       
       printStr msg5 
       mov al,str5b
       cbw
       push ax
       call dispNum
       
       jmp small    
       
       ret  
       
large endp  


;.....for small
small proc
    
       mov al,str1b
       mov bl,str2b
       mov cl,str3b
       mov dl,str4b
       
       cmp al,bl 
       
       ja secondSmall
       jb firstSmall
       
       
       
       firstSmall:
       cmp al,cl
       jb firstSmall1
       ja thirdSmall
       
       firstSmall1:
       cmp al,dl
       jb  firstSmall2 
       ja secondSmall1
       
       
       firstSmall2:
       cmp al,str5b
       jb displayFirstSm
       ja displayFifthSm
       
       displayFirstSm:
       printStr msg1b
       mov al,str1b
       cbw
       push ax
       
       call dispNum
       
       jmp size
              
       
       
       
       secondSmall:
       cmp cl,bl
       ja secondSmall1
       
       secondSmall1:
       cmp dl,bl
       ja secondSmall2 
       jb thirdSmall
       
       secondSmall2:
       cmp str5b,bl
       ja displaySecondSm 
       jb displayFifthSm
       
       displaySecondSm:
       
       printStr msg1b
       mov al,str2b
       cbw
       push ax
       call dispNum
       
       jmp size 
       
       
       
     thirdSmall:
     cmp cl,dl
     jb thirdSmall1
     ja fourthSmall
     
     thirdSmall1:
     cmp cl,str5b
     jb displayThirdSm 
     ja displayFifthSm
     
     displayThirdSm:
     printStr msg3b
     mov al,str3b
     cbw
     push ax
     call dispNum
     
     jmp size    
     
     fourthSmall:
     cmp dl,str5b
     jb displayFourthSm  
     ja displayFifthSm
     
     displayFourthSm:
     printStr msg4b
     mov al,str4b
     cbw
     push ax
     call dispNum
     
     jmp size     
     
     displayFifthSm:
     printStr msg5b
     mov al,str5b
     cbw
     push ax
     
     call dispNum
     
     jmp size
         
  
       ret
       
small endp 



;....total size

size proc  
     
     printStr msgSize
    
     mov al,str1b
     mov bl,str2b
     mov cl,str3b
     mov dl,str4b
     
     add al,bl
     add al,cl
     add al,dl
     add al,str5b
     
     cbw
     push ax
     call dispNum
    
     jmp exit
    
    
    
    
    ret
    
size endp    


end main
      
             