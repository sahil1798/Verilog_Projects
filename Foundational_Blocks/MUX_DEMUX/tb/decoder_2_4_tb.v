

module decoder_2_4_tb(

    );
    
    reg [1:0] din;
    wire [3:0] y;
    
    decoder_2_4 dut(din,y);
    
    initial begin
    {din}=0;
    end
    
    initial begin
    din=2'b00;
    #1;
    din=2'b01;
    #1;
    din=2'b10;
    #1;
    din=2'b11;
    end
    
endmodule
