`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2022 12:04:10 PM
// Design Name: 
// Module Name: reg_file_32x16bit
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


module reg_file_32x16bit(
    input clk,
    input rst,
    input [4:0] Ra,
    input [4:0] Rb,
    input [4:0] Rw,
    input WrEn,
    input [15:0] busW,
    output reg [15:0] busA,
    output reg [15:0] busB
);

reg [15:0] reg_array [31:0];

integer i;

always @(posedge clk)
begin
    if (rst)
    begin
        for (i = 0; i < 32; i = i + 1)
        begin
            reg_array[i] <= 0;
        end
        busA <= 0;
        busB <= 0;
    end
    else
    begin
        if (WrEn)
        begin
            reg_array[Rw] <= busW;
            if (Ra == Rw)
                busA <= busW;
            else
                busA <= reg_array[Ra];
            if (Rb == Rw)
                busB <= busW;
            else
                busB <= reg_array[Rb];
        end
        else
        begin
            busA <= reg_array[Ra];
            busB <= reg_array[Rb];
        end
    end
end

endmodule
