
module mux_4_1_tb(

    );
    
    reg [1:0] s;
    
    reg [3:0] in;
    wire y;
    integer i;
    
    mux_4_1 dut(s,in,y);
    
    initial begin
    {s,in}=0;
    end
    
    
    initial begin
    for(i=0;i<64;i=i+1)begin
    #1
    {s,in}=i;
    end
    end
    
        
    
    
    
endmodule
