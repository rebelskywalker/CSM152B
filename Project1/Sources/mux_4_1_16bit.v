`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 12:12:19 PM
// Design Name: 
// Module Name: mux_4_1_16bit
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


module mux_4_1_16bit(
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [15:0] D,
    input [1:0] S,
    output [15:0] OUT
);

wire [15:0] m1;
wire [15:0] m2;

mux_2_1_16bit mux1(
.A(A),
.B(B),
.S(S[0]),
.D(m1)
);

mux_2_1_16bit mux2(
.A(C),
.B(D),
.S(S[0]),
.D(m2)
);

mux_2_1_16bit mux3(
.A(m1),
.B(m2),
.S(S[1]),
.D(OUT)
);
endmodule
