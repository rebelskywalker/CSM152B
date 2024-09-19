`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 12:42:04 PM
// Design Name: 
// Module Name: alu_16bit
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


module alu_16bit(
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUCtrl,
    output [15:0] S,
    output Overflow,
    output Zero
);

wire [15:0] subtract_res;
wire subtract_res_of;

wire [15:0] add_res;
wire add_res_of;

wire [15:0] or_res;
wire [15:0] and_res;

wire [15:0] decrement_res;
wire decrement_res_of;

wire [15:0] increment_res;
wire increment_res_of;

wire [15:0] invert_res;
wire invert_res_of;

wire [15:0] asl_res;
wire asl_res_of;

wire [15:0] asr_res;
wire asr_res_of;

wire [15:0] lsl_res;
wire lsl_res_of;
wire [15:0] lsr_res;
wire lsr_res_of;
wire [15:0] slt_res;
wire [15:0] no_op;

wire [15:0] z;

subtractor_16bit subtract (.A(A), .B(B), .sum(subtract_res), .overflow(subtract_res_of));
adder_16bit add (.A(A), .B(B), .sum(add_res), .overflow(add_res_of));
bitwise_or auror(.A(A), .B(B), .out(or_res));
bitwise_and ander (.A(A), .B(B), .out(and_res));
decrement_16bit decrementer(.A(A), .decA(decrement_res), .overflow(decrement_res_of));
increment_16bit incrementer(.A(A), .incA(increment_res), .overflow(increment_res_of));
invert_16bit invertit (.A(A), .invA(invert_res), .overflow(invert_res_of));
arithmetic_left_shift american_sign_lang (.A(A), .B(B), .Y(asl_res), .overflow(asl_res_of));
arithmetic_right_shift american_read_lang (.A(A), .B(B), .Y(asr_res), .overflow(asr_res_of));
logical_left_shift learning_sign_lang (.A(A), .B(B), .out(lsl_res), .overflow(lsl_res_of));
logical_right_shift leh_ocean_sign_lang (.A(A), .B(B), .out(lsr_res), .overflow(lsr_res_of));
slt_16bit sar_lacc_tar (.A(A), .B(B), .out(slt_res));

mux_16_1_input16bit alderaans_last_uncle (
    .X0(subtract_res),
    .X1(add_res),
    .X2(or_res),
    .X3(and_res),
    .X4(decrement_res),
    .X5(increment_res),
    .X6(invert_res),
    .X7(no_op),
    .X8(lsl_res),
    .X9(slt_res),
    .X10(lsr_res),
    .X11(no_op),
    .X12(asl_res),
    .X13(no_op),
    .X14(asr_res),
    .X15(no_op),
    .S(ALUCtrl),
    .OUT(S)
);

mux_16_1_input1bit of_mux (
    .X0(subtract_res_of),
    .X1(add_res_of),
    .X2(0),
    .X3(0),
    .X4(decrement_res_of),
    .X5(increment_res_of),
    .X6(invert_res_of),
    .X7(0),
    .X8(lsl_res_of),
    .X9(0),
    .X10(lsr_res_of),
    .X11(0),
    .X12(asl_res_of),
    .X13(0),
    .X14(asr_res_of),
    .X15(0),
    .S(ALUCtrl),
    .OUT(Overflow)
);

//or(Overflow, subtract_res_of, add_res_of, decrement_res_of, increment_res_of, invert_res_of, asl_res_of, asr_res_of, lsl_res_of, lsr_res_of, slt_res_of);
nor(z[0], S[0], 0);
nor(z[1], S[1], 0);
nor(z[2], S[2], 0);
nor(z[3], S[3], 0);
nor(z[4], S[4], 0);
nor(z[5], S[5], 0);
nor(z[6], S[6], 0);
nor(z[7], S[7], 0);
nor(z[8], S[8], 0);
nor(z[9], S[9], 0);
nor(z[10], S[10], 0);
nor(z[11], S[11], 0);
nor(z[12], S[12], 0);
nor(z[13], S[13], 0);
nor(z[14], S[14], 0);
nor(z[15], S[15], 0);

and(Zero, z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], z[8], z[9], z[10], z[11], z[12], z[13], z[14], z[15]);
    
endmodule
