`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 23:31:54
// Design Name: 
// Module Name: RAM_8_8
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


module RAM_8_8(
    input clk,rst,wr_enb,
    input [3:0] wr_addr,input [7:0] data_in, input rd_enb,input [3:0] rd_addr,
    output reg [7:0] data_out

    );
    
    //creating one internal mem
    
    reg [7:0] mem[7:0];
    integer i;
    //write logic or reset logic
    
    always@(posedge clk or rst)
    begin
    if(rst)
    begin
    for(i=0;i<7;i=i+1)
    mem[i]<=0;
    end
    else
    if(wr_enb)
    mem[wr_addr]<=data_in;
    else if(wr_enb==0)
    data_out<=mem[rd_addr];
    end
    
    
    
    
    
    
endmodule
