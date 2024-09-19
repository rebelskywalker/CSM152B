`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 12:49:25 PM
// Design Name: 
// Module Name: adder_16bit
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


module adder_16bit(
    input [15:0] A,
    input [15:0] B,
    output [15:0] sum,
    output overflow
);
    
    wire C0;
    wire C1;
    wire C2;
    wire C3;
    wire C4;
    wire C5;
    wire C6;
    wire C7;
    wire C8;
    wire C9;
    wire C10;
    wire C11;
    wire C12;
    wire C13;
    wire C14;
    
    wire nor_pos; // For A and B pos msb
    wire nor_neg; // For A and B neg msb
    wire res1; // For result of neg number in pos case
    wire res2; // For result of pos number in neg case
    wire of_res; // For last or of results above
    wire not_A;
    wire not_B;
    wire not_S;
    
    addbit s0 (.cin(0), .a(A[0]), .b(B[0]), .sum(sum[0]), .cout(C0));
    addbit s1 (.cin(C0), .a(A[1]), .b(B[1]), .sum(sum[1]), .cout(C1));
    addbit s2 (.cin(C1), .a(A[2]), .b(B[2]), .sum(sum[2]), .cout(C2));
    addbit s3 (.cin(C2), .a(A[3]), .b(B[3]), .sum(sum[3]), .cout(C3));
    addbit s4 (.cin(C3), .a(A[4]), .b(B[4]), .sum(sum[4]), .cout(C4));
    addbit s5 (.cin(C4), .a(A[5]), .b(B[5]), .sum(sum[5]), .cout(C5));
    addbit s6 (.cin(C5), .a(A[6]), .b(B[6]), .sum(sum[6]), .cout(C6));
    addbit s7 (.cin(C6), .a(A[7]), .b(B[7]), .sum(sum[7]), .cout(C7));
    addbit s8 (.cin(C7), .a(A[8]), .b(B[8]), .sum(sum[8]), .cout(C8));
    addbit s9 (.cin(C8), .a(A[9]), .b(B[9]), .sum(sum[9]), .cout(C9));
    addbit s10 (.cin(C9), .a(A[10]), .b(B[10]), .sum(sum[10]), .cout(C10));
    addbit s11 (.cin(C10), .a(A[11]), .b(B[11]), .sum(sum[11]), .cout(C11)); 
    addbit s12 (.cin(C11), .a(A[12]), .b(B[12]), .sum(sum[12]), .cout(C12));
    addbit s13 (.cin(C12), .a(A[13]), .b(B[13]), .sum(sum[13]), .cout(C13));
    addbit s14 (.cin(C13), .a(A[14]), .b(B[14]), .sum(sum[14]), .cout(C14));
    addbit s15 (.cin(C14), .a(A[15]), .b(B[15]), .sum(sum[15]), .cout(of_res));
    
    //Not Gates
    not(not_A, A[15]);
    not(not_B, B[15]);
    not(not_S, sum[15]);
    // First level ANDs
    and(nor_pos, A[15], B[15]);
    and(nor_neg, not_A, not_B);
    
    //Second Level Ands with Sums
    and(res1, nor_pos, not_S);
    and(res2, nor_neg, sum[15]);
    
    //Overflow Result for switching MSB values 
    or(overflow, res1, res2);
    
    
    
       
        
endmodule
