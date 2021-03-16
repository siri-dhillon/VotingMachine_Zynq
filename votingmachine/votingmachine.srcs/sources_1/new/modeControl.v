`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 05:07:18 PM
// Design Name: 
// Module Name: modeControl
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


module modeControl(
input clock,
input reset, 
input mode, 
input valid_vote_casted, 
input [7:0] candidate1_vote,
input [7:0] candidate2_vote,
input [7:0] candidate3_vote,
input [7:0] candidate4_vote,
input candidate1_button_press,
input candidate2_button_press,
input candidate3_button_press,
input candidate4_button_press,
output reg [7:0] leds
);

//counter 
reg [30:0] counter;

always @(posedge clock)
begin 
    if (reset)
        counter <= 0;
    else if (valid_vote_casted)
        counter <= counter + 1; 
    else if (counter != 0 & counter < 100000000 ) 
        counter <= counter + 1; 
    else 
        counter <= 0; 
end

always @(posedge clock)
begin 
    if(reset)
        leds <= 0;
    else 
    begin
        if (mode == 0 & counter > 0) // mode0 -> voting mode; mode1 -> result mode 
            leds <= 8'hFF; 
        else if (mode == 0)
            leds <= 0;
        else if (mode == 1) //result mode
        begin
             if (candidate1_button_press)
                leds <= candidate1_vote;
             else if (candidate2_button_press)
                leds <= candidate2_vote;
             else if (candidate3_button_press)
                leds <= candidate3_vote;
             else if (candidate4_button_press)
                leds <= candidate4_vote;
             else 
                leds <= 0;
        end 
    end 
end

endmodule
