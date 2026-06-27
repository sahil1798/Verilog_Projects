`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 16:52:42
// Design Name: 
// Module Name: sipo
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


module sipo(
    input clk,rst,s_in,enb, output reg[3:0] p_out
    );
    
    reg [3:0] temp;
    
    always@(posedge clk)
    if(rst) begin
    temp <= 4'b0000;
    end
    
    else if(enb == 0)
    
    begin
    
    temp <= temp >> 1'b1;
    temp[3] <= s_in;
    end
    
    else if(enb == 1)
    begin
    p_out <= temp;
    
    end
    
    
    
endmodule
