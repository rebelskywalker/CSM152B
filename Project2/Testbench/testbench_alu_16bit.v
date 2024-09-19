`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 01:22:38 PM
// Design Name: 
// Module Name: testbench_alu_16bit
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


module testbench_alu_16bit;

reg [15:0] A;
reg [15:0] B;
reg [3:0] ALUCtrl;
wire [15:0] S;
wire Overflow;
wire Zero;

alu_16bit uut (
    .A(A),
    .B(B),
    .ALUCtrl(ALUCtrl),
    .S(S),
    .Overflow(Overflow),
    .Zero(Zero)
);

initial begin
    A = 0;
    B = 0;
    
    // Subtract Tests -> ALUCtrl = 0000
    A = 0;
    B = 0;
    ALUCtrl = 0;
    #25;
    
    A = 4;
    B = 1;
    #25
    
    A = 12;
    B = 15;
    #25
 
    A = 16'b1000000000000000; 
    B = 16'b0000000000000001;
    #25
    
    // Add Tests -> ALUCtrl = 0001
    A = 0;
    B = 0;
    ALUCtrl = 1;
    #25;
    
    A = 4;
    B = 1;
    #25
    
    A = -12;
    B = 15;
    #25
 
    A = 16'b0111111111111111;
    B = 16'b0000000000000010;
    #25
    
    // Or Tests -> ALUCtrl = 0010
    A = 0;
    B = 0;
    ALUCtrl = 2;
    #25;
    
    A = 4;
    B = 1;
    #25
    
    A = -12;
    B = 15;
    #25
 
    A = 16'b1111111111111111;
    B = 16'b0000000000000001;
    #25
    
    // And Tests -> ALUCtrl = 0011
    A = 0;
    B = 0;
    ALUCtrl = 3;
    #25;
    
    A = 4;
    B = 1;
    #25
    
    A = -12;
    B = 15;
    #25
 
    A = 16'b1111111111111111;
    B = 16'b0000000000000001;
    #25
    
    // Decrement Tests -> ALUCtrl = 0100
    A = 0;
    ALUCtrl = 4;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b1000000000000000;
    #25
    
    // Increment Tests -> ALUCtrl = 0101
    A = 0;
    ALUCtrl = 5;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b0111111111111111;
    #25   
    
    // Invert Tests -> ALUCtrl = 0110
    A = 0;
    ALUCtrl = 6;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b1000000000000000;
    #25 
    
    // No op Tests -> ALUCtrl = 0111
    // Should output unknown wire value
    A = 0;
    ALUCtrl = 7;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b1000000000000000;
    #25
    
    // Logical Shift Left Tests -> ALUCtrl = 1000
    A = 0;
    B = 0;
    ALUCtrl = 8;
    #25
    
    A = 4;
    B = 3;
    #25
    
    A = -12;
    B = 1;
    #25
 
    A = 16'b1111111111111111;
    B = 16'b0000000000000001;
    #25
    
    A = 16'b0111111111111111;
    B = 16'b0000000000011111;
    #25
 
     // Set on Less Than or Equal To (SLT) Tests -> ALUCtrl = 1001
    A = 0;
    B = 0;
    ALUCtrl = 9;
    #25
    
    A = 4;
    B = 3;
    #25
    
    A = -12;
    B = 1;
    #25
 
    A = 16'b1111111111111111;
    B = 16'b1111111111111111;
    #25
     
    A = 16'b1000000000000000; 
    B = 16'b0000000000000001;
    #25  
     
    
    // Logical Shift Right Tests -> ALUCtrl = 1010
    A = 0;
    B = 0;
    ALUCtrl = 10;
    #25
    
    A = 4;
    B = 2;
    #25
    
    A = -12;
    B = 1;
    #25
 
    A = 16'b1111111111111111;
    B = 16'b0000000000000001;
    #25
    
    // No op Tests -> ALUCtrl = 1011
    // Should output unknown wire value
    A = 0;
    ALUCtrl = 11;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b1000000000000000;
    #25
    
    // Arithmetic Shift Left Tests -> ALUCtrl = 1100
    A = 0;
    ALUCtrl = 12;
    #25
        
    A = 4;
    B = 2;
    #25
        
    A = -12;
    B = 1;
    #25
     
    A = 16'b0111111111111111;
    B = 16'b0000000000000001;
    #25
    
    // No op Tests -> ALUCtrl = 1101
    // Should output unknown wire value
    A = 0;
    ALUCtrl = 13;
    #25;
        
    A = 4;
    #25
        
    A = -12;
    #25
     
    A = 16'b1000000000000000;
    #25
            
    // Arithmetic Shift Right Tests -> ALUCtrl = 1110
    A = 0;
    B = 0;
    ALUCtrl = 14;
    #25
    
    A = 4;
    B = 2;
    #25
    
    A = -12;
    B = 1;
    #25
 
    A = 16'b1000000000000000;
    B = 16'b0000000000000001;
    #25
        
    // No op Tests -> ALUCtrl = 1111
    // Should output unknown wire value
    A = 0;
    ALUCtrl = 15;
    #25;
    
    A = 4;
    #25
    
    A = -12;
    #25
 
    A = 16'b1000000000000000;
    #25
       
    $finish;
end

endmodule
