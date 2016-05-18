#include <stdio.h>
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "ScanKey.h"

int main() {
	int8_t number;
	UNLOCKREG();
	DrvSYS_Open(48000000);
	LOCKREG();
	
	OpenKeyPad();
	
	DrvGPIO_Open(E_GPC, 12, E_IO_OUTPUT); //For led
	DrvGPIO_Open(E_GPB, 11, E_IO_OUTPUT); //For buzzer
	while(1) {
		number = Scankey();
		if (number == 2) {
			DrvGPIO_ClrBit(E_GPC, 12);
			DrvSYS_Delay(10000);
			DrvGPIO_SetBit(E_GPC, 12);
		} else if (number == 3) {
			DrvGPIO_ClrBit(E_GPB, 11);
			DrvSYS_Delay(10000);
			DrvGPIO_SetBit(E_GPB, 11);
		}
	}
}
			
			