          PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 
main 
     ldr r1, =0x50004080
	 ldr r2, =0x08
	 ldr r3, =0x01
	 lsls r4, r3, #30
	 
	 str r4, [r1]
	 ldr r4, =0x0f
	 adds r1, r1,r2
	 str r4, [r1]	
stop  b   stop
       end