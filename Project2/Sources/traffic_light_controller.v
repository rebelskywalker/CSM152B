`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: [Your Company Name]
// Engineer: Chris Baker, Rodrigo Gonzalez
// 
// Create Date: 04/18/2022
// Design Name: Traffic Light Controller
// Module Name: traffic_light_controller
// Project Name: [Project Name]
// Target Devices: [Target Devices]
// Tool Versions: [Tool Versions]
// Description: 
// This module controls a traffic light system with multiple states and outputs.
// It manages traffic lights for both main and side roads, as well as pedestrian walk
// signals based on sensor inputs and button presses. The system operates with
// different timing sequences for each traffic light phase and includes a debouncer
// for the pedestrian walk button.
//
// Dependencies: 
// This module depends on a clock divider for generating a second-based clock signal
// and a debouncer module to ensure stable button input.
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// The module includes additional outputs `WalkPressed` and `walk_on` for debugging
// purposes. These outputs help verify the correct operation of the pedestrian walk
// signal logic.
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller(
    input clk,            // Input clock signal
    input rst,            // Input reset signal
    input Sensor,         // Input sensor signal for detecting vehicles
    input WalkButton,     // Input pedestrian walk button signal
    output reg Gm,        // Output main road green light
    output reg Ym,        // Output main road yellow light
    output reg Rm,        // Output main road red light
    output reg Gs,        // Output side road green light
    output reg Ys,        // Output side road yellow light
    output reg Rs,        // Output side road red light
    output reg WalkPressed, // Output indicating walk button was pressed
    output reg walk_on,    // Output indicating walk signal is active
    output reg WalkLamp    // Output pedestrian walk signal
);

// Internal signals for timing and state control
wire seconds_clk;
wire WalkEn;

// Instantiate clock divider to generate a second-based clock
clock_divider sec_clk (
    .clk(clk),
    .rst(rst),
    .seconds_clk(seconds_clk)
);

// Instantiate debouncer for the walk button
debouncer deb (
    .WalkButton(WalkButton),
    .clk(clk),
    .WalkEn(WalkEn)
);

// Define state encoding for the traffic light controller
parameter INIT = 4'b0000;
parameter GMI = 4'b0001;
parameter YM = 4'b0010;
parameter GS = 4'b0100;
parameter YS = 4'b0101;
parameter GMA = 4'b0111;
parameter GME = 4'b1000;
parameter WALK = 4'b1001;
parameter GSE = 4'b1010;

// Internal registers for state management and timing counters
reg [3:0] cur_state = INIT;
reg [3:0] next_state;
reg [4:0] init_counter;
reg [3:0] green_counter;
reg [2:0] yellow_counter;
reg [2:0] walk_counter;
reg [2:0] extended_counter;

// State transition logic
always @(*)
begin
    if (WalkButton)
    begin
        walk_on <= 1;
        WalkPressed <= 1;
    end
    case(cur_state)
        INIT:
            next_state <= (rst) ? INIT : GMI;
        GMI:
            next_state <= (rst) ? INIT :
                (init_counter == 11) ? YM : GMI;
        YM:
            next_state <= (rst) ? INIT :
                (yellow_counter == 1) ?
                ((WalkPressed | walk_on) ? WALK : GS) : YM;
        GS:
            next_state <= (rst) ? INIT :
                (green_counter == 5) ?
                (Sensor ? GSE : YS) : GS;
        GSE:
            next_state <= (rst) ? INIT :
                (extended_counter == 2) ? YS : GSE;
        YS:
            next_state <= (rst) ? INIT :
                (yellow_counter == 1) ? GMA : YS;
        GMA:
            next_state <= (rst) ? INIT :
                (green_counter == 5) ?
                (Sensor ? GME : YM) : GMA;
        GME:
            next_state <= (rst) ? INIT :
                (extended_counter == 2) ? YM : GME;
        WALK:
            next_state <= (rst) ? INIT :
                (walk_counter == 2) ? GS : WALK;
        default:
            next_state <= next_state;
    endcase
end

// Update current state on rising edge of seconds clock
always @(posedge seconds_clk)
begin
    if (rst)
        cur_state <= INIT;
    else
        cur_state <= next_state;
end

// Update counters based on current state
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
            GMI: begin
                init_counter <= init_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
            end
            YM: begin
                yellow_counter <= yellow_counter + 1;
                init_counter <= 0;
                green_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
            end
            WALK: begin
                walk_counter <= walk_counter + 1;
                init_counter <= 0;
                green_counter <= 0;
                extended_counter <= 0;
                yellow_counter <= 0;
                WalkPressed <= 0;
                walk_on <= 0;
            end
            GS: begin
                green_counter <= green_counter + 1;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;
            end
            GSE: begin
                extended_counter <= extended_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                init_counter <= 0;
                walk_counter <= 0;
            end
            YS: begin
                yellow_counter <= yellow_counter + 1;
                green_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;
                extended_counter <= 0;
            end
            GMA: begin
                green_counter <= green_counter + 1;
                yellow_counter <= 0;
                extended_counter <= 0;
                walk_counter <= 0;
                init_counter <= 0;
            end
            GME: begin
                extended_counter <= extended_counter + 1;
                green_counter <= 0;
                yellow_counter <= 0;
                init_counter <= 0;
                walk_counter <= 0;
            end
            default: begin
                init_counter <= 0;
                green_counter <= 0;
                yellow_counter <= 0;
                walk_counter <= 0;
                extended_counter <= 0;
            end
        endcase
    end
end

// Output logic based on current state
always @(*)
begin
    case (cur_state)
        GMI, GME, GMA:
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
        GS, GSE:
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
