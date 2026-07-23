`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 19:28:16
// Design Name: 
// Module Name: spi_top_tb
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


module spi_top_tb(

    );
    
    
    wire sclk_wire,cs_wire,miso_wire,mosi_wire;
    
    reg clk,rst,master_start;
    reg [7:0] master_data_in,slave_data_in;
    
    wire [7:0] master_data_out,slave_data_out;
    wire master_done, slave_done;
    
    
    
    
    spi_master master_inst(
    .clk(clk),
    .rst(rst),
    .start(master_start),
    .data_in(master_data_in),
    .data_out(master_data_out),
    .done(master_done),
    .sclk(sclk_wire),
    .cs(cs_wire),
    .mosi(mosi_wire),
    .miso(miso_wire)
    );
    
    
    spi_slave slave_inst(
    .clk(clk),
    .rst(rst),
    .data_in(slave_data_in),
    .data_out(slave_data_out),
    .rx_done(slave_done),
    .sclk(sclk_wire),
    .cs(cs_wire),
    .mosi(mosi_wire),
    .miso(miso_wire)
    );
    
    initial begin
    clk=0;
    forever #5 clk = ~clk;
    end
    
    initial begin
    
    rst=1'b1;
    master_start=1'b0;
    
    master_data_in=8'hA5;
    slave_data_in=8'h3C;
    
    #20;
    rst=1'b0;
    #20;
    master_start=1'b1;
    #10;
    master_start=1'b0;
    
    @(posedge master_done);
    
    #100;
    $finish;
    end
    
endmodule
