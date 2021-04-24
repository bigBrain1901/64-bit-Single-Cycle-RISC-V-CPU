/*
    Name 1:     Ishaan Singh            191CS124
    Name 2:     Ikjot Singh Dhody       191CS123
    Module:     Sign Extension
*/

module SIGN_EXT(C , Ins);

    //I-O port declaration
    input [31:0] Ins;
    output reg [63:0] C; // C represents immediate value

    //local net
    reg [6:0] opcode;

    always @(Ins) begin
        
        opcode = Ins[6:0];

        casex (opcode) 
            7'b00xxxxx: // I-type ins
                begin
                    C[63:0] = { {52{Ins[31]}}, Ins[31:20] };
                end
            7'b0100011: // S-Type
                begin
                    C = {{52{Ins[31]}}, Ins[31:25] , Ins[11:7]};
                end
            7'b1100011: // SB-Type
                begin
                    C={{52{Ins[31]}},Ins[7] , Ins[30:25] , Ins[11:8] , 1'b0};
                end
            7'b0110111: // U type
                begin
                    C={{44{Ins[31]}} , Ins[31:12]};
                end
        endcase
        
    end

endmodule