/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Memory File
*/

module MEMORY(ReadData , Address , Write_data , MemRead , MemWrite );

    // I-O port
    input  MemRead , MemWrite ;
    input [63:0] Write_data ,Address ;
    output reg [63:0] ReadData;

    //memory
    reg[63:0] mem[0:1023];

    //read data
    initial begin
        $readmemb("data_memory.txt", mem);
    end

    //write
    always @( Write_data , MemWrite) begin
        if(MemWrite==1'b1)
        begin
            mem[Address]<=Write_data;
        end
    end

    //read
    always @(MemRead,Address) begin
        if(MemRead==1'b1)
        begin
            ReadData = mem[Address];
        end
    end

endmodule