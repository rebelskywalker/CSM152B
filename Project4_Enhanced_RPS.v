#include <stdio.h>
#include "platform.h"
#include <stdlib.h>
#include <string.h>
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_cache.h"
#include "xparameters.h"
#include <unistd.h>

// Function prototypes
int readKey();
int readKeyAndSetDisplay(char *name);
void initialize();
int takeInput();
int takeInputKeypad();

// GPIO instances for keypad rows and columns
XGpio KGR_0;
XGpio KGR_1;
XGpio KGR_2;
XGpio KGR_3;
XGpio KGC_0;
XGpio KGC_1;
XGpio KGC_2;
XGpio KGC_3;

// Main function
int main()
{
    // Initialize platform and GPIO
    initialize();
    init_platform();
    xil_printf("Starting...\n");

    int pc, keypad;

    while (1) {
        xil_printf("Rock Paper Scissors:\n");
        
        // Get input from PC and keypad
        pc = takeInput();
        keypad = takeInputKeypad();

        // Determine game outcome based on inputs
        if (pc == 1 && keypad == 2) {
            xil_printf("FPGA won! paper > rock\n");
        } else if (pc == 1 && keypad == 3) {
            xil_printf("PC won! rock > scissors\n");
        } else if (pc == 1 && keypad == 1) {
            xil_printf("It's a tie! rock == rock\n");
        } else if (pc == 2 && keypad == 1) {
            xil_printf("PC won! paper > rock\n");
        } else if (pc == 2 && keypad == 2) {
            xil_printf("It's a tie! paper == paper\n");
        } else if (pc == 2 && keypad == 3) {
            xil_printf("FPGA won! scissors > paper\n");
        } else if (pc == 3 && keypad == 1) {
            xil_printf("FPGA won! rock > scissors\n");
        } else if (pc == 3 && keypad == 2) {
            xil_printf("PC won! scissors > paper\n");
        } else if (pc == 3 && keypad == 3) {
            xil_printf("It's a tie! scissors == scissors\n");
        } else {
            xil_printf("Error -> pc = %d keypad = %d\n", pc, keypad);
        }
    }

    return 0;
}

// Function to initialize GPIOs
void initialize() {
    // Initialize column GPIOs
    XGpio_Initialize(&KGC_0, XPAR_XPS_GPIO_0_DEVICE_ID);
    XGpio_SetDataDirection(&KGC_0, 1, 0x0);  // Set as input

    XGpio_Initialize(&KGC_1, XPAR_XPS_GPIO_1_DEVICE_ID);
    XGpio_SetDataDirection(&KGC_1, 1, 0x0);  // Set as input

    XGpio_Initialize(&KGC_2, XPAR_XPS_GPIO_2_DEVICE_ID);
    XGpio_SetDataDirection(&KGC_2, 1, 0x0);  // Set as input

    XGpio_Initialize(&KGC_3, XPAR_XPS_GPIO_3_DEVICE_ID);
    XGpio_SetDataDirection(&KGC_3, 1, 0x0);  // Set as input

    // Initialize row GPIOs
    XGpio_Initialize(&KGR_0, XPAR_XPS_GPIO_4_DEVICE_ID);
    XGpio_SetDataDirection(&KGR_0, 1, 0x1);  // Set as output

    XGpio_Initialize(&KGR_1, XPAR_XPS_GPIO_5_DEVICE_ID);
    XGpio_SetDataDirection(&KGR_1, 1, 0x1);  // Set as output

    XGpio_Initialize(&KGR_2, XPAR_XPS_GPIO_6_DEVICE_ID);
    XGpio_SetDataDirection(&KGR_2, 1, 0x1);  // Set as output

    XGpio_Initialize(&KGR_3, XPAR_XPS_GPIO_7_DEVICE_ID);
    XGpio_SetDataDirection(&KGR_3, 1, 0x1);  // Set as output
}

// Function to read a key from the keypad
int readKey() {
    char name;
    
    // Set all column lines low except the last one
    XGpio_DiscreteWrite(&KGC_0, 1, 0);
    XGpio_DiscreteWrite(&KGC_1, 1, 0);
    XGpio_DiscreteWrite(&KGC_2, 1, 0);
    XGpio_DiscreteWrite(&KGC_3, 1, 1);

    // Read rows
    int read0 = XGpio_DiscreteRead(&KGR_0, 1);
    int read1 = XGpio_DiscreteRead(&KGR_1, 1);
    int read2 = XGpio_DiscreteRead(&KGR_2, 1);
    int read3 = XGpio_DiscreteRead(&KGR_3, 1);

    // Determine which key is pressed
    if (read0 && !read1 && !read2 && !read3) {
        name = '3';
    } else if (!read0 && read1 && !read2 && !read3) {
        name = '2';
    } else if (!read0 && !read1 && read2 && !read3) {
        name = '1';
    } else {
        XGpio_DiscreteWrite(&KGC_3, 1, 0);
        return 0;  // No valid key pressed
    }

    XGpio_DiscreteWrite(&KGC_3, 1, 0);
    return name;
}

// Function to take input from keypad
int takeInputKeypad() {
    char name;
    while (1) {
        name = readKey();
        if (name >= '1' && name <= '3') {
            xil_printf("Entered: %c\n", name);
            return name - '0';  // Convert char to int (1, 2, or 3)
        }
    }
}

// Function to take input from PC
int takeInput() {
    int a;
    while (1) {
        a = getchar() - '0';  // Read character and convert to integer
        if (a >= 1 && a <= 3) {
            return a;
        }
    }
    return 10;  // Invalid input
}
