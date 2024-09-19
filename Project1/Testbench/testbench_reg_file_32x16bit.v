`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2022 12:09:04 PM
// Design Name: 
// Module Name: testbench_reg_file_32x16bit
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


module testbench_reg_file_32x16bit;

reg clk;
reg rst;
reg [4:0] Ra;
reg [4:0] Rb;
reg [4:0] Rw;
reg WrEn;
reg [15:0] busW;
wire [15:0] busA;
wire [15:0] busB;

reg_file_32x16bit uut (
    .clk(clk),
    .rst(rst),
    .Ra(Ra),
    .Rb(Rb),
    .Rw(Rw),
    .WrEn(WrEn),
    .busW(busW),
    .busA(busA),
    .busB(busB)
);

initial begin
    // Initial Set all to 0
    clk = 0;
    rst = 0;
    Ra = 0;
    Rb = 0;
    Rw = 0;
    WrEn = 0;
    busW = 0;
    
    // Reset Toggle: Sets all registers to 0
    #20
    rst = 1;
    #20
    rst = 0;
    
    // Single write: Write to Register 1
    #20
    Rw = 1;
    busW = -1;
    #20
    WrEn = 1;
 
    
    // Single Write: Write to Register 2
    #20
    Rw = 2;
    busW = -3;
    
    // Concurrent Read/Write: Read from Register 1 and 2, Write to Register 3
    #20
    Ra = 1;
    Rb = 2;
    Rw = 3;
    busW = -5;
    
    // Concurrent Read/Write to Same Register: Read and Write to Register 4
    #20
    Ra = 4;
    Rw = 4;
    busW = -10;
    
    #20
    rst = 1;
    #20
    rst = 0;
end

always begin
    #10 clk <= ~clk;
end

endmodule
