/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Datapath
*/

`include "cu.v"
`include "alu.v"
`include "alu_control.v"
`include "register_file.v"
`include "auxiliaries/mux.v"
`include "instruction_memory.v"
`include "auxiliaries/memory.v"
`include "auxiliaries/sign_extended.v"

module DATA_PATH(pc_new, output_reg, clk, reset);

    // I-O port declaration
    output [63:0] output_reg, pc_new;
    input clk ,reset; 

    //Local Net
    wire [31:0] Ins;
    wire [63:0] A, B, C, D  ,ReadData, alu_output,Write_data ;
    wire zero, C_out, overflow,  RegWrite, ALUSrc ,MemWrite,MemRead, MemtoReg, Branch ;
    wire [3:0] Operation ;                                                        
    wire [1:0] ALUOp;
    reg [5:0] F; 
    reg PCSrc;

    // Instruction fetch
    IF I_H(pc_new, Ins, clk, reset ,PCSrc, C);

    CONTROL_UNIT C_U(Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Ins[6:0]);

    // data from Register file
    REG_FILE Rg(clk, A, B, Ins[19:15], Ins[24:20] ,Ins[11:7], Write_data, RegWrite);
    
    ALU_CONTROL ALU_C_U(Operation, F, ALUOp);

    // sign extended value 
    SIGN_EXT S_E(C,Ins);
  
    // Mux for ALu input
    MUX M_X(D, C, B, ALUSrc );

    // ALU
    ALU_N Alu(alu_output ,zero,  overflow, C_out, A, D, Operation[2],  Operation[3], Operation[2] ,Operation[1:0] );

    // main memory
    MEMORY M_M(ReadData, alu_output, B, MemRead, MemWrite );
    
    // mux for write data
    MUX M_X2(Write_data , ReadData, alu_output, MemtoReg);

    always @(*) begin
        // F input for ALU_control
        F[5]=1'bx;
        F[4]=1'bx;
        F[3]=Ins[30];
        F[2:0] = Ins[14:12];
        $monitor("\ntime = %0d\nALUSrc = %0d, Opcode = %b, rs1 = %0d, rs2 = %0d, rd = %0d\npc = %0d, Read data 1 = %0d, Read Data 2 = %0d, Imm = %0d\nAlu result = %0d, write data = %0d", $time, ALUSrc, Ins[6:0], Ins[19:15], Ins[24:20], Ins[11:7], pc_new, A, B, C, alu_output, Write_data);
        PCSrc = Branch & zero ;

    end


endmodule