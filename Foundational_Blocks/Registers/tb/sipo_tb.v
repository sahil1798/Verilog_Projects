`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 16:56:23
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb(

    );
    
    reg clk,rst,enb,s_in;
    wire [3:0] p_out;
    
    sipo dut(clk,rst,s_in,enb,p_out);
    
    initial begin
    {clk,rst,s_in,enb}=0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
    rst = 1;
    #10;
    rst = 0;
    #10;
    s_in = 1'b1;
    #10;
    s_in = 1'b1;
    #10;
    s_in = 1'b0;
    #10;
    s_in = 1'b0;
    #20;
    enb=1;
   
    end
    
endmodule
