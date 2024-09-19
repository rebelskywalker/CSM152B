`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:36:10 PM
// Design Name: 
// Module Name: testbench_decrement_16bit
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


module testbench_decrement_16bit;

reg [15:0] A;
wire [15:0] decA;
wire overflow;

decrement_16bit uut (
    .A(A),
    .decA(decA),
    .overflow(overflow)
);

initial begin
    A = 0;
    #25
    
    #25
    A = 10;
    
    #25
    A = -420;
    
    #25
    A = 16'b1000000000000000;
    
    #25
    $finish;
end
endmodule
