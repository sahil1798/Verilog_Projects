`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 18:04:40
// Design Name: 
// Module Name: t_latch
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


module t_latch(
    input enb,rst,t_in,output reg q,qbar

    );
    
    always@(enb)
    if(enb)
    if(rst)
    begin
    q<=1'b0;
    q<=1'b1;
    end
    else if(t_in == 0) begin
    q<=q;
    qbar<=qbar;
    end
    
    else if(t_in == 1'b1) begin
    q<=~q;
    qbar<=~qbar;
    end
    
    
endmodule
