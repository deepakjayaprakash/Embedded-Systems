	 	;extrating data          



	PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

main 
	ldr r1,=0x0000000e	 ;0000 0000 0000 0000 0000 0000 0000 1110
	 lsls r1,r1,#(32-3)  ;if extraction starts at 0th posion (n+1)
	 lsrs r1,r1,#31		  ; rotate right so that 
	  
	ldr r0,=0x0000f000;
  lsls  r0,r0,#(32-16);		   ;0000 0000 0000 0000 1111 0000 0000 1110
	;lsls  r0,r0,#(32-4-12)	;shift left32-w-p
	lsrs r0,r0,#(32-4)	   ; shift right 32-w
					   
	ldr r3,=0xfffffeee	 ;	 1111 1111 1111 1111 1111 1111 1111
	 ldr r1,=0x0C
	 ldr  r0, =0x4
    rors r3, r3,r1		;right rotate so that 0-12 bits are shifted 
	lsrs r3, r3, r0
	ldr r2,=16
	rors r3,r3,r2
	;rors r0, r0, #(32-12-4)

	 ;lsrs r0,r0,#(32-4)
stop b stop 	
    end