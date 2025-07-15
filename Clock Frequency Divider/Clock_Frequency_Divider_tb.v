`timescale 1ns / 1ps


module Clock_Frequency_Divider_tb;
reg CLK;
reg RESET;
wire [3:0]div_f;
wire [3:0] DIV;

Clock_Frequency_Divider uut(CLK,RESET,div_f,DIV);

always #5 CLK=~CLK;
initial
begin
CLK=0;
RESET=1;
#10 RESET=0;
#150
$finish;
end
endmodule
