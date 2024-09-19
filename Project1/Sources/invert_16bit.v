`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:49:12 PM
// Design Name: 
// Module Name: invert_16bit
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


module invert_16bit(
    input [15:0] A,
    output [15:0] invA,
    output overflow
);

wire [15:0] negA;

not(negA[0], A[0]);
not(negA[1], A[1]);
not(negA[2], A[2]);
not(negA[3], A[3]);
not(negA[4], A[4]);
not(negA[5], A[5]);
not(negA[6], A[6]);
not(negA[7], A[7]);
not(negA[8], A[8]);
not(negA[9], A[9]);
not(negA[10], A[10]);
not(negA[11], A[11]);
not(negA[12], A[12]);
not(negA[13], A[13]);
not(negA[14], A[14]);
not(negA[15], A[15]);

adder_16bit invertA (.A(negA), .B(1), .sum(invA), .overflow(overflow));

endmodule
