# Rock-Paper-Scissors FPGA Project

## Overview

This project implements a Rock-Paper-Scissors game on an FPGA. The game reads input from a keypad and a PC, determines the game outcome, and displays the result.

## Features

- **Keypad Input**: Reads user choices from a keypad.
- **PC Input**: Takes user input from the console.
- **Game Logic**: Evaluates the winner based on the inputs.

## Setup

### GPIO Initialization

The GPIOs are initialized for the keypad:
- **Columns**: Set as input.
- **Rows**: Set as output.

### Input Functions

- **Keypad Input**: `readKey` reads the keypad state to determine which key is pressed.
- **PC Input**: `takeInput` reads a number from the console to get the PC's move.

### Main Loop

The main loop repeatedly reads inputs from both the PC and the keypad, determines the game outcome, and prints the result.

## Code Summary

```c
int main() {
    initialize(); // Initialize GPIOs
    init_platform(); // Platform initialization
    xil_printf("Starting...\n");

    while (1) {
        int pc = takeInput(); // Read PC input
        int keypad = takeInputKeypad(); // Read keypad input

        // Evaluate game result
        if (pc == keypad) xil_printf("It's a tie!\n");
        else if ((pc == 1 && keypad == 2) || (pc == 2 && keypad == 3) || (pc == 3 && keypad == 1))
            xil_printf("FPGA wins!\n");
        else
            xil_printf("PC wins!\n");
    }

    return 0;
}
