`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 16:29:06
// Design Name: 
// Module Name: d_latch
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

 
module d_latch(
    input enb,d_in,rst, output reg q,qbar

    );
    
    always @(*) begin
        if (!enb) begin
            if (rst) begin
                q    = 1'b0;
                qbar = 1'b1;
            end else begin
                q    = d_in;
                qbar = ~d_in;
            end
        end
    end
        
    
     
endmodule
