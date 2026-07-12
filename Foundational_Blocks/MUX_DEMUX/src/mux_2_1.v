
module mux_2_1(
    input s, input [1:0] i,
    output reg y
    
    );
    
    always@(*)
    begin
    case(s)
    0: y =i[0];
    1: y =i[1];
    default : y = 0;
     
    endcase
    end
    
endmodule
