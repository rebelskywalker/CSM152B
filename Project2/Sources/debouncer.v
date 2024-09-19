`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 01:44:44 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input WalkButton,
    input clk,
    output WalkEn    
);

reg [1:0] arst_ff;
wire arst_i;

assign arst_i = WalkButton;
assign WalkEn = arst_ff;

always @(posedge clk or posedge arst_i)
begin
    if (arst_i)
        arst_ff <= 2'b11;
    else
        arst_ff <= {1'b0, arst_ff[1]};
end

endmodule
