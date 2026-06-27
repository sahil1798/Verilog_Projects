`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 17:38:34
// Design Name: 
// Module Name: d_latch_tb
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


module d_latch_tb(

    );
    
    reg enb,rst,d_in;
    wire q,qbar;
    
    d_latch dut (
        .enb(enb),
        .d_in(d_in),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );
    
    initial begin
    {enb,rst,d_in}=0;
    end
    always #5 enb = ~enb;
    
    initial begin
    rst=1;
    #15;
    rst=0;
    #5;
    d_in=1;
    #10;
    d_in=0;
    
    end
     
endmodule
