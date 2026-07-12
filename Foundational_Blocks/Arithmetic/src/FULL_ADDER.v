

module FULL_ADDER(input a_fa,b_fa,cin_fa, output reg sum_fa,carry_fa

    );
    
    always@(*)
    
    begin
    sum_fa=a_fa^b_fa^cin_fa;
    carry_fa=(a_fa & b_fa) | (b_fa & cin_fa) | (cin_fa & a_fa);
    end
     
    
endmodule
