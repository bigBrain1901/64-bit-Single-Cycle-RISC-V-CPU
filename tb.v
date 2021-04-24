/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Testbench for the Datapath
*/

`include "datapath.v"

module DATA_PATH_TB();

    //Local Net
    wire [63:0] output_reg , pv;
    reg clk , reset  ;
    reg [3:0] Operation ;

    //module initialisation
    DATA_PATH D_P(pv,output_reg ,clk ,reset);

    //simulate clock
    initial begin
        #5 clk = 0;
        #5 clk = 1;
        forever begin
            #5 clk = ~clk;
        end
    end 

    // Instruction memory is such that first 5 instructions are ADD , next 5 instructs are ADDI , Ld , Sw , Beq
    initial begin

        $dumpfile("data_path.VCD");
        $dumpvars(0,DATA_PATH_TB);

        //Control inputs for ADD
        $display("\n------------\n   Add\n------------");

        //Control inputs for ADDI
        #55 $display("\n------------\n   ADDI\n------------");

        //Control inputs for load
        #50 $display("\n------------\n   Load\n------------");

        //Control inputs for store
        #50 $display("\n------------\n   Store\n------------");

        //Control inputs for Beq
        #50 $display("\n------------\n   BEQ\n------------");

        #55 $finish;
    end

endmodule