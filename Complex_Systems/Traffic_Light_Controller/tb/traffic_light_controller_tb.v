`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg rst;
    wire [2:0] main_light;
    wire [2:0] side_light;

    // Instantiate the Controller
    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .main_light(main_light),
        .side_light(side_light)
    );

    // 10ns Clock Generator (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        #15;
        
        rst = 0; // Release Reset

        // Let it run for 400ns to see multiple cycles of all states
        #400;
        
        $finish;
    end

    // Monitor light changes in the console
    initial begin
        $monitor("Time = %0t | Reset = %b | State = %b | Timer = %d | Main = %b | Side = %b", 
                 $time, rst, uut.ps, uut.timer, main_light, side_light);
    end

endmodule