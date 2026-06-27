`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 23:48:49
// Design Name: 
// Module Name: jk_tb
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


module jk_tb(

    );
    
    reg enb,rst,j,k;
    wire q,qbar;
    integer i;
    jk_latch dut(enb,rst,j,k,q,qbar);
    
    initial begin
    {enb,rst,j,k}=0;
    end
    
    always #5 enb = ~enb;
    
    initial 
    begin
    rst = 1'b1;
    #10;
    rst = 1'b0;
    
    #10;
    
    for(i=0;i<4;i=i+1) begin
    #1;
    {j,k}=i;
    end
    end
    
endmodule
