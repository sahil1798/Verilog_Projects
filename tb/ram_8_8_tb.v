`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 22:08:01
// Design Name: 
// Module Name: ram_8_8_tb
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


module ram_8_8_tb(

    );
    
    reg clk,rst,wr_enb;
    reg [3:0] wr_add;
    reg [7:0] data_in;
    reg rd_enb;
    reg [3:0] rd_addr;
    
    wire [7:0] data_out;
    
    RAM_8_8 dut(clk,rst,wr_enb,wr_add,data_in,rd_enb,rd_addr,data_out);
    
    initial begin
    {clk,rst,wr_enb,wr_add,data_in,rd_enb,rd_addr}=0;
    end
    
    
    always #5 clk = ~clk;
    
    initial begin
    rst=1;
    #10;
    rst=0;
    wr_enb=1;
    wr_add=3'b100;
    data_in=5;
    #10;
    wr_enb=1;
    wr_add=3'b101;
    data_in=10;
    #10;
    wr_enb=0;
    rd_addr=3'b100;
    #10;
    rd_addr=3'b101;
    #10;
    
    $finish;
    end
    
    
endmodule
