				       PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 
main 
		LDR r3,=0x20000000

		LDMIA r3!,{r0 ,r1 ,r2}
		
		
stop B stop
	END