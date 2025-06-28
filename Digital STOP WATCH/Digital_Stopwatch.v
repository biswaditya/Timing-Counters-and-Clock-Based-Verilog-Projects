`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 21:13:19
// Design Name: 
// Module Name: Digital_Stopwatch
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


module Digital_Stopwatch(
    input wire CLK_1HZ,// 1Hz Clock input
    input wire RESET,//  Reset
    input wire Enable,// Start/Stop signal (Enable=1 Start,Enable=0 Stop(pause))
       output reg [3:0] sec0,   // Seconds (0-9)
       output reg [3:0] sec1,   // Seconds (10s digit, 0-5)
       output reg [3:0] min0,   // Minutes (0-9)
       output reg [3:0] min1,   // Minutes (10s digit, 0-5)
       output reg [3:0] hr0,    // Hours (0-9)
       output reg [3:0] hr1     // Hours (10s digit, 0-9)
    );
    always@(posedge CLK_1HZ or posedge RESET)
    begin
        if (RESET) begin {sec0, sec1, min0, min1, hr0, hr1} <= 0;end
        else if(Enable)
        begin 
             // Increment seconds
             if(sec0<9) sec0 <= sec0+1;
             else begin sec0 <= 0;
             if(sec1<5) sec1 <= sec1+1;
             else begin sec1 <= 0;
             // Increment seconds
             if(min0<9) min0 <= min0+1;  
             else begin min0 <= 0;
             if(min1<5) min1 <= min1+1;
             else begin min1 <= 0;
                        // Increment hours
                        if(hr0<9) hr0 <= hr0+1;
                        else begin hr0 <= 0;
                              if (hr1<9) hr1 <= hr1+1;
                               else  hr1 <= 0;  // Rolls over at 99:59:59 // STOP Watch LIMIT REACHED
                        end 
             end
             end 
             end   
             end     
        end
    end
endmodule
