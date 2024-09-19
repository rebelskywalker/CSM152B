`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 12:58:59 PM
// Design Name: 
// Module Name: logical_left_shift
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


module logical_left_shift(
    input [15:0] A,
    input [15:0] B,
    output [15:0] out,
    output overflow
);

wire negA;
wire posA;
wire negY;
wire posY;
wire res1;
wire res2;

wire [15:0] Y;

wire [15:0] slt_res;

wire [3:0] shamt = B[3:0];

slt_16bit slt (.A(B), .B(15), .out(slt_res));

// Started from X15 -> X0, should be X0 -> X15

// Returns the shifted bit output for the MSB 
mux_16_1_input1bit mux15(
.X0(A[15]), .X1(A[14]), .X2(A[13]), .X3(A[12]),
.X4(A[11]), .X5(A[10]), .X6(A[9]), .X7(A[8]),
.X8(A[7]), .X9(A[6]), .X10(A[5]), .X11(A[4]),
.X12(A[3]), .X13(A[2]), .X14(A[1]), .X15(A[0]),
.S(shamt[3:0]), .OUT(Y[15])
);

// If thise does not return correct results, then try
// Swapping the placement of Xn and An, not sure
// if the input wire is correct on mux

mux_16_1_input1bit mux14(
.X0(A[14]), .X1(A[13]), .X2(A[12]), .X3(A[11]),
.X4(A[10]), .X5(A[9]), .X6(A[8]), .X7(A[7]),
.X8(A[6]), .X9(A[5]), .X10(A[4]), .X11(A[3]),
.X12(A[2]), .X13(A[1]), .X14(A[0]), .X15(0),
.S(shamt[3:0]), .OUT(Y[14])
);

mux_16_1_input1bit mux13(
.X0(A[13]), .X1(A[12]), .X2(A[11]), .X3(A[10]),
.X4(A[9]), .X5(A[8]), .X6(A[7]), .X7(A[6]),
.X8(A[5]), .X9(A[4]), .X10(A[3]), .X11(A[2]),
.X12(A[1]), .X13(A[0]), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[13])
);

mux_16_1_input1bit mux12(
.X0(A[12]), .X1(A[11]), .X2(A[10]), .X3(A[9]),
.X4(A[8]), .X5(A[7]), .X6(A[6]), .X7(A[5]),
.X8(A[4]), .X9(A[3]), .X10(A[2]), .X11(A[1]),
.X12(A[0]), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[12])
);

mux_16_1_input1bit mux11(
.X0(A[11]), .X1(A[10]), .X2(A[9]), .X3(A[8]),
.X4(A[7]), .X5(A[6]), .X6(A[5]), .X7(A[4]),
.X8(A[3]), .X9(A[2]), .X10(A[1]), .X11(A[0]),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[11])
);

mux_16_1_input1bit mux10(
.X0(A[10]), .X1(A[9]), .X2(A[8]), .X3(A[7]),
.X4(A[6]), .X5(A[5]), .X6(A[4]), .X7(A[3]),
.X8(A[2]), .X9(A[1]), .X10(A[0]), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[10])
);

mux_16_1_input1bit mux9(
.X0(A[9]), .X1(A[8]), .X2(A[7]), .X3(A[6]),
.X4(A[5]), .X5(A[4]), .X6(A[3]), .X7(A[2]),
.X8(A[1]), .X9(A[0]), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[9])
);

mux_16_1_input1bit mux8(
.X0(A[8]), .X1(A[7]), .X2(A[6]), .X3(A[5]),
.X4(A[4]), .X5(A[3]), .X6(A[2]), .X7(A[1]),
.X8(A[0]), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[8])
);

mux_16_1_input1bit mux7(
.X0(A[7]), .X1(A[6]), .X2(A[5]), .X3(A[4]),
.X4(A[3]), .X5(A[2]), .X6(A[1]), .X7(A[0]),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[7])
);

mux_16_1_input1bit mux6(
.X0(A[6]), .X1(A[5]), .X2(A[4]), .X3(A[3]),
.X4(A[2]), .X5(A[1]), .X6(A[0]), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[6])
);

mux_16_1_input1bit mux5(
.X0(A[5]), .X1(A[4]), .X2(A[3]), .X3(A[2]),
.X4(A[1]), .X5(A[0]), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[5])
);

mux_16_1_input1bit mux4(
.X0(A[4]), .X1(A[3]), .X2(A[2]), .X3(A[1]),
.X4(A[0]), .X5(0), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[4])
);

mux_16_1_input1bit mux3(
.X0(A[3]), .X1(A[2]), .X2(A[1]), .X3(A[0]),
.X4(0), .X5(0), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[3])
);

mux_16_1_input1bit mux2(
.X0(A[2]), .X1(A[1]), .X2(A[0]), .X3(0),
.X4(0), .X5(0), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[2])
);

mux_16_1_input1bit mux1(
.X0(A[1]), .X1(A[0]), .X2(0), .X3(0),
.X4(0), .X5(0), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[1])
);

// Returns the shifted bit output for the LSB
mux_16_1_input1bit mux0(
.X0(A[0]), .X1(0), .X2(0), .X3(0),
.X4(0), .X5(0), .X6(0), .X7(0),
.X8(0), .X9(0), .X10(0), .X11(0),
.X12(0), .X13(0), .X14(0), .X15(0),
.S(shamt[3:0]), .OUT(Y[0])
);


mux_2_1_16bit final_mux(
    .A(0),
    .B(Y),
    .S(slt_res[0]),
    .D(out)
);
// Overflow Detection

and(overflow, 0, 0);

endmodule
