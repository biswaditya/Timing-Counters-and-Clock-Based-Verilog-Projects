`timescale 1ns / 1ps

module Digital_Clock_tb;

    // Inputs
    reg CLK_1Hz;
    reg RESET;

    // Outputs
    wire [3:0] sec0, sec1;
    wire [3:0] min0, min1;
    wire [3:0] hour0, hour1;

  
    Digital_Clock uut (
        CLK_1Hz,
        RESET,
        sec0,sec1,
        min0,min1,
        hour0,hour1
    );
    // Clock generation (1Hz simulated as a 10ns period for faster simulation)
   always #5 CLK_1Hz =~CLK_1Hz; // Toggle every 5ns ? 10ns period = 1Hz simulated

    // Test sequence
    initial begin
        CLK_1Hz = 0;
        RESET = 1;
        #10 RESET = 0; 

        // Run simulation for 100,000 ns (simulate about 10,000 seconds)
        // That's enough to watch seconds, minutes, and  hour 
        #100000;

        $finish;
    end

    // Monitor output on each clock tick
    always @(posedge CLK_1Hz) begin
        $display("Time = %0t | %0d %0d:%0d%0d:%0d%0d", $time,
            hour1, hour0, min1, min0, sec1, sec0);
    end

endmodule
