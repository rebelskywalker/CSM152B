`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 02:08:57 PM
// Design Name: 
// Module Name: testbench_subtractor_16bit
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


module testbench_subtractor_16bit;


reg [15:0] A;
reg [15:0] B;
wire [15:0] sum;
wire overflow;


subtractor_16bit uut (
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
    // 2 - 2
    #25
    A = 16'b0000000000000010;
    B = 16'b0000000000000010;
    // Result Was Correct  = 0 , no overflow
    
        // Test 2: pos and neg
        // 5 - (-2)
    #25
    A = 16'b0000000000000101;
    B = 16'b1111111111111110;
    
    // Result Correct  = 7
    
        // Test 3: Pos amd 0 
        // 4 - 0
    #25
    A = 16'b0000000000000100;
    B = 16'b0000000000000000;
    
    // Result Correct = 4
    
        // Test 4: two neg 
        // -2 - (-2)
    #25
    A = 16'b1111111111111110;
    B = 16'b1111111111111110;
    
    // Result Correct = 0
    
    //Test 5: EDGE CASE: Most Pos and small number
    // (2^15 - 1) - 2
    #25 
    A = 16'b0111111111111111;
    B = 16'b0000000000000010;
    
    // Result Correct = slightly less then most positive by 2: 32765
   
       //Test 6: EDGE CASE: Most Neg and -1
    // -(2^15) - (-1) 
    #25 
    A = 16'b1000000000000000; // -32,768 - (-1) 
    B = 16'b1111111111111111;
    
    //  Result Correct = -32767 , since we essentially added one to most neg 16 bit signed value
    
    //Test 7: EDGE CASE: Most Pos and -2 : POS - NEG CASE
    // (2^15 - 1) - (-2)
    #25 
    A = 16'b0111111111111111;
    B = 16'b1111111111111110;
    
    // Subtraction Overflow occurred as expected for 16 bits: 
    // 32,677 + 2 = 32,679
    // However, our result is -32,767 as expected for 16 bit subtraction O.F.  
    
    //Test Case 8: EDGE CASE: Most Neg and +1 : NEG - POS CASE
    #25 
    A = 16'b1000000000000000; 
    B = 16'b0000000000000001;
    
    // Subtraction Overflow occurred as expected for 16 bits:
    // -32,768 - 1 = -32,769
    // However, our result is +32,767 as expected for 16 bit subtraction O.F.
    
    #25;
   
   $finish;
end

endmodule
