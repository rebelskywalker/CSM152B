`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 01:20:01 PM
// Design Name: 
// Module Name: testbench_controller
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


module testbench_controller;

reg clk;
reg rst;
reg Sensor;
reg WalkButton;
wire Gm;
wire Ym;
wire Rm;
wire Gs;
wire Ys;
wire Rs;
wire WalkLamp;

traffic_light_controller uut (
    .clk(clk),
    .rst(rst),
    .Sensor(Sensor),
    .WalkButton(WalkButton),
    .Gm(Gm),
    .Ym(Ym),
    .Rm(Rm),
    .Gs(Gs),
    .Ys(Ys),
    .Rs(Rs),
    .WalkLamp(WalkLamp)
);

initial begin
    clk = 0;
    rst = 0;
    Sensor = 0;
    WalkButton = 0;
    
    #15
    rst = 1;
    #20
    rst = 0;
    
    #3465
    Sensor = 1;
    #100
    WalkButton = 1;
    #100
    
    #1435
    rst = 1;
    #500
    
    rst = 0;
    #200
    
    $finish;
    
end

always begin
    #10 clk = ~clk;
end

endmodule
