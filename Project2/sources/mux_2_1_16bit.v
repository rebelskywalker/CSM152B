`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 12:11:53 PM
// Design Name: 
// Module Name: mux_2_1_16bit
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


module mux_2_1_16bit(
    input [15:0] A,
    input [15:0] B,
    input S,
    output [15:0] D
);

mux_2_1 mux0(
    .A(A[0]),
    .B(B[0]),
    .S(S),
    .D(D[0])
);

mux_2_1 mux1(
    .A(A[1]),
    .B(B[1]),
    .S(S),
    .D(D[1])
);

mux_2_1 mux2(
    .A(A[2]),
    .B(B[2]),
    .S(S),
    .D(D[2])
);

mux_2_1 mux3(
    .A(A[3]),
    .B(B[3]),
    .S(S),
    .D(D[3])
);

mux_2_1 mux4(
    .A(A[4]),
    .B(B[4]),
    .S(S),
    .D(D[4])
);

mux_2_1 mux5(
    .A(A[5]),
    .B(B[5]),
    .S(S),
    .D(D[5])
);

mux_2_1 mux6(
    .A(A[6]),
    .B(B[6]),
    .S(S),
    .D(D[6])
);

mux_2_1 mux7(
    .A(A[7]),
    .B(B[7]),
    .S(S),
    .D(D[7])
);

mux_2_1 mux8(
    .A(A[8]),
    .B(B[8]),
    .S(S),
    .D(D[8])
);

mux_2_1 mux9(
    .A(A[9]),
    .B(B[9]),
    .S(S),
    .D(D[9])
);

mux_2_1 mux10(
    .A(A[10]),
    .B(B[10]),
    .S(S),
    .D(D[10])
);

mux_2_1 mux11(
    .A(A[11]),
    .B(B[11]),
    .S(S),
    .D(D[11])
);

mux_2_1 mux12(
    .A(A[12]),
    .B(B[12]),
    .S(S),
    .D(D[12])
);

mux_2_1 mux13(
    .A(A[13]),
    .B(B[13]),
    .S(S),
    .D(D[13])
);

mux_2_1 mux14(
    .A(A[14]),
    .B(B[14]),
    .S(S),
    .D(D[14])
);

mux_2_1 mux15(
    .A(A[15]),
    .B(B[15]),
    .S(S),
    .D(D[15])
);


endmodule
