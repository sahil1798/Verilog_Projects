

module mux_4_1(
    input [1:0] sel, [3:0] i,output reg y    

    );
    
    always@(*)
    begin
    if(sel == 2'b00)
    y=i[0];
    
    else
    if(sel == 2'b01)
    y=i[1];
    
    else
    if(sel == 2'b10)
    y=i[2];
    
    else
    
    y=i[3];
    end
    
     
endmodule
