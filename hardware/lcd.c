#include <stdio.h>
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "LCD_Driver.h"

int main() {
	char text[16] = "Welcome to MSRIT";
	UNLOCKREG();
	DrvSYS_Open(48000000);
	LOCKREG();
	
	Initial_panel();
	clr_all_panel();
	
	print_lcd(0, text);
}
	