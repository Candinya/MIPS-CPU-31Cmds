`timescale 1ns / 1ps

module instr_decode(
    input [31:0] instr_raw,
    output reg [31:0] instr_code
);
    always @ (*) begin
        casex ({instr_raw[31:26], instr_raw[5:0]})
            12'b000000_100000 : instr_code <= 32'b00000000000000000000000000000001; // add
            12'b000000_100001 : instr_code <= 32'b00000000000000000000000000000010; // addu
            12'b000000_100010 : instr_code <= 32'b00000000000000000000000000000100; // sub
            12'b000000_100011 : instr_code <= 32'b00000000000000000000000000001000; // subu
            12'b000000_100100 : instr_code <= 32'b00000000000000000000000000010000; // and
            12'b000000_100101 : instr_code <= 32'b00000000000000000000000000100000; // or
            12'b000000_100110 : instr_code <= 32'b00000000000000000000000001000000; // xor
            12'b000000_100111 : instr_code <= 32'b00000000000000000000000010000000; // nor
            12'b000000_101010 : instr_code <= 32'b00000000000000000000000100000000; // slt
            12'b000000_101011 : instr_code <= 32'b00000000000000000000001000000000; // sltu
            12'b000000_000000 : instr_code <= 32'b00000000000000000000010000000000; // sll
            12'b000000_000010 : instr_code <= 32'b00000000000000000000100000000000; // srl
            12'b000000_000011 : instr_code <= 32'b00000000000000000001000000000000; // sra
            12'b000000_000100 : instr_code <= 32'b00000000000000000010000000000000; // sllv
            12'b000000_000110 : instr_code <= 32'b00000000000000000100000000000000; // srlv
            12'b000000_000111 : instr_code <= 32'b00000000000000001000000000000000; // srav
            12'b000000_001000 : instr_code <= 32'b00000000000000010000000000000000; // jr
            12'b001000_?????? : instr_code <= 32'b00000000000000100000000000000000; // addi
            12'b001001_?????? : instr_code <= 32'b00000000000001000000000000000000; // addiu
            12'b001100_?????? : instr_code <= 32'b00000000000010000000000000000000; // andi
            12'b001101_?????? : instr_code <= 32'b00000000000100000000000000000000; // ori
            12'b001110_?????? : instr_code <= 32'b00000000001000000000000000000000; // xori
            12'b100011_?????? : instr_code <= 32'b00000000010000000000000000000000; // lw
            12'b101011_?????? : instr_code <= 32'b00000000100000000000000000000000; // sw
            12'b000100_?????? : instr_code <= 32'b00000001000000000000000000000000; // beq
            12'b000101_?????? : instr_code <= 32'b00000010000000000000000000000000; // bne
            12'b001010_?????? : instr_code <= 32'b00000100000000000000000000000000; // slti
            12'b001011_?????? : instr_code <= 32'b00001000000000000000000000000000; // sltiu
            12'b001111_?????? : instr_code <= 32'b00010000000000000000000000000000; // lui
            12'b000010_?????? : instr_code <= 32'b00100000000000000000000000000000; // j
            12'b000011_?????? : instr_code <= 32'b01000000000000000000000000000000; // jal
            default:            instr_code <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz; // ERROR
        endcase
    end
endmodule
