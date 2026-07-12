`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 23:23:52
// Design Name: 
// Module Name: fifo_8_8
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


module fifo_8_8(
    input clk,rst,wr_enb,rd_enb,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,empty
    );
    
    reg [2:0] wr_ptr, rd_ptr;
    reg [7:0] mem[7:0];
    integer i;
    
    always@(posedge clk)
    begin
    if(rst)begin
    wr_ptr   <= 3'b000;
            rd_ptr   <= 3'b000;
            data_out <= 8'h00;
    for(i=0;i<7;i=i+1)
    mem[i]<=0;
    end
    else if(wr_enb && full==0) begin
    mem[wr_ptr]<=data_in;
    wr_ptr<=wr_ptr+1;
    end
    else if(rd_enb && empty==0)begin
    data_out<=mem[rd_ptr];
    rd_ptr<=rd_ptr+1;
    end
    end
    assign full = ((wr_ptr+1'b1) == rd_ptr) ? 1'b1 : 1'b0;
    assign empty = wr_ptr == rd_ptr;
    
    
    
    
    
    
endmodule
