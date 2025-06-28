`timescale 1ns / 1ps

module Mini_Calculator_tb;

    reg [7:0] A, B;
    reg [1:0] op;
    wire [15:0] result;
    wire [7:0] remainder;
    wire error;

    Mini_Calculator uut (
        .A(A), .B(B), .op(op), .result(result),.remainder(remainder), .error(error)
    );

    initial begin
        $monitor("A=%d B=%d op=%b => result=%d,remainder=%d, error=%b", A, B, op, result,remainder, error);

        // Test 1
        A = 8'd120; B = 8'd60; 
        op = 2'b00; #10;  // Addition
        op = 2'b01; #10;  // Subtraction
        op = 2'b10; #10;  // Multiplication
        op = 2'b11; #10;  // Division
              
        // Test 2
        A = 8'd45; B = 8'd18; 
        op = 2'b00; #10;  // Addition
        op = 2'b01; #10;  // Subtraction
        op = 2'b10; #10;  // Multiplication
        op = 2'b11; #10;  // Division
        
        // Test 3 division by zero error 
        A = 8'd80; B = 8'd0; 
        op = 2'b00; #10;  // Addition
        op = 2'b01; #10;  // Subtraction
        op = 2'b10; #10;  // Multiplication
        op = 2'b11; #10; // Division

        $finish;
    end
endmodule
