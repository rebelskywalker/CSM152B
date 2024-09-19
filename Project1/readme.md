# ALU Design Project

## Overview

In this project, we designed a 16-bit Arithmetic Logic Unit (ALU) using **pure gates** and **structural Verilog**. Our approach involved a deep dive into bit-level design, distinguishing us from other teams who used higher-level abstractions.

## Key Design Aspects

### Structural vs. Behavioral Verilog

- **Structural Verilog**: Implemented using primitive gates to define explicit connections.
- **Behavioral Verilog**: Compared with high-level constructs for describing functionality.

### Synchronous vs. Asynchronous Multiplexers

- **Synchronous**: Fixed timing slots.
- **Asynchronous**: Flexible timing based on data availability.

### Arithmetic vs. Logical Shifters

- **Arithmetic Shifter**: Preserves the sign bit during right shifts.
- **Logical Shifter**: Pads with zeros during right shifts.

### Implementation Details

- Designed **16-bit multiplexers** and ALU operations (AND, OR, ADD, INVERT) using structural coding.
- Implemented custom shift operations with detailed logic for overflow detection.

## Unique Approach

We were the only team to design our **shifter manually**, utilizing extensive research and hands-on verification. Our process included:

- **Case-by-Case Verification**: Analyzed shifting patterns of constant 0s, neighboring bits, and the MSB for arithmetic shifts.
- **Detailed Analysis**: Developed general code and logic to detect overflow based on observed trends.

## Challenges & Solutions

- **Bit-Level Design**: Revisited fundamental concepts to build multiplexers from scratch.
- **Shifter Implementation**: Overcame complexities by manually designing and verifying the shifter, leading to a deeper understanding and accurate logic.

## Conclusion

Our project demonstrated a thorough understanding of bit-level ALU construction through detailed design and verification. By manually implementing and verifying the shifter, we showcased our commitment to accuracy and thoroughness, setting our work apart from other teams.
