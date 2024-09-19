`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:05:23 PM
// Design Name: 
// Module Name: bitwise_or
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


module bitwise_or(
    input [15:0] A,
    input [15:0] B,
    output [15:0] out
    );
    
    or(out[0], A[0], B[0]);
    or(out[1], A[1], B[1]);
    or(out[2], A[2], B[2]);
    or(out[3], A[3], B[3]);
    or(out[4], A[4], B[4]);
    or(out[5], A[5], B[5]);
    or(out[6], A[6], B[6]);
    or(out[7], A[7], B[7]);
    or(out[8], A[8], B[8]);
    or(out[9], A[9], B[9]);
    or(out[10], A[10], B[10]);
    or(out[11], A[11], B[11]);
    or(out[12], A[12], B[12]);
    or(out[13], A[13], B[13]);
    or(out[14], A[14], B[14]);
    or(out[15], A[15], B[15]);
    
endmodule
