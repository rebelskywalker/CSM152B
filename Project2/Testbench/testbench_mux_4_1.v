`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 01:08:42 PM
// Design Name: 
// Module Name: testbench_mux_4_1
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


module testbench_mux_4_1;

reg A;
reg B;
reg C;
reg D;
reg [1:0] S;
wire out;

mux_4_1 uut(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S),
    .OUT(out)
);

integer i;

initial begin
// TEST:
// When S = 0 and S1 = 0 , Out should be A (OUT = A)
S = 0;
    for (i = 0; i < 16; i = i + 1)
        begin
            {A, B, C, D} = i;
            #25;
        end 

// When S0 = 0 and S1 = 1 , Out should be B (OUT = B)
S = 2'b01;
    for (i = 0; i < 16; i = i + 1)
        begin
            {A, B, C, D} = i;
            #25;
        end
// When S0 = 1 and S1 = 0 , Out should be C (OUT = C)
S = 2'b10;
    for (i = 0; i < 16; i = i + 1)
        begin
            {A, B, C, D} = i;
            #25;
        end

// When S0 = 1 and S1 = 1 , Out should be D (OUT = D)
S = 2'b11;
    for (i = 0; i < 16; i = i + 1)
        begin
            {A, B, C, D} = i;
            #25;
        end

$finish;

end

endmodule
