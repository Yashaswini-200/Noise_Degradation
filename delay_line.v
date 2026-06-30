`timescale 1ns / 1ps

module delay_line #
(
    parameter DATA_WIDTH = 16
)
(
    input clk,
    input rst,
    input clk_en,
    input signed [DATA_WIDTH-1:0] x_in,

    output reg signed [DATA_WIDTH-1:0] d0,
    output reg signed [DATA_WIDTH-1:0] d1,
    output reg signed [DATA_WIDTH-1:0] d2,
    output reg signed [DATA_WIDTH-1:0] d3,
    output reg signed [DATA_WIDTH-1:0] d4,
    output reg signed [DATA_WIDTH-1:0] d5,
    output reg signed [DATA_WIDTH-1:0] d6,
    output reg signed [DATA_WIDTH-1:0] d7,
    output reg signed [DATA_WIDTH-1:0] d8,
    output reg signed [DATA_WIDTH-1:0] d9,
    output reg signed [DATA_WIDTH-1:0] d10,
    output reg signed [DATA_WIDTH-1:0] d11,
    output reg signed [DATA_WIDTH-1:0] d12,
    output reg signed [DATA_WIDTH-1:0] d13,
    output reg signed [DATA_WIDTH-1:0] d14,
    output reg signed [DATA_WIDTH-1:0] d15,
    output reg signed [DATA_WIDTH-1:0] d16,
    output reg signed [DATA_WIDTH-1:0] d17,
    output reg signed [DATA_WIDTH-1:0] d18,
    output reg signed [DATA_WIDTH-1:0] d19,
    output reg signed [DATA_WIDTH-1:0] d20,
    output reg signed [DATA_WIDTH-1:0] d21,
    output reg signed [DATA_WIDTH-1:0] d22,
    output reg signed [DATA_WIDTH-1:0] d23,
    output reg signed [DATA_WIDTH-1:0] d24,
    output reg signed [DATA_WIDTH-1:0] d25,
    output reg signed [DATA_WIDTH-1:0] d26,
    output reg signed [DATA_WIDTH-1:0] d27,
    output reg signed [DATA_WIDTH-1:0] d28,
    output reg signed [DATA_WIDTH-1:0] d29,
    output reg signed [DATA_WIDTH-1:0] d30,
    output reg signed [DATA_WIDTH-1:0] d31,
    output reg signed [DATA_WIDTH-1:0] d32,
    output reg signed [DATA_WIDTH-1:0] d33,
    output reg signed [DATA_WIDTH-1:0] d34,
    output reg signed [DATA_WIDTH-1:0] d35,
    output reg signed [DATA_WIDTH-1:0] d36,
    output reg signed [DATA_WIDTH-1:0] d37,
    output reg signed [DATA_WIDTH-1:0] d38,
    output reg signed [DATA_WIDTH-1:0] d39,
    output reg signed [DATA_WIDTH-1:0] d40,
    output reg signed [DATA_WIDTH-1:0] d41,
    output reg signed [DATA_WIDTH-1:0] d42
);

always @(posedge clk)
begin

    if(rst)
    begin

        d0  <= 0;
        d1  <= 0;
        d2  <= 0;
        d3  <= 0;
        d4  <= 0;
        d5  <= 0;
        d6  <= 0;
        d7  <= 0;
        d8  <= 0;
        d9  <= 0;
        d10 <= 0;
        d11 <= 0;
        d12 <= 0;
        d13 <= 0;
        d14 <= 0;
        d15 <= 0;
        d16 <= 0;
        d17 <= 0;
        d18 <= 0;
        d19 <= 0;
        d20 <= 0;
        d21 <= 0;
        d22 <= 0;
        d23 <= 0;
        d24 <= 0;
        d25 <= 0;
        d26 <= 0;
        d27 <= 0;
        d28 <= 0;
        d29 <= 0;
        d30 <= 0;
        d31 <= 0;
        d32 <= 0;
        d33 <= 0;
        d34 <= 0;
        d35 <= 0;
        d36 <= 0;
        d37 <= 0;
        d38 <= 0;
        d39 <= 0;
        d40 <= 0;
        d41 <= 0;
        d42 <= 0;

    end

    else if(clk_en)
    begin

        d42 <= d41;
        d41 <= d40;
        d40 <= d39;
        d39 <= d38;
        d38 <= d37;
        d37 <= d36;
        d36 <= d35;
        d35 <= d34;
        d34 <= d33;
        d33 <= d32;
        d32 <= d31;
        d31 <= d30;
        d30 <= d29;
        d29 <= d28;
        d28 <= d27;
        d27 <= d26;
        d26 <= d25;
        d25 <= d24;
        d24 <= d23;
        d23 <= d22;
        d22 <= d21;
        d21 <= d20;
        d20 <= d19;
        d19 <= d18;
        d18 <= d17;
        d17 <= d16;
        d16 <= d15;
        d15 <= d14;
        d14 <= d13;
        d13 <= d12;
        d12 <= d11;
        d11 <= d10;
        d10 <= d9;
        d9  <= d8;
        d8  <= d7;
        d7  <= d6;
        d6  <= d5;
        d5  <= d4;
        d4  <= d3;
        d3  <= d2;
        d2  <= d1;
        d1  <= d0;
        d0  <= x_in;

    end

end

endmodule