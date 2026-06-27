`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 17:35:10
// Design Name: 
// Module Name: pipo
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


module pipo(
    input clk,rst,load, input [3:0] p_in, output reg p_out
    );
    
    reg [3:0] temp;
    
    always@(posedge clk) begin
    if(rst) begin
    temp <= 4'b0000;
    end
    
    else if(load) begin
    temp <= p_in;
    end
    
    else if(load == 0) begin
    p_out <= temp;
    end
    end
     
    
    
endmodule
