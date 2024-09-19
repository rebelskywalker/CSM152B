`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:17:21 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input A,
    input B,
    input cin,
    input [1:0] ALUCtrl,
    output overflow,
    output S
    );
 
 wire and_out;
 wire or_out;
 wire add;
 wire invA;
 wire compA;
 wire temp;

 // AND: ALUCtrl = 00
 and(and_out, A, B);
 
 // OR: ALUCtrl = 01
 or(or_out, A, B);
 
 // ADD: ALUCtrl = 10
 addbit adder(
    .cin(cin),
    .a(A),
    .b(B),
    .sum(add),
    .cout(overflow) 
 );
 
// INVERT A: ALUCtrl = 11
not(invA, A);
 
mux_4_1 newmux(
        .A(and_out),
        .B(or_out),
        .C(add),
        .D(invA),
        .S(ALUCtrl),
        .OUT(S)
);   
    
endmodule
