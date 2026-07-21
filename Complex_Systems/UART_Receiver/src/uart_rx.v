`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: uart_rx
// Description: Synthesizable UART Receiver with 16x oversampling and noise filter.
//////////////////////////////////////////////////////////////////////////////////

module uart_rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data_out,
    output reg rx_done
);

    // Oversampling Clock Divider Parameters
    parameter CLK_LIMIT = 651;
    reg [9:0] clk_counter;
    reg sample_tick;

    // FSM States
    parameter idle = 2'b00, start = 2'b01, data = 2'b10, stop = 2'b11;
    reg [1:0] current_state, next_state;

    // Internal Registers
    reg [3:0] tick_count;
    reg [2:0] bit_index;
    reg [7:0] rx_data;

    // 1. 16x Oversampling Clock Generator
    always @(posedge clk) begin
        if (rst) begin
            clk_counter <= 10'b0;
            sample_tick <= 1'b0;
        end
        else begin
            if (clk_counter == (CLK_LIMIT - 1)) begin
                clk_counter <= 10'b0;
                sample_tick <= 1'b1;
            end
            else begin
                clk_counter <= clk_counter + 10'b1;
                sample_tick <= 1'b0;
            end
        end
    end

    // 2. FSM Next State Logic (Combinational)
    always @(*) begin
        next_state = current_state;
        case (current_state)
            idle: begin
                if (rx == 1'b0) next_state = start;
                else            next_state = idle;
            end
            start: begin
                if (sample_tick && tick_count == 4'd7) begin
                    if (rx == 1'b0) next_state = data;
                    else            next_state = idle; // Noise filter
                end
            end
            data: begin
                if (sample_tick && tick_count == 4'd15) begin
                    if (bit_index == 3'd7) next_state = stop;
                    else                   next_state = data;
                end
            end
            stop: begin
                if (sample_tick && tick_count == 4'd15) begin
                    next_state = idle;
                end
            end
            default: next_state = idle;
        endcase
    end

    // 3. FSM State Transition (Clocked)
    always @(posedge clk) begin
        if (rst) current_state <= idle;
        else    current_state <= next_state;
    end

    // 4. FSM Outputs & Register Actions (Clocked)
    always @(posedge clk) begin
        if (rst) begin
            data_out   <= 8'b0;
            rx_done    <= 1'b0;
            tick_count <= 4'b0;
            bit_index  <= 3'b0;
            rx_data    <= 8'b0;
        end 
        else begin
            rx_done <= 1'b0; // Default pulse high for 1 cycle
            
            case (current_state)
                idle: begin
                    tick_count <= 4'b0;
                    bit_index  <= 3'b0;
                end
                
                start: begin
                    if (sample_tick) begin 
                        if (tick_count == 4'd7) begin
                            tick_count <= 4'b0;
                        end
                        else begin
                            tick_count <= tick_count + 4'b1;
                        end
                    end
                end
                
                data: begin
                    if (sample_tick) begin 
                        if (tick_count == 4'd15) begin
                            tick_count <= 4'b0;
                            rx_data[bit_index] <= rx;
                            bit_index <= bit_index + 3'b1;
                        end
                        else begin
                            tick_count <= tick_count + 4'b1;
                        end
                    end
                end
                
                stop: begin
                    if (sample_tick) begin 
                        if (tick_count == 4'd15) begin
                            tick_count <= 4'b0;
                            data_out   <= rx_data;
                            rx_done    <= 1'b1;
                        end
                        else begin
                            tick_count <= tick_count + 4'b1;
                        end
                    end
                end
            endcase
        end
    end

endmodule
