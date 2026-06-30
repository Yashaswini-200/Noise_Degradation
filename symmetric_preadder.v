`timescale 1ns / 1ps

module symmetric_preadder
#(
    parameter DATA_WIDTH = 16
)
(
    input  signed [DATA_WIDTH-1:0] x_left,
    input  signed [DATA_WIDTH-1:0] x_right,

    output signed [DATA_WIDTH:0] pair_sum
);

assign pair_sum = x_left + x_right;

endmodule