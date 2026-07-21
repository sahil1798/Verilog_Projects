`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 10:38:58
// Design Name: 
// Module Name: uart_tb
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


module uart_tx_tb(

    );
    
    
    reg clk,rst,tx_start;
    reg [7:0] data_in;
    wire tx_pin;
    wire tx_done;
    wire tx_active;
    
    uart_tx dut(clk,rst,tx_start,data_in,tx_pin,tx_done,tx_active);
    
   
    
  initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    
    
    initial begin
    {rst,tx_start,data_in}=0;
    
    rst=1;
    #20;
    rst=0;
    data_in = 8'hA5;
    tx_start=1;
    #10;
    tx_start=0;
    @(posedge tx_done);
    #100; 
    $finish;
    
    end
    
    
endmodule
