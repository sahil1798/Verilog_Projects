`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 17:53:07
// Design Name: 
// Module Name: siso
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


module siso(
    input clk,rst,s_in,enb, output reg s_out

    );
    
    reg [3:0] temp;
    //BY SHIFT OPERATOR
//    always@(posedge clk) begin
//    if(rst)
//    temp<=4'b0000;
//    else if(enb) begin
//    temp <= temp >> 1'b1;
//    temp[3] <= s_in;
//    s_out <= temp[0];
//    end
//    end


    //BY CONCATENATION OPERATORS
    
    always@(posedge clk)
    begin
    if(rst)
    temp=4'b0000;
    else
    if(enb) begin
    temp <= {s_in, temp[3:1]};
    
    s_out <= temp[0];
    end
    end
    
    
    
endmodule
