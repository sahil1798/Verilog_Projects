`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 22:08:01
// Design Name: 
// Module Name: ram_8_8_tb
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


module decoder_ram_tb(

    );
    
    reg clk,rst,we,cs,oe;
    reg [2:0] add;
    reg [7:0] data_temp;
    wire [7:0] data;
    reg cs1,cs2,cs3,cs4;
    
    decoder_ram_8_8 dut1(clk,rst,we,cs1,oe,add,data);
    decoder_ram_8_8 dut2(clk,rst,we,cs2,oe,add,data);
    decoder_ram_8_8 dut3(clk,rst,we,cs3,oe,add,data);
    decoder_ram_8_8 dut4(clk,rst,we,cs4,oe,add,data);
    
    always@(*)
    begin
    if(add==2'b00)
    begin
    cs1=1'b1;
    cs2=1'b0;
    cs3=1'b0;
    cs4=1'b0;
    end
    else if(add==2'b01)
    begin
    cs1=1'b0;
    cs2=1'b1;
    cs3=1'b0;
    cs4=1'b0;
    end
    else if(add==2'b10)
    begin
    cs1=1'b0;
    cs2=1'b0;
    cs3=1'b1;
    cs4=1'b0;
    end
    
    else if(add==2'b11)
    begin
    cs1=1'b0;
    cs2=1'b0;
    cs3=1'b0;
    cs4=1'b1;
    end;
    end;
    
    initial begin
    {clk,rst,we,cs,oe,add,data_temp}=0;
    end
    
    
    always #5 clk = ~clk;
    
    initial begin
    @(negedge clk)
    rst=1;
    @(negedge clk)
    rst=0;
    
    @(negedge clk)
    we=1;
    cs=1;
    data_temp=8'b1101_0011;
    add=0;
    
    @(negedge clk)
    we=1'b0;
    cs=1'b1;
    add=0;
    oe=1;
    #20;
    
    $finish;
    end
    assign data = data_temp;
    
    
endmodule
