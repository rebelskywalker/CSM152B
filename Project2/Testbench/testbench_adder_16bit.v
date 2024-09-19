`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 01:03:54 PM
// Design Name: 
// Module Name: testbench_adder_16bit
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


module testbench_adder_16bit;

reg [15:0] A;
reg [15:0] B;
wire [15:0] sum;
wire overflow;

adder_16bit uut (
    .A(A),
    .B(B),
    .sum(sum),
    .overflow(overflow)
);

initial begin
// Test 0: settings zeros
    A = 0;
    B = 0;
    
    // Test 1: two pos 
    // 2 + 2
    #25
    A = 16'b0000000000000010;
    B = 16'b0000000000000010;
    // Result Was Correct  = 4 , no overflow
    
        // Test 2: pos and neg
        // 5 + (-2)
    #25
    A = 16'b0000000000000101;
    B = 16'b1111111111111110;
    
        // Test 3: Pos amd 0 
        // 4 + 0
    #25
    A = 16'b0000000000000100;
    B = 16'b0000000000000000;
    
        // Test 4: two neg 
        // -2 + -2
    #25
    A = 16'b1111111111111110;
    B = 16'b1111111111111110;
    
    //Test 5: EDGE CASE: Most Pos and small number
    // (2^15 - 1) + 2
    #25 
    A = 16'b0111111111111111;
    B = 16'b0000000000000010;
   
       //Test 5: EDGE CASE: Most Neg and pos number
    // -(2^15) - 1 
    #25 
    A = 16'b1000000000000000; // -32,768 - 1 
    B = 16'b1111111111111111;
   
   $finish;
end

endmodule
