`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 12:16:54 PM
// Design Name: 
// Module Name: testbench_alu_1bit
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


module testbench_alu_1bit;

    reg A;
    reg B;
    reg cin;
    reg [1:0] ALUCtrl;
    wire overflow;
    wire S;
    
    alu uut(
        .A(A),
        .B(B),
        .cin(cin),
        .ALUCtrl(ALUCtrl),
        .overflow(overflow),
        .S(S)
    );
    
    initial begin
        A = 0;
        B = 0;
        cin = 0;
        // ALUCtrl = 00 -> AND Op
        ALUCtrl = 2'b00;
        #25
        A = 1;
        #25
        A = 0;
        B = 1;
        #25
        A = 1;
        // cin should not change output here
        #25
        cin = 1;
        #25
        cin = 0;
        #25
        
        A = 0;
        B = 0;
        // ALUCtrl = 01 -> OR Op
        ALUCtrl = 2'b01;
        #25
        A = 1;
        #25
        A = 0;
        B = 1;
        #25
        A = 1;
        // cin should not change output here
        #25
        cin = 1;
        #25
        cin = 0;
        #25

        A = 0;
        B = 0;
        // ALUCtrl = 10 -> ADD Op
        ALUCtrl = 2'b10;
        // cin = 0
        #25
        A = 1;
        #25
        A = 0;
        B = 1;
        #25
        A = 1;
        #25
        
        // cin = 1
        #25
        cin = 1;
        #25
        A = 1;
        #25
        A = 0;
        B = 1;
        #25
        A = 1;
        #25
        
        cin = 0;
        A = 0;
        B = 0;
        // ALUCtrl = 11 -> INVERT Op
        #25
        ALUCtrl = 2'b11;
        #25
        A = 1;
        #25
        B = 1;
        #25
        A = 0;
        #25
        cin = 1;
        #25
        cin = 0;
        #25
        B = 0;
        
        
    end
    
endmodule
