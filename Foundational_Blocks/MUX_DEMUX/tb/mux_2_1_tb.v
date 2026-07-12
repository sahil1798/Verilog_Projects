
module mux_2_1_tb(

    );
    
    reg [1:0] i;
    reg s;
    wire y;
    integer m;
    
    mux_2_1 dut(s,i,y);
    
    
    initial begin
        $monitor("Time = %0t | s = %b | i = %b | y = %b", $time, s, i, y);
    end

    initial begin
        {s,i} = 0;
        for(m=0;m<8;m=m+1) begin
            #1;
            {s,i} = m;
        end
        #1; 
   
    
    
    end
    
              
          
endmodule
