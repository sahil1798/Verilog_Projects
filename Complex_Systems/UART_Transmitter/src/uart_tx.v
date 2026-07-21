`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 21:40:50
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk,rst,tx_start,
    input [7:0] data_in,
    output reg tx_pin,tx_done,
    output tx_active
    

    );
    parameter CLK_LIMIT = 10416;
    reg [13:0] clk_count; // Needs to be wide enough to hold 10,416
    reg baud_tick;
    parameter idle=2'b00, start=2'b01, data=2'b10, stop=2'b11;
    reg [1:0] current_state, next_state;
    reg [2:0] bit_index;
    reg [7:0] tx_data;
    
    
    always@(posedge clk) begin
    if(rst) begin
    clk_count<=14'b0;
    baud_tick<=1'b0;
    end
    else begin
    if(clk_count == (CLK_LIMIT-1)) begin
    clk_count<=14'b0;
    baud_tick<=1'b1;
    end
    else begin
    clk_count<=clk_count+1;
    baud_tick<=1'b0;
    end
    end
    end
    
    always@(*) begin
    case(current_state)
    idle: begin
    if(tx_start) next_state = start;
    else next_state=idle;
    end
    start: begin
    if(baud_tick) next_state = data;
    else next_state=start;
    end
    data: begin
    if(baud_tick && bit_index==3'd7) next_state=stop;
    else next_state=data;
    end
    stop: begin
    if(baud_tick) next_state=idle;
    else next_state=stop;
    end
    endcase
    end
    
    
   always@(posedge clk) begin
   if(rst) current_state<=idle;
   else current_state<=next_state;
   end
   
   always@(posedge clk) begin
   if(rst) begin
   tx_data<=8'b0;
   tx_pin<=1'b1;
   bit_index<=3'b0;
   tx_done<=1'b0;
   end
   else begin
    tx_done <= 1'b0;
   case(current_state)
   idle: begin
   
   tx_pin<=1'b1;
   bit_index<=3'b0;
   if(tx_start) begin
   tx_data<=data_in;
   end
   end
   
   start: begin
   tx_pin<=1'b0;
   end
   data: begin
   if(baud_tick) begin
   tx_pin<=tx_data[bit_index];
   bit_index<=bit_index + 1'b1;
   end
   else begin end
   end
   
   stop: begin
   tx_pin<=1'b1;
   if(baud_tick) tx_done<=1'b1;
   else tx_done<=1'b0;
   end
   endcase
   end
   end 
     
   assign tx_active = (current_state != idle);        
endmodule
