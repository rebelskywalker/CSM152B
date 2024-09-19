# Rock-Paper-Scissors FPGA Project

## Overview

This project demonstrates a Rock-Paper-Scissors game implemented on an FPGA, integrating user input from a keypad and processing it in real-time. The FPGA interacts with a simulated PC opponent, and results are displayed through serial output. This project leverages Verilog for hardware design and C for game logic, highlighting the practical application of FPGA technology in game development.

## Key Design Aspects

### Input Handling

- **Keypad Interaction**: Users input their choices via a keypad, with each key representing Rock, Paper, or Scissors. This setup allows for an engaging physical interaction with the game.
- **PC Simulation**: The game simulates a PC opponent’s choices using console input, adding an element of unpredictability and challenge.

### Game Logic

- **Outcome Determination**: Implements classic game rules:
  - Rock beats Scissors
  - Scissors beat Paper
  - Paper beats Rock
- **Feedback System**: Results are communicated instantly via serial output, providing immediate feedback and enhancing the user experience.

### GPIO Configuration

- **Initialization**: Configures GPIOs to handle keypad inputs and internal signaling. Ensures robust and reliable input reading.

## Implementation Details

- **User Input Handling**: Uses GPIO functions to read and interpret keypad inputs, ensuring accurate and responsive game interaction.
- **Game Execution Loop**: Continuously processes user and PC inputs, compares them, and displays the result, demonstrating effective real-time game processing.

### Main Functions

- **`initialize()`**: Sets up GPIO devices, crucial for reliable input handling.
- **`readKey()`**: Detects which key is pressed on the keypad, a key part of the user interaction.
- **`takeInput()`**: Reads the PC’s move from the console, simulating AI behavior.
- **`takeInputKeypad()`**: Captures user input from the keypad, translating physical actions into game decisions.

## Unique Approach

This project integrates hardware and software to create a simple yet interactive game experience, showcasing:

- **Interactive Design**: Combines physical input (keypad) with software logic for a tactile gaming experience.
- **Hardware-Software Synergy**: Demonstrates how FPGA technology can be used to handle real-time inputs and outputs in a game setting.
- **Immediate Feedback**: Provides instant game results, enhancing player engagement and satisfaction.

## Challenges & Solutions

- **Keypad Debouncing**: Implemented strategies to ensure accurate and stable input readings, improving game reliability.
- **Simulated PC Moves**: Developed a method to simulate a variety of PC moves, adding depth to the gameplay experience.

## Conclusion

The Rock-Paper-Scissors FPGA project highlights the use of FPGA technology to create an engaging and interactive game. By blending hardware design with game logic, it demonstrates your ability to integrate complex systems and deliver immediate, real-time feedback—key skills in game design and development.
