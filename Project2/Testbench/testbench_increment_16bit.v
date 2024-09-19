`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:30:19 PM
// Design Name: 
// Module Name: testbench_increment_16bit
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


module testbench_increment_16bit;

reg [15:0] A;
wire [15:0] incA;
wire overflow;

increment_16bit uut (
    .A(A),
    .incA(incA),
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
    A = 16'b0111111111111111;
    
    #25
    $finish;
end

endmodule
