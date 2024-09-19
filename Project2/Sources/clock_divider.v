`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:32:30 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input rst,
    output seconds_clk
);

reg [27:0] seconds_counter;
reg sec_clk_reg;

always @(posedge clk)
begin
    if (rst)
    begin
        seconds_counter <= 0;
        sec_clk_reg <= 1;
    end
    // seconds_counter == 50000000-1
    else if (seconds_counter == 1)
    begin
        sec_clk_reg <= ~sec_clk_reg;
        seconds_counter <= 0;
    end
    else
        seconds_counter <= seconds_counter + 1;
end

assign seconds_clk = sec_clk_reg;

endmodule
