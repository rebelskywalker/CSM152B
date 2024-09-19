`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 01:03:58 PM
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(
    input A,
    input B,
    input C,
    input D,
    input [1:0] S,
    output OUT
    );
    
wire m1, m2;
mux_2_1 mux1(
    .A(A),
    .B(B),
    .S(S[0]),
    .D(m1)
);

mux_2_1 mux2(
    .A(C),
    .B(D),
    .S(S[0]),
    .D(m2)
);

mux_2_1 mux3(
    .A(m1),
    .B(m2),
    .S(S[1]),
    .D(OUT)
);
endmodule
