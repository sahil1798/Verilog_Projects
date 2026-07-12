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


module fifo_8_8_tb(

    );
    
    reg clk,rst,wr_enb;
   
    reg [7:0] data_in;
    reg rd_enb;
    
    
    wire [7:0] data_out;
    wire full,empty;
    
        // Instantiate the FIFO directly instead of top_fifo
    fifo_8_8 dut (
        .clk(clk),
        .rst(rst),
        .wr_enb(wr_enb),
        .rd_enb(rd_enb),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );
    
        initial begin
        // Initialize all registers to 0 at start
        clk = 0;
        rst = 1;
        wr_enb = 0;
        rd_enb = 0;
        data_in = 0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        rst = 1;
        #10;
        rst = 0;      // Release reset
        
        // --- Write Data 5 ---
        wr_enb = 1;   // Enable write
        data_in = 5;
        #10;
        
        // --- Write Data 10 ---
        data_in = 10;
        #10;
        
        // --- Write Data 50 ---
        data_in = 50;
        #10;
        wr_enb = 0;   // Disable write
        #10;
        
        // --- Read Data ---
        rd_enb = 1;   // Enable read
        #30;          // Wait 3 clock cycles to read out the values
        rd_enb = 0;   // Disable read
        
        #10;
        $finish;
    end
    
endmodule
