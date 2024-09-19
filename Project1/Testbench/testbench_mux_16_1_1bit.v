`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 12:21:32 PM
// Design Name: 
// Module Name: testbench_mux_16_1_1bit
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


module testbench_mux_16_1_1bit;

reg X0;
reg X1;
reg X2;
reg X3;
reg X4;
reg X5;
reg X6;
reg X7;
reg X8;
reg X9;
reg X10;
reg X11;
reg X12;
reg X13;
reg X14;
reg X15;
wire OUT;
reg [3:0] S;

mux_16_1_input1bit uut (
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
    .OUT(OUT)
);

integer j;

initial begin
// TEST:
// When S = 0 and S1 = 0 , Out should be A (OUT = A)
for(j = 0; j < 16; j = j + 1)
    begin
    S = j;
    
    // tests
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000000001;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000000010;
    #25;                                                                                          
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000000100;
    #25;
        
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000001000;
    #25;

    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000010000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000000100000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000001000000;
    #25;
        
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000010000000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000000100000000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000001000000000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000010000000000;
    #25;
        
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0000100000000000;
    #25;
   
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0001000000000000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0010000000000000;
    #25;
    
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b0100000000000000;
    #25;
        
    {X15, X14, X13, X12, X11, X10, X9, X8, X7, X6, X5, X4, X3, X2, X1, X0} = 16'b1000000000000000;
    #25;
    
    end
end


endmodule