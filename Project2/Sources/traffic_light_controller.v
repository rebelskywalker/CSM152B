`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:27:46 PM
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input clk,
    input rst,
    input Sensor,
    input WalkButton,
    output reg Gm,
    output reg Ym,
    output reg Rm,
    output reg Gs,
    output reg Ys,
    output reg Rs,
    output reg WalkPressed,
    output reg walk_on,
    output reg WalkLamp
);
// I recently added the WalkPressed and walk_on as output reg for testing, I also declared them in the basys file for checking led
// of them when they are set to make sure they are being set. I also tried moving some setting of  = 0 and =1 with those values
// I also commented out the WalkEn because at some point the WALK state was always occurring without button presses.


wire seconds_clk;

clock_divider sec_clk (
    .clk(clk),
    .rst(rst),
    .seconds_clk(seconds_clk)
);

wire WalkEn;
debouncer deb (
    .WalkButton(WalkButton),
    .clk(clk),
    .WalkEn(WalkEn)
);

parameter INIT = 4'b0000;
parameter GMI = 4'b0001;
parameter YM = 4'b0010;
parameter GS = 4'b0100;
parameter YS = 4'b0101;
parameter GMA = 4'b0111;
parameter GME = 4'b1000;
parameter WALK = 4'b1001;
parameter GSE = 4'b1010;

//reg WalkPressed;
//reg walk_on;
reg [3:0] cur_state = INIT;
reg [3:0] next_state;

reg [4:0] init_counter;
reg [3:0] green_counter;
reg [2:0] yellow_counter;
reg [2:0] walk_counter;
reg [2:0] extended_counter;

always @ (*)//(clk, cur_state, rst, Sensor, WalkEn, init_counter, green_counter, yellow_counter, walk_counter, extended_counter)
begin

    //if (WalkEn)
    //    WalkPressed <= 1;
    //    walk_on <= 1;
    if (WalkButton)
    begin
        walk_on <= 1; 
        WalkPressed <= 1;
    end
    case(cur_state)
        INIT:
            if (rst)
                next_state <= INIT;
            else
                next_state <= GMI;
        GMI:
            if (rst)
                next_state <= INIT;
            else
            // We had to change the assignment of counter to 0, since it could not happen simultaneously
            //Race condition for exiting this block
            begin
                if (init_counter == 11)
                begin
                    next_state <= YM;
                end
                else
                    next_state <= GMI;
            end
        YM:
            if (rst)
                next_state <= INIT;
            else
            begin
                if (yellow_counter == 1)
                begin
                    if (WalkPressed | walk_on)
                        next_state <= WALK;
                    else
                        next_state <= GS;
                end
                else
                    next_state <= YM;
            end
        GS:
            if (rst)
                next_state <= INIT;
            else
            begin
                //yellow_counter <= 0;
                //walk_counter <= 0;
                if (green_counter == 5)
                begin
                    if (Sensor)
                        next_state <= GSE;
                    else
                        next_state <= YS;
                end
                else
                    next_state <= GS;
            end
        GSE:
            if (rst)
                next_state <= INIT;
            else
            begin
                if (extended_counter == 2)
                begin
                    next_state <= YS;
                end
                else
                    next_state <= GSE;
            end
        YS:
            if (rst)
                next_state <= INIT;
            else
            begin
                //green_counter <= 0;
                //extended_counter <= 0;
                if (yellow_counter == 1)
                begin
                    next_state <= GMA;
                end
                else
                    next_state <= YS;
            end
        GMA:
            if (rst)
                next_state <= INIT;
            else
            begin
                //yellow_counter <= 0;
                if (green_counter == 5)
                begin
                    if (Sensor)
                        next_state <= GME;
                    else
                        next_state <= YM;
                end
                else
                    next_state <= GMA;
            end
        GME:
            if (rst)
                next_state <= INIT;
            else
            begin
                if (extended_counter == 2)
                begin
                    next_state <= YM;
                    
                end
                else
                    next_state <= GME;
            end
        WALK:
            if (rst)
                next_state <= INIT;
            else
            begin
                if (walk_counter == 2)
                begin
                    next_state <= GS;
                    WalkPressed <= 0; 
                    walk_on <= 0;
                end
                else
                    next_state <= WALK;
            end
        default:
            next_state <= next_state;
    endcase
end

always @(posedge seconds_clk) 
begin
    if (rst)
    begin
        cur_state <= INIT;     
    end
    else
        cur_state <= next_state;
end

always @(posedge seconds_clk)
begin
    if (rst)
    begin
        init_counter <= 0;
        green_counter <= 0;
        yellow_counter <= 0;
        walk_counter <= 0;
        extended_counter <= 0;
        walk_on <= 0;
        WalkPressed <= 0;
    end
    else
    begin
        case (cur_state)
            GMI:
            begin
                init_counter <= init_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
            end
            YM:
            begin
                yellow_counter <= yellow_counter + 1;
                init_counter <= 0;
                green_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
            end
            WALK:
            begin
                walk_counter <= walk_counter + 1;
                init_counter <= 0;
                green_counter <= 0;
                extended_counter <= 0;
                yellow_counter <= 0;
                WalkPressed <= 0; 
                walk_on <= 0;
            end
            GS:
            begin
                green_counter <= green_counter + 1;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;                    
            end
            GSE:
            begin
                extended_counter <= extended_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                init_counter <= 0;
                walk_counter <= 0;
            end
            YS:
            begin
                yellow_counter <= yellow_counter + 1;
                green_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;
                extended_counter <= 0;
            end
            GMA:
            begin
                green_counter <= green_counter + 1;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;
            end
            GME:
            begin
                extended_counter <= extended_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                init_counter <= 0;
                walk_counter <= 0;                
            end
            default:
            begin
                init_counter <= 0;
                green_counter <= 0;
                yellow_counter <= 0;
                walk_counter <= 0;
                extended_counter <= 0; 
            end   
        endcase
    end
end

//output
always @(*)
begin
    case (cur_state)
        GMI:
        begin
            Gm <= 1;
            Ym <= 0;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 0;
        end
        GME:
        begin
            Gm <= 1;
            Ym <= 0;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 0;
        end
        GMA:
        begin
            Gm <= 1;
            Ym <= 0;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 0;
        end
        YM:
        begin
            Gm <= 0;
            Ym <= 1;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 0;
        end
        GS:
        begin
            Gm <= 0;
            Ym <= 0;
            Rm <= 1;
            Gs <= 1;
            Ys <= 0;
            Rs <= 0;
            WalkLamp <= 0;
        end
        GSE:
        begin
            Gm <= 0;
            Ym <= 0;
            Rm <= 1;
            Gs <= 1;
            Ys <= 0;
            Rs <= 0;
            WalkLamp <= 0;
        end
        YS:
        begin
            Gm <= 0;
            Ym <= 0;
            Rm <= 1;
            Gs <= 0;
            Ys <= 1;
            Rs <= 0;
            WalkLamp <= 0;
        end
        WALK:
        begin
            Gm <= 0;
            Ym <= 0;
            Rm <= 1;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 1;
        end
        INIT:
        begin
            Gm <= 0;
            Ym <= 0;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 0;
            WalkLamp <= 0;
        end
        default:
        begin
            Gm <= 1;
            Ym <= 0;
            Rm <= 0;
            Gs <= 0;
            Ys <= 0;
            Rs <= 1;
            WalkLamp <= 0;
        end
    endcase
end

endmodule
