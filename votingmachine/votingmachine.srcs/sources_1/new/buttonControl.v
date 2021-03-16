`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: 
// 
// Create Date: 03/14/2021 04:16:47 PM
// Design Name: 
// Module Name: buttonControl
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


module buttonControl(

input clock, 
input reset,
input button, 
output reg valid_vote

);

reg [30:0] counter;

always @(posedge clock)
begin 
    if (reset)
        counter <=0; 
    else
    begin
       if(button & counter < 100000001)
            counter <= counter + 1;
       else if (!button)
            counter <= 0; 
       end 
end 


always @(posedge clock)
begin 
    if (reset)
        valid_vote <= 1'b0;
        else 
        begin
            if (counter == 100000000)
                valid_vote <= 1'b1;
            else 
                valid_vote <= 1'b0;    
        end
end

endmodule
