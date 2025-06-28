`timescale 1ns / 1ps

module Digital_Stopwatch_tb;

    reg CLK_1HZ;
    reg RESET;
    reg Enable;
    wire [3:0] sec0, sec1, min0, min1, hr0, hr1;

    // Instantiate your stopwatch module
    Digital_Stopwatch uut (
        .CLK_1HZ(CLK_1HZ),
        .RESET(RESET),
        .Enable(Enable),
        .sec0(sec0),
        .sec1(sec1),
        .min0(min0),
        .min1(min1),
        .hr0(hr0),
        .hr1(hr1)
    );

    // Clock generation: 1Hz simulated (toggle every 5 time units => 10ns period)
    initial CLK_1HZ = 0;
    always #5 CLK_1HZ = ~CLK_1HZ;

    // Test sequence
    initial begin
        // Monitor values
        $monitor("T=%0t | Enable=%b | Time = %d%d:%d%d:%d%d", $time, Enable, hr1, hr0, min1, min0, sec1, sec0);

        // Initialize
        RESET = 1;
        Enable = 0;
        #15 RESET = 0;    // Release reset

        // Start stopwatch
        Enable = 1;
        #400;             // Let it run for 12 clock ticks (12 seconds)

        // Pause stopwatch
        Enable = 0;
        #100;              // Wait while paused

        // Resume stopwatch
        Enable = 1;
        #400;              // Let it run again

        // Reset again
        RESET = 1;
        #10 RESET = 0;

        // Final few seconds
        Enable = 1;
        #300;

        $finish;
    end

endmodule
