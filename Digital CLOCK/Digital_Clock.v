`timescale 1ns / 1ps

module Digital_Clock (
    input CLK_1Hz,         // 1Hz clock input
    input RESET,           // Active-high reset
    output reg [3:0] sec0, sec1,   // Seconds (00-59)
    output reg [3:0] min0, min1,   // Minutes (00-59)
    output reg [3:0] hour0, hour1  // Hours (00-23)
);

always @(posedge CLK_1Hz or posedge RESET)
    begin
    if (RESET)
        begin
        sec0  <= 0; sec1  <= 0;
        min0  <= 0; min1  <= 0;
        hour0 <= 0; hour1 <= 0;
        end 
    
    else begin
        // Increment seconds
        if (sec0 < 9) begin sec0 <= sec0 + 1; end 
        else begin
        sec0 <= 0;
        if (sec1 < 5) begin sec1 <= sec1 + 1;  end 
        else begin
        sec1 <= 0;
                // Increment minutes
                if (min0 < 9) begin min0 <= min0 + 1; end 
                else begin
                min0 <= 0;
                if (min1 < 5) begin min1 <= min1 + 1; end
                else begin
                min1 <= 0;
                          // Increment hours
                       if (hour1 == 2 && hour0 == 3) begin hour0 <= 0; hour1 <= 0;end 
                       else if (hour0 < 9) begin hour0 <= hour0 + 1; end 
                       else begin
                              hour0 <= 0;
                              hour1 <= hour1 + 1;
                            end
                end
                end
           end
           end
        end
     end

endmodule
