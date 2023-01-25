
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



org 100h

.data
    
    car db ?    ;contatori cicli 
    var db ?
    
    MAI db 30h
    MIN db 30h
          
    input1 db 'inserire il numero di caratteri da analizzare: ', '$'
    input db 'inserisci un carattere: ', '$'
    output1 db 'caratteri maiuscoli: ', '$'
    output2 db 'caratteri minuscoli: ', '$'
    acapo db ,13,10,'$'
    
.code
    .startup 

        mov ax, @data    
        mov ds, ax


        inizio: 
            
            mov ah, 09h
            mov dx, offset input1    ;visualizzazione stringa di input
            int 21h 
            
            mov ah, 01h             
            int 21h 
            mov car, al                ;richiesta input 
            
            mov ah,09h
            mov dx, offset acapo               
            int 21h 
            
            mov al, car
        
            cmp al, '0'                            
            jge Vero1                               
            jmp inizio  
               
            vero1:
                cmp al,'9'
                jle vero2
                jmp inizio 
                
            vero2:
                cmp car,'0'
                je vero3
                jmp fine 
            
            inizio2:

            vero3:
                mov ah, 09h
                mov dx, offset input    ;visualizzazione stringa di input
                int 21h 
            
                mov ah, 01h             
                int 21h 
                mov var, al                ;richiesta input 
            
                mov ah,09h
                mov dx, offset acapo               
                int 21h 
                
                mov al, var             
            
                dec car
            
                cmp al, 'Z'                        
                jle Vero4                         
                jmp Falso2
                 
            Vero4:                                 
                inc MAI                           
                jmp inizio2                                                   
                                                   
            falso2:                                 
                inc MIN                           
                jmp inizio2   
                
            fine:
                mov ah,09h
                mov dx, offset acapo               
                int 21h         
        
                mov ah, 09h
                mov dx, offset output1           ;output stringa di output maiuscole
                int 21h
        
                mov ah, 02h
                mov dl, MAI                       ;output contatore maiuscole
                int 21h
        
                mov ah, 09h
                mov dx, offset acapo               
                int 21h
        
                mov ah, 09h
                mov dx, offset output2           ;output stringa di output minuscole
                int 21h
        
                mov ah, 02h                        ;output contatore minuscole
                mov dl, MIN
                int 21h    
        
        
                

ret

                
                
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        



      





