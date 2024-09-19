`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 12:15:19 PM
// Design Name: 
// Module Name: addbit
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


module addbit(
    input cin,
    input a,
    input b,
    output sum,
    output cout
);
    
wire x1, a1, a2;

xor(x1, a, b);
xor(sum, x1, cin);
and(a1, a, b);
and(a2, x1, cin);
or(cout, a1, a2);

endmodule
