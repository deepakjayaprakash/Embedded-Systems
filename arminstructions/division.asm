			   	 	;extrating data          



	PRESERVE8 ; Indicate the code here preserve  
; 8 byte stack alignment         
                     THUMB     ; Indicate THUMB code is used       
                 AREA    |.text|, CODE, READONLY
			   
              EXPORT main			 
; Start of CODE area 

main 
; simple_divide
; Inputs
; R0 dividend
; R1 divider
; Outputs
; R0 quotient
; R1 remainder
	MOVS r0,#4
	MOVS R1,#3
;	PUSH {R2-R4} ; Save registers to stack
	MOV R2, R0 ; Save dividend to R2 as R0 will be changed
	MOVS R3, #0x1 ; loop control
	LSLS R3, R3, #31 ; N ¼ 0x80000000
	MOVS R0, #0 ; initial Quotient
	MOVS R4, #0 ; initial Tmp
simple_divide_loop
	LSLS R2, R2, #1 ; Shift dividend left by 1 bit, MSB go into carry
	ADCS R4, R4, R4 ; Shift Tmp left by 1 bit, carry move into LSB
	CMP R4, R1
	BCC simple_divide_lessthan
	ADDS R0, R0, R3 ; Increment quotient
	SUBS R4, R4, R1
simple_divide_lessthan
	LSRS R3, R3, #1 ; N ¼ N >> 1
	BNE simple_divide_loop
	MOV R1, R4 ; Put remainder in R1, Quotient is already in R0
;	POP {R2-R4}; Restore used register
;    BX lr
	 ; Return
stop    b stop 	
    end