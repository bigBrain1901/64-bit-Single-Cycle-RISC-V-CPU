/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Register File
*/

module REG_FILE(clk, read_data_1, read_data_2, reg_source_1, reg_source_2, reg_destination, Write_data, reg_write_en);

    //I-O port Declaration
    input [4:0] reg_source_1, reg_source_2, reg_destination;
    input [63:0] Write_data;
    input reg_write_en , clk;
    output reg [63:0] read_data_1,read_data_2;

    //Local Net
    reg [63:0] reg_file[0:31];

    //Read Data for register file
    initial begin
        $readmemb("test_data/register_file.txt", reg_file);
        
    end 

    //write
    always @(reg_destination,Write_data,posedge clk) begin
        if(reg_write_en)
        begin
            reg_file[reg_destination] <= Write_data;
        end
    end   

    //read
    always @(reg_source_1,reg_source_2,reg_destination,posedge clk) begin

            read_data_1 = reg_file[reg_source_1];
            read_data_2 = reg_file[reg_source_2];
            
    end

endmodule