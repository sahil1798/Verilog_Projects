`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 17:39:51
// Design Name: 
// Module Name: pipo_tb
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


module pipo_tb(

    );
    
    reg clk,enb,rst,load;
    reg [3:0] p_in;
    
    wire [3:0] p_out;
    
    pipo dut(clk,enb,rst,load,p_in,p_out);
    
    initial begin
    {clk,enb,rst,load,p_in}=0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
    rst = 1;
    #10;
    rst = 0;
    #10;
    p_in = 4'b1110;
    load = 1'b1;
    #30;
    load = 1'b0;
    end
    
endmodule
