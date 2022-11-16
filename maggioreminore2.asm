
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
    a db ?
    b db ?
    c db ?
    max db ?
    input1 db 'inserisci a',,13,10,'$'
    input2 db 'inserisci b',,13,10,'$'
    input3 db 'inserisci c',,13,10,'$'   
    output db ' e il maggiore',,13,10,'$'
    capo db 13,10,'$'

.code
    .startup 
        mov ax,@data       
        mov ds,ax
        
        mov ah, 09h
        mov dx, offset input1   
        int 21h
        
        mov ah, 01h
        int 21h            
        mov a, al
        
        mov ah, 09h
        mov dx, offset capo       
        int 21h
        
        mov ah, 09h
        mov dx,offset input2      
        int 21h
        
        mov ah,01h
        int 21h                 
        mov b,al
        
        mov ah, 09h
        mov dx, offset capo   
        int 21h
        
        mov ah, 09h
        mov dx,offset input3     
        int 21h
        
        mov ah,01h
        int 21h                 
        mov c,al
        
        mov ah, 09h
        mov dx, offset capo    
        int 21h
        
        mov bl, a
        mov max, bl
                
        mov al, b
        
        cmp al, max
        jg bMaggioreMax
        
        bMinoreMax:
            jmp end
        
        bMaggioreMax:
            mov max, al
            jmp end
        
        end:
        
        mov al, c
        
        cmp al, max
        jg cMaggioreMax
        
        cMinoreMax:
            jmp end1
        
        cMaggioreMax:
            mov max, al
            jmp end1
        
        end1: 
          
        mov ah, 09h
        mov dx, offset capo
        int 21h  
          
        mov ah, 02h
        mov dl, max
        int 21h
        
        mov ah, 09h
        mov dx, offset output
        int 21h
            
        mov ah, 4ch
        int 21h

end





