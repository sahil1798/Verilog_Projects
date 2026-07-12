module top_fifo(
    input clk,
    input rst,
    input serial_in,
    output serial_out
    );

    // 1. Declare internal connection wires
    wire [7:0] data_a_to_fifo;
    wire wr_enb_a_to_fifo;
    
    wire [7:0] data_fifo_to_b;
    wire rd_enb_b_to_fifo;
    
    wire full, empty;

    // 2. Instantiate Module A (Producer)
    mod_a producer (
        .clk(clk),
        .rst(rst),
        .data_in(serial_in),
        .data_out(data_a_to_fifo),
        .wr_enb(wr_enb_a_to_fifo)
    );

    // 3. Instantiate FIFO Buffer
    fifo_8_8 buffer (
        .clk(clk),
        .rst(rst),
        .wr_enb(wr_enb_a_to_fifo),
        .rd_enb(rd_enb_b_to_fifo),
        .data_in(data_a_to_fifo),
        .data_out(data_fifo_to_b),
        .full(full),
        .empty(empty)
    );

    // 4. Instantiate Module B (Consumer)
    mod_b consumer (
        .clk(clk),
        .rst(rst),
        .data_in(data_fifo_to_b),
        .data_out(serial_out),
        .rd_enb(rd_enb_b_to_fifo)
    );

endmodule