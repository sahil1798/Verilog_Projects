`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 13:44:07
// Design Name: 
// Module Name: lift_controller
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


module lift_controller(
    input clk,rst,input [3:0] flr_req,input em_stop,
    output reg mov_up,mov_down,motor_stop,
    output reg [1:0] curr_flr    
    );
    
    parameter idle = 2'b00, move_up=2'b01, move_down=2'b10, door = 2'b11;
    reg [1:0] current_state,next_state;
    reg [1:0] target_flr;
    reg [1:0] door_timer;
    reg [1:0] target_temp; 
    
    
    always@(posedge clk) begin
    if(rst) begin
    current_state<=idle;
    curr_flr<=2'b00;
    door_timer<=2'b00;
    target_flr<=2'b00;
    end
    else begin
    if(em_stop)begin
    end
    else 
    begin
    current_state<=next_state;
    if (current_state == idle) begin
                    if (flr_req[0])      target_flr <= 2'b00;
                    else if (flr_req[1]) target_flr <= 2'b01;
                    else if (flr_req[2]) target_flr <= 2'b10;
                    else if (flr_req[3]) target_flr <= 2'b11;
                end
                
    if(current_state==move_up)
    begin
    curr_flr<=curr_flr+1'b1;
    end
    else if(current_state==move_down)
    begin
    curr_flr<=curr_flr-1'b1;
    end
    else if(current_state==door)
    door_timer<=door_timer+1;
    else
    door_timer<=2'b00;
    end
    end
    
    
    
    end
    
    always@(*)
    begin
    next_state = current_state;
    mov_up     = 1'b0;
    mov_down   = 1'b0;  
    motor_stop = 1'b0;
    target_temp=target_flr;
    if (flr_req[0])      target_temp = 2'b00;
        else if (flr_req[1]) target_temp = 2'b01;
        else if (flr_req[2]) target_temp = 2'b10;
        else if (flr_req[3]) target_temp = 2'b11;
    if(em_stop)
    motor_stop=1'b1;
    else begin
    case(current_state)
    idle:begin
    motor_stop=1'b1;
    if(flr_req != 4'b0000)
    begin
    if(target_temp>curr_flr) next_state=move_up;
    else if(target_temp<curr_flr) next_state=move_down;
    else if(target_temp==curr_flr) next_state=door;
    end
    end
    move_up:begin
    mov_up=1'b1;
    if(target_flr!=curr_flr) next_state=move_up;
    else next_state=door;
    end
    move_down: begin
    mov_down=1'b1;
    if(target_flr!=curr_flr) next_state=move_down;
    else next_state=door;
    end
    door: begin
    motor_stop=1'b1;
    if(door_timer==2'd2)
    next_state=idle;
    else
    next_state=door;
    end
    endcase
    end
    end
            
    
    
      
        
endmodule
