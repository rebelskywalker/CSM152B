`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 01:03:49 PM
// Design Name: 
// Module Name: testbench_logical_left_shift
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


module testbench_logical_left_shift;

reg [15:0] A;
reg [15:0] B;
wire [15:0] Y;
wire overflow;

logical_left_shift uut (
    .A(A),
    .B(B),
    .out(Y),
    .overflow(overflow)
);

integer i;

initial begin
    A = 2;
    for (i = 0; i < 16; i = i + 1)
    begin
        B = i;
        #25;
    end
end

endmodule
