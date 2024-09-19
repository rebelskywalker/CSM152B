`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 01:21:38 PM
// Design Name: 
// Module Name: mux_16_1_input16bit
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


module mux_16_1_input16bit(
    input [15:0] X0,
    input [15:0] X1,
    input [15:0] X2,
    input [15:0] X3,
    input [15:0] X4,
    input [15:0] X5,
    input [15:0] X6,
    input [15:0] X7,
    input [15:0] X8,
    input [15:0] X9,
    input [15:0] X10,
    input [15:0] X11,
    input [15:0] X12,
    input [15:0] X13,
    input [15:0] X14,
    input [15:0] X15,
    input [3:0] S,
    output [15:0] OUT
);

wire [15:0] m1;
wire [15:0] m2;
wire [15:0] m3;
wire [15:0] m4;

mux_4_1_16bit mux1(
        .A(X0),
        .B(X1),
        .C(X2),
        .D(X3),
        .S(S[1:0]),
        .OUT(m1)
);

mux_4_1_16bit mux2(
        .A(X4),
        .B(X5),
        .C(X6),
        .D(X7),
        .S(S[1:0]),
        .OUT(m2)
);  

mux_4_1_16bit mux3(
        .A(X8),
        .B(X9),
        .C(X10),
        .D(X11),
        .S(S[1:0]),
        .OUT(m3)
);  

mux_4_1_16bit mux4(
        .A(X12),
        .B(X13),
        .C(X14),
        .D(X15),
        .S(S[1:0]),
        .OUT(m4)
);   

mux_4_1_16bit out_mux(
        .A(m1),
        .B(m2),
        .C(m3),
        .D(m4),
        .S(S[3:2]),
        .OUT(OUT)
);   

endmodule
