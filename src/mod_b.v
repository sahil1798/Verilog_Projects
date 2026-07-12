`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 15:21:39
// Design Name: 
// Module Name: mod_b
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


module mod_b(
    input clk,rst,
    input [7:0] data_in,
    output reg data_out,
    output reg rd_enb

    
    );
    
    parameter idle =2'b00,s1= 2'b01,data_state=2'b10;
    reg[1:0] ps,ns;
    
    always@(posedge clk) begin
    if(rst) begin
    ps<=idle;
    end
    else
    ps<=ns;
    end
    
    always@(*)
    begin
    rd_enb=0;
    case(ps)
    idle: begin
    ns=s1;
    
    end
    s1: begin
    ns=data_state;
    end
    data_state: begin
    ns=idle;
    rd_enb=1;
    end
    endcase
    end
    
    
    
endmodule
