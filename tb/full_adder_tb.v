

module full_adder_tb(

    );
    //step-1: Declare variables that are going to be used.
    reg a_tb,b_tb,cin_tb;
    wire sum_tb,carry_tb;
    
    //step-2: Connection of design
    FULL_ADDER dut(a_tb,b_tb,cin_tb,sum_tb,carry_tb);
    
    //step-3: Initialize inputs
    initial
    begin
    {a_tb,b_tb,cin_tb}=0;
    end
    
    //step-4: Drive Inputs
    initial
    begin
    
    $monitor("the value of a_tb is %b and value of b_tb is %b,cin_tb is %b sum_tb is %b and carry_tb is %b", a_tb,b_tb,cin_tb,sum_tb,carry_tb);
    a_tb=1'b1;
    b_tb=1'b1;
    cin_tb=1'b1;
    
    #1;
    a_tb=1'b0;
    b_tb=1'b0;
    cin_tb=1'b1;
    
    #1;
    a_tb=1'b0;
    b_tb=1'b1;
    cin_tb=1'b0;
    
    #1;
    a_tb=1'b0;
    b_tb=1'b1;
    cin_tb=1'b1;
    
    #1;
    a_tb=1'b1;
    b_tb=1'b0;
    cin_tb=1'b0;
    
    #1;
    a_tb=1'b1;
    b_tb=1'b1;
    cin_tb=1'b0;
    
    end
    
    
    
endmodule
