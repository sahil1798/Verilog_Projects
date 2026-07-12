`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 18:14:36
// Design Name: 
// Module Name: decoder_ram_8_8
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


module decoder_ram_8_8(
    input clk,rst,we,cs,oe,input[2:0]add,
    inout [7:0] data

    );
    reg [7:0] mem[0:7];
    reg [7:0] temp_data;
    integer i;
    always@(posedge clk) begin
    if(rst)
    for(i=0;i<8;i=i+1)
    
    mem[i]<=0;
    else if(we && cs)
    mem[add] <= data;
    else if(cs && !we)
    temp_data <= mem[add];
    
    end
    
    assign data = (!we && cs && oe) ? temp_data : 'bz;
    
endmodule
