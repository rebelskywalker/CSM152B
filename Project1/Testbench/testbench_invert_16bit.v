`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:58:38 PM
// Design Name: 
// Module Name: testbench_invert_16bit
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


module testbench_invert_16bit;

reg [15:0] A;
wire [15:0] invA;
wire overflow;

invert_16bit inv1 (
    .A(A),
    .invA(invA),
    .overflow(overflow)
);

initial begin
    A = 0;
    #25

    A = 5;
    #25
    
    A = -9;
    #25
    
    A = 16'b0111111111111111;
    #25
    
    A = 16'b1000000000000000;
    #25
    
    $finish;
end

endmodule
