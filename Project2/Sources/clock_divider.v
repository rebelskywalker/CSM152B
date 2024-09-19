`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: [Your Company Name]
// Engineer: Chris Baker, Rodrigo Gonzalez
// 
// Create Date: 04/18/2022
// Design Name: Clock Divider
// Module Name: clock_divider
// Project Name: [Project Name]
// Target Devices: [Target Devices]
// Tool Versions: [Tool Versions]
// Description: 
// This module divides the input clock frequency by a factor of 50,000,000 to generate a 
// slower clock signal with a period of 1 second. The module uses a counter to toggle the
// output clock signal every time the counter reaches the specified value, effectively
// creating a 1Hz clock signal from the input clock.
//
// Dependencies: 
// This module requires an input clock signal and a reset signal. The output is a clock 
// signal with a period of 1 second.
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// The counter value is set to 50,000,000 to match the expected frequency division for a
// 50MHz input clock. The reset signal initializes the counter and output clock signal.
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clk,             // Input clock signal
    input rst,             // Reset signal
    output seconds_clk     // Output clock signal (1Hz)
);

reg [27:0] seconds_counter;  // 28-bit counter to count clock cycles
reg sec_clk_reg;             // Register to hold the divided clock signal

// Always block triggered on the rising edge of the input clock
always @(posedge clk)
begin
    // Check if reset is asserted
    if (rst)
    begin
        seconds_counter <= 0;        // Reset counter to 0
        sec_clk_reg <= 1;            // Set output clock signal to high
    end
    // Check if the counter has reached the target value
    else if (seconds_counter == 50000000 - 1)
    begin
        sec_clk_reg <= ~sec_clk_reg; // Toggle the output clock signal
        seconds_counter <= 0;        // Reset counter to 0
    end
    else
        seconds_counter <= seconds_counter + 1; // Increment counter
end

assign seconds_clk = sec_clk_reg; // Assign the output clock signal

endmodule
