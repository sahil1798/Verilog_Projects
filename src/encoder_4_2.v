
module encoder_4_2(
    input [3:0]din, output reg [1:0] y
    
   

    );
    
    always@(*) begin
    if(din == 4'b0001)
    y=2'b00;
    
    else
    if(din == 4'b0010)
    y=2'b01;
    
    else
    if(din == 4'b0100)
    y=2'b10;
    
    else
    if(din == 4'b1000)
    y=2'b11; 
    
    end
    
    
    
    
endmodule
