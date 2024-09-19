`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 02:32:20 PM
// Design Name: 
// Module Name: slt_16bit
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


module slt_16bit(
    input [15:0] A,
    input [15:0] B,
    output [15:0] out
);
wire [15:0] set;
wire xor_sign;
wire [15:0] sub_set;
wire [15:0] xor_set;
wire temp;

xor(xor_sign, A[15], B[15]);
subtractor_16bit sub(.A(A), .B(B), .sum(set), .overflow(temp));
bitwise_and ander(.A(set[15]), .B(1), .out(sub_set));

bitwise_and ander1(.A(A[15]), .B(1), .out(xor_set));

mux_2_1_16bit slt(
    .A(sub_set),
    .B(xor_set),
    .S(xor_sign),
    .D(out)
);

endmodule
