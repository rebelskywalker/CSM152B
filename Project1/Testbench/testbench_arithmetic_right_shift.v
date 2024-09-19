`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 02:10:59 PM
// Design Name: 
// Module Name: testbench_arithmetic_right_shift
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


module testbench_arithmetic_right_shift;

reg [15:0] A;
reg [15:0] B;
wire [15:0] Y;
wire overflow;

arithmetic_right_shift uut (
    .A(A),
    .B(B),
    .Y(Y),
    .overflow(overflow)
);

integer i;

initial begin
    A = 16'b1100000000000000;
    for (i = 0; i < 16; i = i + 1)
    begin
        B = i;
        #25;
    end
end

endmodule
