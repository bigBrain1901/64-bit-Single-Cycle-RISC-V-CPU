/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     ALU Control
*/

module ALU_CONTROL (alu_control, funct, alu_op);

   // I/O port declaration
   input [5:0] funct;
   input [1:0] alu_op;
   output reg [3:0] alu_control;

   // LOCAL NET
   wire [7:0] ConcatInput;
   assign ConcatInput = {alu_op, funct}; 

   // mapping input to output
   always @(ConcatInput) 
      casex (ConcatInput)
         8'b01xxxxxx: alu_control=4'b0110;  
         8'b00xxxxxx: alu_control=4'b0010;  
         8'b10xx0000: alu_control=4'b0010; //add 
         8'b10xx1000: alu_control=4'b0110; //sub 
         8'b10xx0111: alu_control=4'b0000; //and 
         8'b10xx0110: alu_control=4'b0001; //or 
         8'b10xx0010: alu_control=4'b0111; //slt
	      
         default: alu_control = 4'b0000;
      endcase

endmodule