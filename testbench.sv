// Code your testbench here
// or browse Examples
module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire highway_red, highway_yellow, highway_green, farm_red, farm_yellow, farm_green;

    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .highway_red(highway_red),
        .highway_yellow(highway_yellow),
        .highway_green(highway_green),
        .farm_red(farm_red),
        .farm_yellow(farm_yellow),
        .farm_green(farm_green)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Run for some time to observe state transitions
        #100;

        // Finish the simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("At time %0d: highway_red = %b, highway_yellow = %b, highway_green = %b, farm_red = %b, farm_yellow = %b, farm_green = %b",
                 $time, highway_red, highway_yellow, highway_green, farm_red, farm_yellow, farm_green);
    end

endmodule
