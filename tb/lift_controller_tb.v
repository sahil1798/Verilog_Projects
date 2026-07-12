

module lift_controller_tb;

    reg clk;
    reg rst;
    reg [3:0] flr_req;
    reg em_stop;
    
    wire mov_up;
    wire mov_down;
    wire motor_stop;
    wire [1:0] curr_flr;

    // Instantiate lift controller
    lift_controller uut (
        .clk(clk),
        .rst(rst),
        .flr_req(flr_req),
        .em_stop(em_stop),
        .mov_up(mov_up),
        .mov_down(mov_down),
        .motor_stop(motor_stop),
        .curr_flr(curr_flr)
    );

    // Clock Generator (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        flr_req = 4'b0000;
        em_stop = 0;
        #15;
        
        rst = 0; // Release Reset
        #10;

        // --- Test 1: Request Floor 2 ---
        $display("--- Requesting Floor 2 ---");
        flr_req = 4'b0100; // Press Floor 2 button
        #10;
        flr_req = 4'b0000; // Release button
        
        // Wait until it reaches Floor 2 and opens door
        #100;

        // --- Test 2: Request Floor 0 and Trigger Emergency Stop ---
        $display("--- Requesting Floor 0 with Emergency Stop ---");
        flr_req = 4'b0001; // Press Floor 0 button
        #10;
        flr_req = 4'b0000;
        
        #10; // Wait 1 cycle (mid-movement)
        em_stop = 1; // Trigger emergency stop
        #30; // Wait 3 cycles to verify it stays frozen
        
        em_stop = 0; // Release emergency stop
        
        #100;
        $finish;
    end

    // Monitor changes in console
    initial begin
        $monitor("Time = %0t | Rst = %b | Em = %b | State = %b | Floor = %d | Up = %b | Down = %b | Stop = %b",
                 $time, rst, em_stop, uut.current_state, curr_flr, mov_up, mov_down, motor_stop);
    end

endmodule