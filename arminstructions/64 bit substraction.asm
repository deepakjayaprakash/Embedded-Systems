		        
;64 bit substraction 

		PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

 
main 	
	LDR r0,=0x00000001 ; X_Low(X = 0x0000000100000001)
	LDR r1,=0x00000001 ; X_High
	LDR r2,=0x00000003 ; Y_Low(Y = 0x0000000000000003)
	LDR r3,=0x00000000 ; Y_High
	SUBS r0,r0,r2 ; lower 32-bit
	SBCS r1,r1,r3 ; upper 32-bit
	          END