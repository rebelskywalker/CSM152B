#include <stdio.h>
#include "platform.h"
#include <stdlib.h>
#include <string.h>
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_cache.h"
#include "xparameters.h"
#include <unistd.h>

int readKey();
int readKeyAndSetDisplay(char *name);
void initialize();
int takeInput();
int takeInputKeypad();

XGpio KGR_0;
XGpio KGR_1;
XGpio KGR_2;
XGpio KGR_3;
XGpio KGC_0;
XGpio KGC_1;
XGpio KGC_2;
XGpio KGC_3;

//int main(void) {
//	initialize();
//	init_platform();
//	char name;
//	xil_printf("Starting...\n");
//	while(1) {
//		name = readKey();
//		if((name >= '0') && (name <= '9')) {
//			xil_printf("Entered: %c\n", name);
//			int i;
//			for(i=0; i<1E5; ++i) {}
//		}
//
//	}
//	return 0;
//}

int takeInputKeypad() {
	char name;
	while(1) {
		name = readKey();
		if((name >= '0') && (name <= '9')) {
			xil_printf("Entered: %c\n", name);
			switch (name) {
				case '1':
					return 1;
				case '2':
					return 2;
				case '3':
					return 3;
			}
			// int i;
			// for(i=0; i<1E5; ++i) {}
		}

	}
	return 0;
}

int main()
{
	initialize();
	init_platform();
	xil_printf("Starting...\n");

    int pc, keypad;

    while(1){
    	xil_printf("Rock Paper Scissors:\n");
    	pc = takeInput();
    	keypad = takeInputKeypad();


    	if (pc == 1 && keypad == 2){
    		xil_printf("FPGA won! paper > rock\n");
    	}
    	else if (pc == 1 && keypad == 3){
    		xil_printf("PC won! rock > scissors\n");
    	}
    	else if (pc == 1 && keypad == 1){
			xil_printf("It's a tie! rock == rock\n");
		}
    	else if (pc == 2 && keypad == 1){
			xil_printf("PC won! paper > rock\n");
		}
    	else if (pc == 2 && keypad == 2){
			xil_printf("It's a tie! paper == paper\n");
		}
    	else if (pc == 2 && keypad == 3){
			xil_printf("FPGA won! scissors > paper\n");
		}
    	else if (pc == 3 && keypad == 1){
			xil_printf("FPGA won! rock > scissors\n");
		}
		else if (pc == 3 && keypad == 2){
			xil_printf("PC won! scissors > paper\n");
		}
		else if (pc == 3 && keypad == 3){
			xil_printf("It's a tie! scissors == scissors\n");
		}
		else{
			xil_printf("Error -> pc = %d keypad = %d\n", pc, keypad);
		}
    }

    return 0;
}

void initialize() {
//	KGC_0.BaseAddress = XPAR_XPS_GPIO_0_BASEADDR;
//	KGC_1.BaseAddress = XPAR_XPS_GPIO_1_BASEADDR;
//	KGC_2.BaseAddress = XPAR_XPS_GPIO_2_BASEADDR;
//	KGC_3.BaseAddress = XPAR_XPS_GPIO_3_BASEADDR;
//	KGR_0.BaseAddress = XPAR_XPS_GPIO_4_BASEADDR;
//	KGR_1.BaseAddress = XPAR_XPS_GPIO_5_BASEADDR;
//	KGR_2.BaseAddress = XPAR_XPS_GPIO_6_BASEADDR;
//	KGR_3.BaseAddress = XPAR_XPS_GPIO_7_BASEADDR;

	XGpio_Initialize(&KGC_0, XPAR_XPS_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection (&KGC_0, 1, 0x0);

	XGpio_Initialize(&KGC_1, XPAR_XPS_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection (&KGC_1, 1, 0x0);

	XGpio_Initialize(&KGC_2, XPAR_XPS_GPIO_2_DEVICE_ID);
	XGpio_SetDataDirection (&KGC_2, 1, 0x0);

	XGpio_Initialize(&KGC_3, XPAR_XPS_GPIO_3_DEVICE_ID);
	XGpio_SetDataDirection (&KGC_3, 1, 0x0);

	XGpio_Initialize(&KGR_0, XPAR_XPS_GPIO_4_DEVICE_ID);
	XGpio_SetDataDirection (&KGR_0, 1, 0x1);

	XGpio_Initialize(&KGR_1, XPAR_XPS_GPIO_5_DEVICE_ID);
	XGpio_SetDataDirection (&KGR_1, 1, 0x1);

	XGpio_Initialize(&KGR_2, XPAR_XPS_GPIO_6_DEVICE_ID);
	XGpio_SetDataDirection (&KGR_2, 1, 0x1);

	int status = XGpio_Initialize(&KGR_3, XPAR_XPS_GPIO_7_DEVICE_ID);
	XGpio_SetDataDirection (&KGR_3, 1, 0x1);

}

// keytable is determined as follows (indices shown in Keypad position below)
// 12 13 14 15
// 8  9  10 11
// 4  5  6  7
// 0  1  2  3
char KEY_NAMES[3] = "123";


int readKey() {
	char name;
	XGpio_DiscreteWrite(&KGC_0, 1, 0);
	XGpio_DiscreteWrite(&KGC_1, 1, 0);
	XGpio_DiscreteWrite(&KGC_2, 1, 0);
	XGpio_DiscreteWrite(&KGC_3, 1, 1);

	int read0 = XGpio_DiscreteRead(&KGR_0, 1);
	int read1 = XGpio_DiscreteRead(&KGR_1, 1);
	int read2 = XGpio_DiscreteRead(&KGR_2, 1);
	int read3 = XGpio_DiscreteRead(&KGR_3, 1);

	if (read0 && !read1 && !read2 && !read3) {
		name = '3';
	} else if (!read0 && read1 && !read2 && !read3) {
		name = '2';
	} else if (!read0 && !read1 && read2 && !read3) {
		name = '1';
	} else if (0 && !read0 && !read1 && !read2 && read3) {
		name = '4';
	} else {
		XGpio_DiscreteWrite(&KGC_3, 1, 0);
		return 0;
	}
	XGpio_DiscreteWrite(&KGC_3, 1, 0);
	return name;
}

int takeInput(){
	int a;
	while(1) {
		a = getchar() - '0';
		if ((a==1) || (a==2) || (a==3)) {
			return a;
		}
	}
	return 10;
}
