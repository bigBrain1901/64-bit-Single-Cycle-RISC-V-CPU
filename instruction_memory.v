/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Instruction Fetch Hardware
*/

module IF(pc_new, instruction, clk, reset, pc_current, Sum);

    //parameter
    parameter Ins_size = 32;
    //I-O port declaration
    input clk, reset, pc_current;
    input [63:0] Sum;
    output [Ins_size-1:0] instruction;
    output reg [63:0] pc_new;
    
    //local net
    reg [63:0] pc=0, four = 4;
    reg[63:0] pc_next;

    // Instruction Memory
    INSTRUCTION_MEMORY IM(instruction, pc);

    initial begin
        pc_next = 0;
    end

    // at positive edge of clock
    always @(posedge clk)
    begin
        if(reset) //reset pc
            begin
                pc = 0;
            end
        else
            begin
                if(pc_current) // MUX 
                pc = pc+Sum; // jump statement
                else
                pc = pc_next; // pc = pc+4
            end
        pc_next = pc+4;
        // $display("%0d", pc_next); 
        pc_new = pc;
    end

endmodule

/* Instruction memory */
module INSTRUCTION_MEMORY(instruction, pc);

    // I-O port declaration
    input [63:0] pc;
    output reg [31:0] instruction;

    //local net
    reg [7:0] Ins_mem [0:1023];

    //read data file
    initial begin
       $readmemb("test_data/instruction_memory.txt", Ins_mem);
    end
    
    // Instruction is 32 bit so instruction = mem[pc], mem[pc+1], mem[pc+2], mem[pc+3]
    always @(*) begin
        instruction <= {Ins_mem[pc],Ins_mem[pc+1],Ins_mem[pc+2],Ins_mem[pc+3]};
    end

    
endmodule