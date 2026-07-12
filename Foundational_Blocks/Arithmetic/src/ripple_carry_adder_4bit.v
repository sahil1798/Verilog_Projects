`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 13:47:37
// Design Name: 
// Module Name: ripple_carry_adder_4bit
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


module ripple_carry_adder_4bit(
    input [3:0] a_rca,b_rca,input cin,
    output [3:0] sum_rca,output carry_rca
    );
    
    wire w1,w2,w3;
    FULL_ADDER FA1(a_rca[0],b_rca[0],cin,sum_rca[0],w1);
    FULL_ADDER FA2(a_rca[1],b_rca[1],w1,sum_rca[1],w2);
    FULL_ADDER FA3(a_rca[2],b_rca[2],w2,sum_rca[2],w3);
    FULL_ADDER FA4(a_rca[3],b_rca[3],cin,sum_rca[3],carry_rca);
    
    
    
    
endmodule
