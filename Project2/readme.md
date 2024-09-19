
# Traffic Light Controller Project

## Overview

In this project, we developed a traffic light controller system using **Verilog** to manage traffic lights and pedestrian signals at an intersection. The design emphasizes accurate timing and response to sensor inputs and pedestrian button presses, ensuring efficient and safe traffic flow.

## Key Design Aspects

### Modular Design

- **Traffic Light Controller**: The central module that controls the state transitions and outputs for traffic lights and pedestrian signals.
- **Clock Divider**: Generates a second-based clock signal to manage timing for different light phases.
- **Debouncer**: Stabilizes the input from the pedestrian walk button to avoid erratic behavior.

### State Machine Implementation

- **Traffic Light Phases**: Implements a finite state machine (FSM) to manage the transition between different traffic light phases (e.g., green, yellow, red) and pedestrian walk signals.
- **Timing Counters**: Utilizes multiple counters to track the duration of each light phase and manage state transitions.

### Synchronization and Timing

- **Clock-Based Timing**: Operates based on a seconds clock to ensure precise timing for each traffic light phase.
- **Button Debouncing**: Ensures reliable input from the pedestrian walk button by filtering out noise.

## Unique Approach

Our project stands out due to its:

- **Comprehensive Timing Management**: Integrated timing counters for each traffic light phase, including extended green phases based on sensor inputs.
- **Pedestrian Signal Handling**: Included functionality to handle pedestrian walk signals in coordination with traffic lights.

## Challenges & Solutions

- **State Machine Complexity**: Designed a robust state machine to handle multiple light phases and transitions smoothly, addressing potential race conditions and timing issues.
- **Pedestrian Signal Integration**: Implemented a debouncer to ensure stable and reliable operation of the pedestrian walk button, avoiding erroneous signals.

## Implementation Details

- **Traffic Light Phases**: Managed through a series of states (e.g., INIT, GMI, YM, GS) with corresponding light outputs.
- **Counters**: Used to track elapsed time in different phases, with separate counters for initialization, green light duration, yellow light timing, and pedestrian walk phases.
- **State Transitions**: Implemented logic to handle transitions based on counters and input signals, ensuring correct operation of the traffic light system.

## Conclusion

The Traffic Light Controller project showcases a detailed approach to managing traffic lights and pedestrian signals through Verilog design. By implementing a comprehensive state machine and precise timing mechanisms, we ensured an efficient and reliable traffic management system. This project highlights our ability to integrate modular design with practical timing control and input handling, providing a robust solution for real-world traffic light control applications.

