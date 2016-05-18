		   ;--------------------
; Set interrupt priority
; - input R0 : IRQ number. E.g., IRQ#0 ¼ 0
; - input R1 : Priority level 
	PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

main 
	
    LDR R0,=0x50004080
    MOVS R1,#255
    STR R1,[R0]
	nop
	nop
stop b stop
   end
