module traffic_light_controller (
    input clk,       // Clock signal
    input reset,     // Synchronous reset signal
    output reg highway_red,
    output reg highway_yellow,
    output reg highway_green,
    output reg farm_red,
    output reg farm_yellow,
    output reg farm_green
);

    // Parameters for timing
    parameter HIGHWAY_GREEN_TIME = 10;   // E.g., 10 clock cycles for simplicity
    parameter HIGHWAY_YELLOW_TIME = 2;   // E.g., 2 clock cycles
    parameter FARM_GREEN_TIME = 5;       // E.g., 5 clock cycles
    parameter FARM_YELLOW_TIME = 2;      // E.g., 2 clock cycles

    // State encoding
    typedef enum {
        S_HIGHWAY_GREEN,
        S_HIGHWAY_YELLOW,
        S_FARM_GREEN,
        S_FARM_YELLOW
    } state_t;

    state_t current_state, next_state;
    reg [3:0] timer;  // 4-bit timer for simplicity

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S_HIGHWAY_GREEN;
            timer <= 0;
        end else begin
            current_state <= next_state;
            if (timer < 15)  // Just ensuring timer doesn't overflow for this simple example
                timer <= timer + 1;
        end
    end

    always @(current_state, timer) begin
        case (current_state)
            S_HIGHWAY_GREEN: begin
                highway_green = 1;
                highway_yellow = 0;
                highway_red = 0;
                farm_red = 1;
                farm_yellow = 0;
                farm_green = 0;
                if (timer >= HIGHWAY_GREEN_TIME) begin
                    next_state = S_HIGHWAY_YELLOW;
                    timer = 0;
                end else
                    next_state = S_HIGHWAY_GREEN;
            end

            S_HIGHWAY_YELLOW: begin
                highway_green = 0;
                highway_yellow = 1;
                highway_red = 0;
                farm_red = 1;
                farm_yellow = 0;
                farm_green = 0;
                if (timer >= HIGHWAY_YELLOW_TIME) begin
                    next_state = S_FARM_GREEN;
                    timer = 0;
                end else
                    next_state = S_HIGHWAY_YELLOW;
            end

            S_FARM_GREEN: begin
                highway_green = 0;
                highway_yellow = 0;
                highway_red = 1;
                farm_red = 0;
                farm_yellow = 0;
                farm_green = 1;
                if (timer >= FARM_GREEN_TIME) begin
                    next_state = S_FARM_YELLOW;
                    timer = 0;
                end else
                    next_state = S_FARM_GREEN;
            end

            S_FARM_YELLOW: begin
                highway_green = 0;
                highway_yellow = 0;
                highway_red = 1;
                farm_red = 0;
                farm_yellow = 1;
                farm_green = 0;
                if (timer >= FARM_YELLOW_TIME) begin
                    next_state = S_HIGHWAY_GREEN;
                    timer = 0;
                end else
                    next_state = S_FARM_YELLOW;
            end
        endcase
    end

endmodule
