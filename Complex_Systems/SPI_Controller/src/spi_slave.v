`timescale 1ns / 1ps

module spi_slave(
    input clk,
    input rst,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg rx_done,
    input sclk,
    input cs,
    input mosi,
    output reg miso
);

    reg [7:0] tx_reg;
    reg [7:0] rx_reg;
    reg [2:0] bit_index;
    reg [1:0] sclk_r;
    
    always @(posedge clk) begin
        if (rst) 
            sclk_r <= 2'b00;
        else 
            sclk_r <= {sclk_r[0], sclk};
    end
    
    wire sclk_rising  = (sclk_r == 2'b01);
    wire sclk_falling = (sclk_r == 2'b10);

    always @(posedge clk) begin
        if (rst) begin
            miso      <= 1'b0;
            rx_done   <= 1'b0;
            data_out  <= 8'b0;
            tx_reg    <= 8'b0;
            rx_reg    <= 8'b0;
            bit_index <= 3'd7;
        end 
        else begin
            rx_done <= 1'b0;
            
            if (cs) begin
                bit_index <= 3'd7;
                tx_reg    <= data_in;
                miso      <= data_in[7]; // Pre-load MSB onto MISO
            end 
            else begin
                // 1. Sample incoming bit on Rising Edge
                if (sclk_rising) begin
                    rx_reg[bit_index] <= mosi;
                    
                    if (bit_index == 3'd0) begin
                        data_out <= {rx_reg[7:1], mosi};
                        rx_done  <= 1'b1;
                    end
                end
                
                // 2. Shift out next bit on Falling Edge
                if (sclk_falling) begin
                    if (bit_index > 3'd0) begin
                        bit_index <= bit_index - 1'b1;
                        miso      <= tx_reg[bit_index - 1'b1];
                    end
                end
            end
        end
    end

endmodule