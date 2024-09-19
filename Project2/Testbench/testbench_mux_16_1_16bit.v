`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 01:33:40 PM
// Design Name: 
// Module Name: testbench_mux_16_1_16bit
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


module testbench_mux_16_1_16bit;

reg [15:0] X0;
reg [15:0] X1;
reg [15:0] X2;
reg [15:0] X3;
reg [15:0] X4;
reg [15:0] X5;
reg [15:0] X6;
reg [15:0] X7;
reg [15:0] X8;
reg [15:0] X9;
reg [15:0] X10;
reg [15:0] X11;
reg [15:0] X12;
reg [15:0] X13;
reg [15:0] X14;
reg [15:0] X15;
wire [15:0] out;
reg [3:0] S;

mux_16_1_input16bit uut(
    .X0(X0),
    .X1(X1),
    .X2(X2),
    .X3(X3),
    .X4(X4),
    .X5(X5),
    .X6(X6),
    .X7(X7),
    .X8(X8),
    .X9(X9),
    .X10(X10),
    .X11(X11),
    .X12(X12),
    .X13(X13),
    .X14(X14),
    .X15(X15),
    .S(S),
    .OUT(out)
);
    

integer j;


initial begin
// TEST:
// When S = 0 and S1 = 0 , Out should be A (OUT = A)
for(j = 0; j < 16; j = j + 1)
    begin
    S = j;
    
    // tests
    X0 = 16'b0000000000000001;
    X1 = 16'b0000000000000010;
    X2 = 16'b0000000000000100;
    X3 = 16'b0000000000001000;
    X4 = 16'b0000000000010000;
    X5 = 16'b0000000000100000;
    X6 = 16'b0000000001000000;
    X7 = 16'b0000000010000000;
    X8 = 16'b0000000100000000;
    X9 = 16'b0000001000000000;
    X10 = 16'b0000010000000000;
    X11 = 16'b0000100000000000;
    X12 = 16'b0001000000000000;
    X13 = 16'b0010000000000000;
    X14 = 16'b0100000000000000;
    X15 = 16'b1000000000000000;
    #25;
    
    end
end


endmodule
