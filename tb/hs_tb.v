

module hs_tb(

    );
    //step-1: Declare variables that are going to be used.
    reg a_tb,b_tb;
    wire diff_tb,borrow_tb;
    
    //step-2: Connection of design
    half_subtractor dut(a_tb,b_tb,diff_tb,borrow_tb);
    
    //step-3: Initialize inputs
    initial
    begin
    {a_tb,b_tb}=0;
    end
    
    //step-4: Drive Inputs
    initial
    begin
    
    $monitor("the value of a_tb is %b and value of b_tb is %b,diff_tb is %b and borrow_tb is %b", a_tb,b_tb,diff_tb,borrow_tb);

    
    #1;
    a_tb=1'b0;
    b_tb=1'b0;
    
    
    #1;
    a_tb=1'b0;
    b_tb=1'b1;
    ;
    
 
    
    #1;
    a_tb=1'b1;
    b_tb=1'b0;
  
    
    #1;
    a_tb=1'b1;
    b_tb=1'b1;
 
    
    end
    
    
    
endmodule
