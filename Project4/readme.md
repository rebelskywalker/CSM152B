# Rock-Paper-Scissors FPGA Project

## Overview

This project implements a Rock-Paper-Scissors game on an FPGA. The game leverages hardware and software integration to provide a real-time interactive experience, showcasing practical skills in game design and hardware-software interfacing.

## Features

- **Keypad Input**: Efficiently reads user choices from a hardware keypad.
- **PC Input**: Captures user input from the console for versatile interaction.
- **Game Logic**: Applies fundamental game design principles to determine outcomes and provide feedback.

## Setup

### GPIO Initialization

- **Columns**: Configured as input to detect keypad presses.
- **Rows**: Configured as output to signal keypad states.

### Input Functions

- **Keypad Input**: `readKey` function reads and processes keypad input to determine the user's choice, illustrating principles of real-time input handling.
- **PC Input**: `takeInput` function reads console input, demonstrating integration of user input from diverse sources.

### Main Loop

The core game loop continuously reads inputs from both the PC and the keypad, evaluates the game logic, and displays the result. This loop exemplifies principles of game state management and interaction feedback.

## Design Contributions

- **Game Logic Implementation**: Designed and implemented a clear and concise game logic that effectively determines the winner based on user inputs, showcasing ability to translate game rules into code.
- **Hardware Integration**: Demonstrated integration of FPGA hardware with software inputs, highlighting skills in combining hardware and software for interactive applications.
- **User Interaction**: Developed mechanisms for real-time user interaction, focusing on responsiveness and accuracy in input handling.

## Learning Outcomes

- **Hardware-Software Interfacing**: Gained hands-on experience with GPIO configuration and real-time input processing on FPGA platforms.
- **Game Design Principles**: Applied fundamental game design principles to create a simple yet functional game, focusing on clarity, user feedback, and interaction.
- **Project Development**: Showcased ability to manage a complete project from concept through implementation, including setup, coding, and debugging.

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
