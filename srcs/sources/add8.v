`timescale 1ns / 1ps

module add8(
    input [31:0] a,
    output [31:0] r
);

    assign r = a + 4;

endmodule