;program to use compare  and branch less than 		        



		PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

 
main 	
			LDR	R0,=0X00000001
			LDR	R1,=0X00000002
strt3			cmp r0,#10
			ble start2
			movs r0,#0
			b stop
start2		adds r0,r0,#1			
			b strt3
		LDR	R0,=0X00000001
			LDR	R1,=0Xf0000002
strt31			cmp r1,#10
			bmi start21
			movs r0,#0
			b stop
start21		adds r0,r0,#1			
			b strt31
			
			
stop	      B	   stop		 		;stop program
	          END      