`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 02:36:36 PM
// Design Name: 
// Module Name: testbench_slt_16bit
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


module testbench_slt_16bit;

reg [15:0] A;
reg [15:0] B;
wire [15:0] out;
wire overflow;

slt_16bit uut (
    .A(A),
    .B(B),
    .out(out),
    .overflow(overflow)
);

initial begin
    A = 0;
    B = 0;
    #25;
    
    A = 4;
    B = 2;
    #25
    
    A = 2;
    B = 4;
    #25
    
    A = -4;
    B = -2;
    #25
    
    A = -2;
    B = -4;
    #25
    
    A = 16'b0111111111111111;
    B = 16'b0111111111111111;
    #25
    
    $finish; 
end

endmodule
