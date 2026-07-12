`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 22:45:39
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input clk,rst,
    output reg [2:0] main_light,
    output reg [2:0] side_light 

    );
    reg [1:0] ps,ns;
    reg [3:0] timer;
    parameter S0 = 2'b00,
    S1=2'b01,
    S2=2'b10,
    S3=2'b11;
    
    
    always@(posedge clk)
    begin
    if(rst)begin
    ps<=S0;
    timer<=0;
    end
    else begin
    ps<=ns;
    
    if(ps!=ns) begin
    timer<=0;
    end
    else begin
    timer<=timer+1'b1;
    end
    end
    end
    
    always@(*) begin
    
    ns=ps;
    main_light=3'b100;//red
    side_light=3'b100;//red
    
    case(ps)
    
    
    S0: begin
    main_light=3'b001;
    side_light=3'b100;
    if(timer == 4'd9)
    begin
    ns=S1;
    end
    else
    begin
    ns=S0;
    end
    end
    
    
    S1: begin
    main_light=3'b010;
    side_light=3'b100;
    if(timer==4'd2)
    ns=S2;
    else
    ns=S1;
    end
    
    S2: begin
    main_light=3'b100;
    side_light=3'b001;
    if(timer==4'd5)
    ns=S3;
    else
    ns=S2;
    end
    
    S3: begin
    main_light=3'b100;
    side_light=3'b010;
    if(timer==4'd2)
    ns=S0;
    else
    ns=S3;
    end
    
    
    
    
    
    
    endcase
    end
endmodule
