`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:13:12 PM
// Design Name: 
// Module Name: testbench_bitwise_or
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


module testbench_bitwise_or;

reg [15:0] A;
reg [15:0] B;
wire [15:0] out;

bitwise_or uut (
    .A(A), 
    .B(B), 
    .out(out)
);

initial begin
    A = 0;
    B = 0;
    
    #25
    A = 16'b0000011001100110;
    B = 16'b0011000010000000;
    
    #25
    A = 16'b1000011001100110;
    B = 16'b0000000000000000;   
    
    #25
    $finish;
end

endmodule
