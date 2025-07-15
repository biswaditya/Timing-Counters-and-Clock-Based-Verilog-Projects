`timescale 1ns / 1ps

// 4-bit Clock_Frequency_Divider
module Clock_Frequency_Divider(
    input CLK,
    input RESET,
    output reg [3:0]div_f,
    output [3:0] DIV
    );
    
    always@(negedge CLK or posedge RESET)
    begin 
          if(RESET) div_f = 4'b000 ;
          else     div_f = div_f + 1;
    end
    
    assign DIV[3]=div_f[0];
    assign DIV[2]=div_f[1];
    assign DIV[1]=div_f[2];
    assign DIV[0]=div_f[3];
// DIV[0]: CLK ÷ 2
// DIV[1]: CLK ÷ 4
// DIV[2]: CLK ÷ 8
// DIV[3]: CLK ÷ 16
endmodule
