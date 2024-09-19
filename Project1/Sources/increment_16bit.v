`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:24:47 PM
// Design Name: 
// Module Name: increment_16bit
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


module increment_16bit(
    input [15:0] A,
    output [15:0] incA,
    output overflow
);

adder_16bit add1_A (.A(A), .B(1), .sum(incA), .overflow(overflow));

endmodule
