		 ;Program using loop       


		PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

 
main 	
		MOVS R0, #5 ; Loop counter
loop
		SUBS R0, R0, #1 ; Decrement loop counter
		BNE loop ; if result is not 0 then branch to loop
	          END