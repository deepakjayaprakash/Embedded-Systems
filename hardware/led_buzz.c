#include <stdio.h>
#include "Driver\DrvGPIO.h"
#include "Driver\DrvSYS.h"

void intCallback() {
	DrvGPIO_ClrBit(E_GPC, 12);   // led gpc 12
	DrvGPIO_ClrBit(E_GPB, 11);    //buzzer
	DrvSYS_Delay(10000);
	DrvGPIO_SetBit(E_GPC, 12);
	DrvGPIO_SetBit(E_GPB, 11);
	DrvSYS_Delay(10000);
}

int main() {
	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1;
	SYSCLK->CLKSEL0.HCLK_S = 0;
	LOCKREG();
	
	DrvGPIO_Open(E_GPC, 12, E_IO_OUTPUT); //Led is connected to port C12
	DrvGPIO_Open(E_GPB, 11, E_IO_OUTPUT); //Buzzer is connected to port B11
	DrvGPIO_Open(E_GPB, 15, E_IO_INPUT); //Interrupt pin is gpB15
	
	DrvGPIO_EnableEINT1(E_IO_BOTH_EDGE, E_MODE_EDGE, intCallback);
	while(1) {
	}
}
