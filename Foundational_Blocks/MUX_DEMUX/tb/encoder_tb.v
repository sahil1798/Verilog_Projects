

module encoder_tb(

    );
    
    reg [3:0] din;
    wire [1:0] y;
    
    encoder_4_2 dut(din,y);
    
    initial begin
    {din}=0;
    
    end
    
    initial begin
    din=4'b0001;
    #1;
    din=4'b0010;
    #1;
    din=4'b0100;
    #1;
    din=4'b1000;
    end
    
    
    
endmodule
