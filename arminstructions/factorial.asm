		     PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
               THUMB     ; Indicate THUMB code is used       
              AREA    |.text|, CODE, READONLY
			   
         EXPORT	 main			 
; Start of CODE area 
main	MOVS	R6,#05	   ; factorial of no 
        MOVS	R4, R6
		 	SUBS	R4,R4,#1
LOOP	
         MOVS R7,R4
		MULS	R7,R6,R7
		MOVS	R6,R7
		SUBS	R4,R4,#1
		BNE			LOOP		

stop	B	stop	; R7 ANSWER
		END	
