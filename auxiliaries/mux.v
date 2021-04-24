/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Multiplexer
*/

module MUX (D,C,B,ALU_Src );

    //I-O port
    output reg [63:0] D;
    input [63:0] C,B;
    input ALU_Src;

    // mux
    always @(C,B,ALU_Src) begin
       if(ALU_Src == 1'b1)
            begin
                D = C;
            end
       else
            D = B;
    end
    //  D = (ALU_Src)? C : B;

endmodule