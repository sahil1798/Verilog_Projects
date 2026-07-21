`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2026 13:44:27
// Design Name: 
// Module Name: uart_tx_rx_tb
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


module uart_tx_rx_tb(

    );
    
    reg clk,rst;
    reg [7:0] data_in;
    reg tx_start;
    
    wire [7:0] data_out;
    wire rx_done;
    wire loopback_wire;
    wire tx_active;
    wire tx_done;
    
    // 1. Instantiate the Transmitter
    uart_tx tx_inst (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .data_in(data_in),
        .tx_pin(loopback_wire), // Connect transmitter output to the wire
        .tx_active(tx_active),
        .tx_done(tx_done)
    );

    // 2. Instantiate the Receiver
    uart_rx rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(loopback_wire),    // Connect receiver input to the same wire!
        .data_out(data_out),
        .rx_done(rx_done)
    );
    
    initial begin
    clk=0;
    forever #5 clk = ~clk;
    end
    
    
    initial begin
    {rst,tx_start,data_in}=0;
    
    rst=1;
    #20;
    rst=0;
    #20;
    data_in=8'hd5;
    tx_start=1'b1;
    #10;
    tx_start=1'b0;
    
    @(posedge rx_done);
    #100;
    $finish;
    end
    
    
endmodule
