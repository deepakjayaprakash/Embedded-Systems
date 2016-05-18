#include <stdio.h>
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "LCD_Driver.h"
#include "Seven_Segment.h"
#include "DrvGPIO.h"

void seg_display(uint16_t value) {
	int8_t digit;
	digit = value / 1000;
	close_seven_segment();
	show_seven_segment(3, digit);
	DrvSYS_Delay(5000);
	
	value = value - digit * 1000;
	digit = value / 100;
	close_seven_segment();
	show_seven_segment(2, digit);
	DrvSYS_Delay(5000);
	
	value = value - digit * 100;
	digit = value / 10;
	close_seven_segment();
	show_seven_segment(1, digit);
	DrvSYS_Delay(5000);
	
	value = value - digit * 10;
	digit = value;
	close_seven_segment();
	show_seven_segment(0, digit);
	DrvSYS_Delay(5000);
}


void displayA() {
	Initial_panel();
	clr_all_panel();
	print_lcd(0, "a");
}

void ab_int_callback(uint32_t a, uint32_t b) {
	if ((a>>15) & 0x01) {
// shift by 15 because its port 15 and then anding with 0x01 //since we need to check if last bit of 'a' is set or not
		displayA();
}
}

void cde_int_callback(uint32_t c, uint32_t d, uint32_t e) {
		if ((c>>15) & 0x01) 
			seg_display(77);
}

int main() {
	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1;
	SYSCLK->CLKSEL0.HCLK_S = 0;
	LOCKREG();
	DrvGPIO_Open(E_GPA, 15, E_IO_INPUT);
	DrvGPIO_Open(E_GPC, 15, E_IO_INPUT);


	DrvGPIO_EnableInt(E_GPA, 15, E_IO_RISING, E_MODE_EDGE); 
// one to print onto lcd
	DrvGPIO_EnableInt(E_GPC, 15, E_IO_RISING, E_MODE_EDGE);
// one to print on 7 seg
	
	DrvGPIO_SetIntCallback(ab_int_callback, cde_int_callback);

// set the callbacks in this way only.

}

	