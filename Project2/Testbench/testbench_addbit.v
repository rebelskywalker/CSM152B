`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 12:51:17 PM
// Design Name: 
// Module Name: testbench_addbit
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


module testbench_addbit;

reg cin; reg a; reg b;
wire cout; wire sum;

addbit uut(
.cin(cin),
.a(a), .b(b), .cout(cout), .sum(sum)
);

initial begin
cin = 0;
a= 0; b = 0;
#25 a = 1;
#25 a = 0;
#25 b = 1;
#25 b = 0;
#25 a = 1; b = 1;

#50;

cin = 1;
a= 0; b = 0;
#25 a = 1;
#25 a = 0;
#25 b = 1;
#25 b = 0;
#25 a = 1; b = 1;
#50;

$finish;

end

endmodule
