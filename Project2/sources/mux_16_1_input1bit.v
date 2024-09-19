`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 01:30:23 PM
// Design Name: 
// Module Name: mux_16_1_input1bit
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


module mux_16_1_input1bit(
    input X0,
    input X1,
    input X2,
    input X3,
    input X4,
    input X5,
    input X6,
    input X7,
    input X8,
    input X9,
    input X10,
    input X11,
    input X12,
    input X13,
    input X14,
    input X15,
    input [3:0] S,
    output OUT
);

wire m1;
wire m2;
wire m3;
wire m4;

mux_4_1 mux1(
    .A(X0),
    .B(X1),
    .C(X2),
    .D(X3),
    .S(S[1:0]),
    .OUT(m1)
);

mux_4_1 mux2(
    .A(X4),
    .B(X5),
    .C(X6),
    .D(X7),
    .S(S[1:0]),
    .OUT(m2)
);  

mux_4_1 mux3(
    .A(X8),
    .B(X9),
    .C(X10),
    .D(X11),
    .S(S[1:0]),
    .OUT(m3)
);  

mux_4_1 mux4(
    .A(X12),
    .B(X13),
    .C(X14),
    .D(X15),
    .S(S[1:0]),
    .OUT(m4)
);   

mux_4_1 out_mux(
    .A(m1),
    .B(m2),
    .C(m3),
    .D(m4),
    .S(S[3:2]),
    .OUT(OUT)
);   
endmodule
