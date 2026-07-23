`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 08:10:09
// Design Name: 
// Module Name: spi_master
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


module spi_master(

    input clk,rst,start,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg done,sclk,mosi,cs,
    input miso

    );
    
    parameter IDLE = 2'b00, TRANSFER = 2'b01, DONE = 2'b10;
    reg [1:0] current_state, next_state;
    
    reg [2:0] bit_index;
    
    reg [7:0] tx_reg,rx_reg;
    reg [3:0] clk_count;
    
    
    always@(posedge clk) begin
    if(rst) current_state<=IDLE;
    else current_state<=next_state;
    end
    
    
    always@(*) begin
    next_state=current_state;
    case(current_state)
    
    IDLE: begin
    if(start==1'b1) next_state=TRANSFER;
    else next_state=IDLE;
    end
    
    TRANSFER: begin
    if(bit_index==3'd0 && sclk==1'b1 && clk_count==4'd4) next_state=DONE;
    else next_state=TRANSFER;
    end
    
    DONE: begin
    next_state=IDLE;
    end
    
    default: next_state = IDLE;
    endcase
    end
    
    
        always @(posedge clk) begin
        if (rst) begin
            cs        <= 1'b1; // Idle high
            sclk      <= 1'b0; // CPOL = 0 (idle low)
            mosi      <= 1'b0;
            done      <= 1'b0;
            data_out  <= 8'b0;
            tx_reg    <= 8'b0;
            rx_reg    <= 8'b0;
            bit_index <= 3'd7;
            clk_count <= 4'b0;
        end
        else begin
        done<=1'b0;
        case(current_state)
        IDLE: begin
        cs<=1'b1;
        sclk<=1'b0;
        bit_index<=3'd7;
        clk_count<=4'b0;
        
        if(start) begin
        tx_reg<=data_in;
        mosi<= data_in[7];
        end
        end
        
        TRANSFER: begin
        cs<=1'b0;
        
        if(clk_count == 4'd4) begin
        clk_count <= 0;
        if(sclk == 1'b0) begin
        sclk<=1'b1;
        rx_reg[bit_index]<=miso;
        end
       
        else begin
        sclk<=1'b0;
        
        
        if(bit_index > 3'd0) begin
        bit_index <= bit_index - 1'b1;
        mosi <= tx_reg[bit_index-1'b1];
        end
        
        end
        end
        else begin
        clk_count<=clk_count+1'b1;
        end
        end
        
        DONE: begin
        cs<=1'b1;
        sclk<=1'b0;
        data_out<=rx_reg;
        done<=1'b1;
        end
        endcase
        end
        end
         
    
endmodule
