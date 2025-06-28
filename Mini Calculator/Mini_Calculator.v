`timescale 1ns / 1ps

module Mini_Calculator (
    input [7:0] A,       // 8-bit input A
    input [7:0] B,       // 8-bit input B
    input [1:0] op,      // Operation selector: 00=Add, 01=Sub, 10=Mul, 11=Div
    output reg [15:0] result, // Output result (16-bit to handle multiplication)
    output reg [7:0] remainder,  // Only valid for division
    output reg error           // Division by zero flag
);

// Combinational logic
always @(*) begin
    error = 0;
    case(op)
        2'b00: begin result = A + B;  remainder =0;    end     // Addition
        2'b01: begin result = A - B;  remainder =0;    end     // Subtraction
        2'b10: begin result = A * B;  remainder =0;    end        // Multiplication
        2'b11:  begin                      // Division
            if (B != 0) begin
                result = A / B;      // Quotient
                remainder = A % B;   // Remainder
                end
            else begin
                result = 16'hXXXX;        // Undefined result
                error = 1;                // Division by zero
            end
        end
        default: result = 16'h0000;
    endcase
end

endmodule
