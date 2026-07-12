`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 00:19:35
// Design Name: 
// Module Name: decoder_2_4
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


module decoder_2_4(

    input [1:0] din, output reg [3:0] y
    

    );
    
    always@(*)
        begin
            if(din == 2'b00)
                y=4'b0001;
            else
            if(din == 2'b01)
                y=4'b0010;
            else
            if(din == 2'b10)
                y=4'b0100;
            else 
            if(din==2'b11)
            y=4'b1000;            
            end
            
endmodule
