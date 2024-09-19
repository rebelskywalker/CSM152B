`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:28:58 PM
// Design Name: 
// Module Name: decrement_16bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decrement_16bit(
    input [15:0] A,
    output [15:0] decA,
    output overflow
);

subtractor_16bit dec1_A (.A(A), .B(1), .sum(decA), .overflow(overflow));

endmodule
