#include <stdio.h>
#include "Seven_Segment.h"
#include "Driver\DrvADC.h"
#include "Driver\DrvSYS.h"

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
	
int main() {
	uint16_t value;
	
	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1; 
// you can use DrvSYS_SetOscCtrl instead of this
	SYSCLK->CLKSEL0.HCLK_S = 0;
	LOCKREG();
	
	DrvADC_Open(ADC_SINGLE_END, ADC_SINGLE_OP, 0x80, INTERNAL_HCLK, 1);
	while(1) {
		DrvADC_StartConvert();
		while(DrvADC_IsConversionDone() == FALSE);
		value = ADC->ADDR[7].RSLT & 0xFFF;
		seg_display(value);
	}
}