`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:03:27
// Design Name: 
// Module Name: universal_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module universal_register(
    input clk,rst,load,shift,s_in, input [1:0] mode, input [3:0] p_in,
    output [3:0] p_out,
    output [1:0] s_out
    );
    
    reg [3:0] temp;
    
    always@(posedge clk) begin
    if(rst)
    temp<=4'b0000;
    case(mode)
    2'b00: //siso
    begin
    if(shift)
    temp <= {s_in, temp[3:1]};
    else
    temp <= temp;
    end
    
    
    2'b01:  //sipo
    begin
    if(shift)
    temp <= {s_in, temp[3:1]};
    else
    temp <= temp;
    end
    
    
    2'b10:  //piso
    begin
    if(load)
    temp<=p_in;
    else
    temp <= {s_in, temp[3:1]};
    end
    
    
    2'b11: //pipo
    begin
    if(load)
    temp<=p_in;
    else
    temp<=temp;
    
    end
    
    default: temp <= temp;
    
    
    
    endcase
    end
    
    assign s_out = temp[0];
    assign p_out = (shift == 0 && load == 0) ? temp : 'bx;
    
        
    
     
endmodule
