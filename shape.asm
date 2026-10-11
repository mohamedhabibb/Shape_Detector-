org 100h



.model small

.data 

    

    msg1 db 10,13,'Enter Number of points > 2 ... $'

    msg2 db 10,13,'Square...  $' 

    msg3 db 10,13,'rectangle...  $' 

    msg4 db 10,13, 'This is TRIANGLE....  $'
    msg5 db 10,13, 'UNKNOWN.....$'
    msg6 db 10,13, 'RECTANGALE OR SQUARE....  $' 
    v1 db ?
    v2 db ?
    v3 db ?
    v4 db ?
     
      

    

.code

main proc  

   mov ax,@data    

    mov ds,ax

    

    mov dx,offset msg1 

    mov ah,9

    int 21h  

    

    mov ah,1       

    int 21h  

    

    mov bl,al   

    mov cl,34h  

    

    cmp bl,cl 

    


    je eq4 
    
    jl TRIANGLE
      
    
     lea dx,msg5

    mov ah,9

    int 21h
     
    mov ah,4ch 

    int 21h     

    

   eq4:

    lea dx,msg6

    mov ah,9
                                     
    int 21h 
    
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     
      mov bl,al
   
      
      
       
    ;
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h 
    mov ah,2
    mov dl,')'
    int 21h 
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     
     mov bh,al
     sub bl ,bh       
     
     
    ;
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h 
    mov ah,2
    mov dl,')'
    int 21h 
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h
    
    mov cl,al
    
    
    mov ah,2
    mov dl,')'
    int 21h 
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h
    
     mov ch ,al
      sub cl ,ch
      
    mov ah,2
    mov dl,')'
    int 21h
    
    
    
       
    mov ah,2
    mov dl,bl
    int 21h
    
    
       
    mov ah,2
    mov dl,cl
    int 21h  
    
    
    
     
    
    
     
   
    cmp bl ,cl 
    
    
    je square
    
   
    lea dx,msg3

    mov ah,9

    int 21h 
    
      
     mov ah,0h
    mov al ,13h
    int 10h
    mov ah,0ch
    mov cx,80
    mov dx,10
    mov al,38
    
    mov bl,100
    l1:int 10h 
    inc cx
    dec bl
    jnz l1 
    mov bl,50
    l2: inc dx
    dec bl
    int 10h
    jnz l2
    mov bl,100
    l3:dec cx
    dec bl
    int 10h
    jnz l3
    mov bl,50
    l4:dec dx
    dec bl
    int 10h
    jnz l4
    
    
    

    mov ah,4ch 

    int 21h
    
    
    
    
    square:
    lea dx,msg2

    mov ah,9

    int 21h 
       
     
     mov ah,0h
    mov al ,13h
    int 10h
    mov ah,0ch
    mov cx,80
    mov dx,10
    mov al,38
    
    mov bl,100
    ll1:int 10h 
    inc cx
    dec bl
    jnz l1 
    mov bl,100
    ll2: inc dx
    dec bl
    int 10h
    jnz l2
    mov bl,100
    ll3:dec cx
    dec bl
    int 10h
    jnz l3
    mov bl,100
    ll4:dec dx
    dec bl
    int 10h
    jnz l4
      
      
      
    mov ah,4ch 
    int 21h   
    

    TRIANGLE:

    lea dx,msg4

    mov ah,9

    int 21h 
    
    mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h 
    mov ah,2
    mov dl,')'
    int 21h 
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h 
    mov ah,2
    mov dl,')'
    int 21h
    
     mov ah,2
    mov dl,'('
    int 21h
    mov ah,1
    int 21h
     mov ah,2
    mov dl,','
    int 21h   
    mov ah,1
    int 21h 
    mov ah,2
    mov dl,')'
    int 21h 
    
    mov ax,0600h
    mov bh,07h
    int 10h
    mov ax,013h
    int 10h
    mov cx ,10
    mov dx,100
    mov bx ,35
    push bx
    mov bx,60
    push bx
    pop bx                                        
line1:
mov ah,0ch    
mov al,02ch
int 10h
inc cx
cmp cx,bx
jnz line1

pop bx

line2:
int 10h
dec cx
dec dx
cmp cx,bx
jnz line2


line3:
int 10h
inc dx
dec cx
cmp cx,10
jnz line3      
    

    mov ah,4ch 

    int 21h 



main endp

    



ret