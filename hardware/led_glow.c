#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvSYS.h"

void intCallback() {
	DrvGPIO_ClrBit(E_GPC, 15);
	DrvSYS_Delay(10000);
	DrvGPIO_SetBit(E_GPC, 15);
	DrvSYS_Delay(10000);
}

int main() {
	UNLOCKREG();
	DrvSYS_SetOscCtrl(E_SYS_XTL12M, 1);
	DrvSYS_SelectHCLKSource(0);
	LOCKREG();
	
	DrvGPIO_Open(E_GPC, 15, E_IO_OUTPUT); 	//LED connected to pin C15
	 
	DrvGPIO_Open(E_GPB, 15, E_IO_INPUT);		//Interrupt given on pin B15
	DrvGPIO_EnableEINT1(E_IO_BOTH_EDGE, E_MODE_EDGE, intCallback);

	while(1) {
	}
}
