`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:38:33 PM
// Design Name: 
// Module Name: testbench_clock_divider
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


module testbench_clock_divider;

reg clk;
reg rst;
wire seconds_clk;

clock_divider uut (
    .clk(clk),
    .rst(rst),
    .seconds_clk(seconds_clk)
);

initial begin
clk = 0;
rst = 1;

#20
rst = 0;

#2000000000;

$finish;

end

always begin
    #10 clk = ~clk;
end

endmodule
