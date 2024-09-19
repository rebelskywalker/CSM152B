`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 01:50:11 PM
// Design Name: 
// Module Name: subtractor_16bit
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


module subtractor_16bit(
    input [15:0] A,
    input [15:0] B,
    output [15:0] sum,
    output overflow
);

wire [15:0] notB;
wire [15:0] invB;
wire temp;
wire temp_of;

wire nor_pos; // For A and B pos msb
wire nor_neg; // For A and B neg msb
wire res1; // For result of neg number in pos-neg case
wire res2; // For result of pos number in neg-pos case
wire of_res; // For last or of results above
wire not_A;
wire not_B;
wire not_S;

not(notB[0], B[0]);
not(notB[1], B[1]);
not(notB[2], B[2]);
not(notB[3], B[3]);
not(notB[4], B[4]);
not(notB[5], B[5]);
not(notB[6], B[6]);
not(notB[7], B[7]);
not(notB[8], B[8]);
not(notB[9], B[9]);
not(notB[10], B[10]);
not(notB[11], B[11]);
not(notB[12], B[12]);
not(notB[13], B[13]);
not(notB[14], B[14]);
not(notB[15], B[15]);


adder_16bit invertB (.A(1), .B(notB), .sum(invB), .overflow(temp));

adder_16bit addneg(
    .A(A),
    .B(invB),
    .sum(sum),
    .overflow(temp_of)
);

//Not Gates
    not(not_A, A[15]);
    not(not_B, B[15]);
    not(not_S, sum[15]);
    // First level ANDs
    and(nor_pos, not_A, B[15]);
    and(nor_neg, A[15], not_B);
    
    //Second Level Ands with Sums
    and(res1, nor_pos, sum[15]);
    and(res2, nor_neg, not_S);
    
    //Overflow Result for switching MSB values 
    or(overflow, res1, res2);

endmodule
