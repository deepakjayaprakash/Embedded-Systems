			  	;copy 100locations uing substract counter         



	PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

main   
			   LDR r0, = 0x00000000 ; Source address
	LDR r1, =0x20000000 ; Destination address
	LDR r2,=100 ; number of bytes to copy, also
copy_loop ; acts as loop counter
	SUBS r2, r2, #1 ; decrement offset and loop counter
	LDRB r4,[r0, r2] ; read 1 byte
	STRB r4,[r1, r2] ; write 1 byte
	BNE copy_loop ; loop until all data copied
stop  B   stop
     END