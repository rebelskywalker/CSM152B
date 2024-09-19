`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: [Your Company Name]
// Engineer: Chris Baker, Rodrigo Gonzalez
// 
// Create Date: 04/20/2022
// Design Name: Debouncer
// Module Name: debouncer
// Project Name: [Project Name]
// Target Devices: [Target Devices]
// Tool Versions: [Tool Versions]
// Description: 
// This module debounces a push button signal to remove noise and provide a clean 
// transition. It uses a 2-bit shift register to filter out any noise and ensure
// stable signal transitions. The output `WalkEn` is the debounced version of the
// input `WalkButton` signal, which can be used in subsequent logic to avoid erroneous
// activations due to mechanical bouncing of the button.
//
// Dependencies: 
// This module requires an input clock signal (`clk`) and a push button signal (`WalkButton`).
// The output is a debounced signal (`WalkEn`) that can be used to trigger further actions.
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// The 2-bit shift register approach helps in filtering out noise from the button press.
// The debouncer logic ensures that the output only changes state when the input button
// signal is stable.
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input WalkButton,   // Input push button signal
    input clk,          // Input clock signal
    output WalkEn       // Output debounced signal
);

reg [1:0] arst_ff;  // 2-bit shift register to debounce the button signal
wire arst_i;        // Internal wire for button signal

assign arst_i = WalkButton;    // Connect input button to internal wire
assign WalkEn = arst_ff[0];   // Output the least significant bit of the shift register

// Always block triggered on the rising edge of the clock or the button signal
always @(posedge clk or posedge arst_i)
begin
    if (arst_i)
        arst_ff <= 2'b11;       // Reset the shift register when button is pressed
    else
        arst_ff <= {1'b0, arst_ff[1]}; // Shift right the value in the register
end

endmodule
