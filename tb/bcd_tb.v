
module bcd_tb(

    );
    
    reg [3:0] a_tb,b_tb;
    reg cin_tb;
    wire [3:0] sum_tb;
    wire cout_tb;
    
    bcd_adder dut(a_tb,b_tb,cin_tb,sum_tb,cout_tb);
    
    initial
        begin
            {a_tb,b_tb,cin_tb}=0;
         end
    
    initial
        begin
            a_tb= 4'b0110;
            b_tb=4'b0010;
            cin_tb=1'b1;
            $monitor("the value of sum is %b and cout is %b", sum_tb, cout_tb);
        end
         
endmodule
