# Rock-Paper-Scissors FPGA Project

## Overview

This project implements a Rock-Paper-Scissors game using an FPGA, with user inputs read from a keypad and processed on the FPGA. The system plays against a simulated PC opponent, and the results of each round are displayed through serial output. The game logic and input handling are designed using Verilog and C, demonstrating a practical application of FPGA capabilities.

## Key Design Aspects

### Input Handling

- **Keypad Input**: Reads user input from a keypad using GPIO. Each key corresponds to a specific action in the game.
- **PC Input**: Reads input from the console to simulate the PC's move. The valid inputs are '1', '2', and '3', representing Rock, Paper, and Scissors respectively.

### Game Logic

- **Comparison Logic**: Determines the winner between the FPGA and PC based on the game rules:
  - Rock beats Scissors
  - Scissors beats Paper
  - Paper beats Rock
- **Output**: Displays the result of each round on the serial console using `xil_printf`.

### GPIO Configuration

- **Initialization**: Configures GPIOs for keypad input and internal communication. The GPIOs are initialized to manage both column and row signals of the keypad.

## Implementation Details

- **Keypad Reading**: Utilizes GPIO functions to read the state of the keypad and determine which key has been pressed.
- **Game Execution**: The main loop continuously prompts for user input and compares it with a simulated PC move. Results are printed to the serial console.

### Main Functions

- **`initialize()`**: Sets up GPIO devices and configures the direction for each GPIO pin.
- **`readKey()`**: Reads the state of the keypad to determine which key is pressed.
- **`takeInput()`**: Reads input from the console to simulate the PC's move.
- **`takeInputKeypad()`**: Reads input from the keypad and returns the corresponding value.

## Unique Approach

Our project demonstrates the integration of FPGA hardware with software logic for a simple game application. Key features include:

- **Hardware-Software Integration**: The game leverages both FPGA hardware for keypad handling and C software for game logic and serial communication.
- **Real-Time Interaction**: Provides immediate feedback and results based on user input and simulated PC moves.

## Challenges & Solutions

- **Keypad Debouncing**: Ensured stable reading of keypad input by managing GPIO states and debouncing signals.
- **PC Input Simulation**: Implemented a method to simulate random moves from the PC and handle user inputs seamlessly.

## Conclusion

This Rock-Paper-Scissors FPGA project highlights the practical application of FPGA technology for real-time game logic and user interaction. By combining GPIO handling with game logic implemented in C, the project demonstrates effective use of FPGA capabilities in a straightforward and engaging application.

