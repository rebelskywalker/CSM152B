`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:36:55 PM
// Design Name: 
// Module Name: testbench_mux_2_1
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


module testbench_mux_2_1;

reg a;
reg b;
reg s;
wire out;

mux_2_1 uut(
    .A(a),
    .B(b),
    .S(s),
    .D(out)
);

initial begin
// test1: a= 0, b = 0 , s = 0 [000]
a = 0;
b = 0;
s = 0;
//res 0 

// test2: a = 0 , s = 0 [010]
#25 b = 1; //res 0

// test3: a = 1, s = 0 [100]
#25 a = 1; b = 0; // res 1

//test change: Test changing back [110] 
#25 a= 1; b = 1; // res 1

//test4: Change s = 1 [001]
#25 s = 1; a = 0; b = 0;

// test5: s = 1 [101]
#25 a = 1; b = 0;

//test6: a = 1, s = 1 [111]
#25 b = 1; //res 1

// test7: b = 1, s = 1 [011]
#25 a = 0; // res 1

//test8: b= 1, s =1 [111]
#25 a = 1; //res 1

#25;
$finish;

end

endmodule

