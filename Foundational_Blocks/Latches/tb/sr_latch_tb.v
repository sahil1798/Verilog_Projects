

module sr_latch_tb(
    

    );
    
    reg enb,rst,s,r;
    wire q,qbar;
    
    sr_latch dut(enb,rst,s,r,q,qbar);
    
    initial begin
    {enb,rst,s,r}=0;
    end
    
    always #5 enb = ~enb;
    
    initial begin
    rst = 1;
    #10;
    rst = 0;
    //hold
    s=0;
    r=0;
    //set
    #10;
    s=1;
    r=0;
    
    //reset
    #10;
    s=0;
    r=1;
    
    //invalid
    #10;
    s=1;
    r=1;
    
    end
    
    
    
    
    
endmodule
