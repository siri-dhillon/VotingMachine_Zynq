`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 04:33:11 PM
// Design Name: 
// Module Name: voteLogger
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


module voteLogger(
input clock, 
input reset,
input cand1_vote_valid,
input cand2_vote_valid,
input cand3_vote_valid,
input cand4_vote_valid,
inmput mode,
output reg [7:0] cand1_vote_rcvd,
output reg [7:0] cand2_vote_rcvd,
output reg [7:0] cand3_vote_rcvd,
output reg [7:0] cand4_vote_rcvd

);
    
always @(posedge clock)
begin
    if (reset)
    begin
        cand1_vote_rcvd <= 0;
        cand2_vote_rcvd <= 0;
        cand3_vote_rcvd <= 0;
        cand4_vote_rcvd <= 0;
    end
    else 
    begin
        if(cand1_vote_valid & mode == 0)
            cand1_vote_rcvd <= cand1_vote_rcvd + 1;
        else if(cand2_vote_valid & mode == 0)
            cand2_vote_rcvd <= cand2_vote_rcvd + 1;
        else if(cand3_vote_valid & mode == 0)
            cand3_vote_rcvd <= cand3_vote_rcvd + 1;
        else if(cand4_vote_valid & mode == 0)
            cand4_vote_rcvd <= cand4_vote_rcvd + 1;
         
     
    end 

 
end    
    
    
endmodule
