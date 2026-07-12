
module rca_tb(

    );
    
    reg [3:0] a_tb,b_tb;
    reg cin_tb;
    wire [3:0] sum_tb;
    wire carry_tb;
    
    ripple_carry_adder_4bit dut(a_tb,b_tb,cin_tb,sum_tb,carry_tb);
    
    initial
        begin
            {a_tb,b_tb,cin_tb}=0;
         end
    
    initial
        begin
            a_tb= 4'b0110;
            b_tb=4'b1110;
            cin_tb=1'b1;
            $monitor("the value of sum is %b and cout is %b", sum_tb, carry_tb);
        end
         
endmodule
