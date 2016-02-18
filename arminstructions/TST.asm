	PRESERVE8 ; Indicate the code here preserve  
	; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT __main			 
	; Start of CODE area 
__main
		LDR r0,=0xF0000000;
		LDR r2,=0xF0000000;
		TST r0,r2;
		 MRS r3,XPSR;updating only N and Z flags not C
		LDR r0,=0x70000000;
		LDR r2,=0x70000000;
		TST r0,r2;
		 MRS r4,XPSR;updating only N and Z flags not C
stop B stop
    END