/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     ALU - 64 BIT
*/

module ALU_N(
	output reg [63:0] result,
	output zero, overflow, carry_out,
	input [63:0] a, b,
	input carry_in, a_invert, b_invert,
    input [1:0] alu_control
);
	assign zero = (result == 0);
	always @(*) begin
		case (alu_control)
			0:  result <= a & b;
			1:  result <= a | b;
			2:  result <= a + b;
			6:  result <= a - b;
			7:  result <= a < b ? 1 : 0;
			12: result <= ~(a | b);
			13: result <= ~(a & b);
			default: result <= 0;
		endcase
	end
	assign overflow = ((a<0 && b<0 && result>0) || (a>0 && b>0 && result<0)) ? 1 : 0; 
endmodule