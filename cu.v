/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Control Unit - Processor
*/

module CONTROL_UNIT(Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Opcode);

    input [6:0] Opcode;
    output Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output [1:0] ALUOp;

    assign ALUOp[1]  =  (~Opcode[6]) & (Opcode[5])  & (Opcode[4]);
    assign Branch    =  (Opcode[6])  & (Opcode[5])  & (~Opcode[4]);
    assign MemWrite  =  (~Opcode[6]) & (Opcode[5])  & (~Opcode[4]);
    assign ALUOp[0]  =  (Opcode[6])  & (Opcode[5])  & (~Opcode[4]);
    assign MemRead   =  (~Opcode[6]) & (~Opcode[5]) & (~Opcode[4]);
    assign MemtoReg  =  (~Opcode[6]) & (~Opcode[5]) & (~Opcode[4]);
    assign ALUSrc    =  (~Opcode[6]) & (~Opcode[4]) | (~Opcode[6] & ~Opcode[5] & Opcode[4]);
    assign RegWrite  =  (~Opcode[6]) & ( (Opcode[5] & Opcode[4]) | (~Opcode[5] & ~Opcode[4]));

endmodule