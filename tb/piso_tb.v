`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 17:25:19
// Design Name: 
// Module Name: piso_tb
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


module piso_tb(

    );
    
    reg clk,rst,load;
    reg [3:0] p_in;
    wire s_out;
    
    piso dut(clk,rst,load,p_in,s_out);
    
    initial begin
    {clk,rst,load,p_in}=0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
    
    rst = 1;
    #10; 
    rst = 0;
    #10;
    p_in = 4'b1101;
    load=1'b1;
    
    #20;
    load=1'b0;
    end
    
    
    
endmodule
