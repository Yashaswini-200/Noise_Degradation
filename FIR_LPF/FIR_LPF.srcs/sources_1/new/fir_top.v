`timescale 1ns / 1ps

module fir_top
#(
    parameter DATA_WIDTH = 16
)
(
    input clk,
    input rst,
    input clk_en,

    input signed [DATA_WIDTH-1:0] x_in,

    output signed [DATA_WIDTH-1:0] y_out
);

/////////////////////////////////////////////////////////////
// Delay Line Outputs
/////////////////////////////////////////////////////////////

wire signed [15:0] d0;
wire signed [15:0] d1;
wire signed [15:0] d2;
wire signed [15:0] d3;
wire signed [15:0] d4;
wire signed [15:0] d5;
wire signed [15:0] d6;
wire signed [15:0] d7;
wire signed [15:0] d8;
wire signed [15:0] d9;
wire signed [15:0] d10;
wire signed [15:0] d11;
wire signed [15:0] d12;
wire signed [15:0] d13;
wire signed [15:0] d14;
wire signed [15:0] d15;
wire signed [15:0] d16;
wire signed [15:0] d17;
wire signed [15:0] d18;
wire signed [15:0] d19;
wire signed [15:0] d20;
wire signed [15:0] d21;
wire signed [15:0] d22;
wire signed [15:0] d23;
wire signed [15:0] d24;
wire signed [15:0] d25;
wire signed [15:0] d26;
wire signed [15:0] d27;
wire signed [15:0] d28;
wire signed [15:0] d29;
wire signed [15:0] d30;
wire signed [15:0] d31;
wire signed [15:0] d32;
wire signed [15:0] d33;
wire signed [15:0] d34;
wire signed [15:0] d35;
wire signed [15:0] d36;
wire signed [15:0] d37;
wire signed [15:0] d38;
wire signed [15:0] d39;
wire signed [15:0] d40;
wire signed [15:0] d41;
wire signed [15:0] d42;

/////////////////////////////////////////////////////////////
// Pair Sums
/////////////////////////////////////////////////////////////

wire signed [16:0] pair0;
wire signed [16:0] pair1;
wire signed [16:0] pair2;
wire signed [16:0] pair3;
wire signed [16:0] pair4;
wire signed [16:0] pair5;
wire signed [16:0] pair6;
wire signed [16:0] pair7;
wire signed [16:0] pair8;
wire signed [16:0] pair9;
wire signed [16:0] pair10;
wire signed [16:0] pair11;
wire signed [16:0] pair12;
wire signed [16:0] pair13;
wire signed [16:0] pair14;
wire signed [16:0] pair15;
wire signed [16:0] pair16;
wire signed [16:0] pair17;
wire signed [16:0] pair18;
wire signed [16:0] pair19;
wire signed [16:0] pair20;
wire signed [16:0] pair21;

/////////////////////////////////////////////////////////////
// Multiplier Outputs
/////////////////////////////////////////////////////////////

wire signed [32:0] prod0;
wire signed [32:0] prod1;
wire signed [32:0] prod2;
wire signed [32:0] prod3;
wire signed [32:0] prod4;
wire signed [32:0] prod5;
wire signed [32:0] prod6;
wire signed [32:0] prod7;
wire signed [32:0] prod8;
wire signed [32:0] prod9;
wire signed [32:0] prod10;
wire signed [32:0] prod11;
wire signed [32:0] prod12;
wire signed [32:0] prod13;
wire signed [32:0] prod14;
wire signed [32:0] prod15;
wire signed [32:0] prod16;
wire signed [32:0] prod17;
wire signed [32:0] prod18;
wire signed [32:0] prod19;
wire signed [32:0] prod20;
wire signed [32:0] prod21;

wire signed [39:0] acc_sum;

delay_line DL
(
    .clk(clk),
    .rst(rst),
    .clk_en(clk_en),

    .x_in(x_in),

    .d0(d0), .d1(d1), .d2(d2), .d3(d3),
    .d4(d4), .d5(d5), .d6(d6), .d7(d7),
    .d8(d8), .d9(d9), .d10(d10), .d11(d11),
    .d12(d12), .d13(d13), .d14(d14), .d15(d15),
    .d16(d16), .d17(d17), .d18(d18), .d19(d19),
    .d20(d20), .d21(d21), .d22(d22), .d23(d23),
    .d24(d24), .d25(d25), .d26(d26), .d27(d27),
    .d28(d28), .d29(d29), .d30(d30), .d31(d31),
    .d32(d32), .d33(d33), .d34(d34), .d35(d35),
    .d36(d36), .d37(d37), .d38(d38), .d39(d39),
    .d40(d40), .d41(d41), .d42(d42)
);
/////////////////////////////////////////////////////////////
// Symmetric Pre-Adders
/////////////////////////////////////////////////////////////

symmetric_preadder P0  (.x_left(d0),  .x_right(d42), .pair_sum(pair0));
symmetric_preadder P1  (.x_left(d1),  .x_right(d41), .pair_sum(pair1));
symmetric_preadder P2  (.x_left(d2),  .x_right(d40), .pair_sum(pair2));
symmetric_preadder P3  (.x_left(d3),  .x_right(d39), .pair_sum(pair3));
symmetric_preadder P4  (.x_left(d4),  .x_right(d38), .pair_sum(pair4));
symmetric_preadder P5  (.x_left(d5),  .x_right(d37), .pair_sum(pair5));
symmetric_preadder P6  (.x_left(d6),  .x_right(d36), .pair_sum(pair6));
symmetric_preadder P7  (.x_left(d7),  .x_right(d35), .pair_sum(pair7));
symmetric_preadder P8  (.x_left(d8),  .x_right(d34), .pair_sum(pair8));
symmetric_preadder P9  (.x_left(d9),  .x_right(d33), .pair_sum(pair9));
symmetric_preadder P10 (.x_left(d10), .x_right(d32), .pair_sum(pair10));
symmetric_preadder P11 (.x_left(d11), .x_right(d31), .pair_sum(pair11));
symmetric_preadder P12 (.x_left(d12), .x_right(d30), .pair_sum(pair12));
symmetric_preadder P13 (.x_left(d13), .x_right(d29), .pair_sum(pair13));
symmetric_preadder P14 (.x_left(d14), .x_right(d28), .pair_sum(pair14));
symmetric_preadder P15 (.x_left(d15), .x_right(d27), .pair_sum(pair15));
symmetric_preadder P16 (.x_left(d16), .x_right(d26), .pair_sum(pair16));
symmetric_preadder P17 (.x_left(d17), .x_right(d25), .pair_sum(pair17));
symmetric_preadder P18 (.x_left(d18), .x_right(d24), .pair_sum(pair18));
symmetric_preadder P19 (.x_left(d19), .x_right(d23), .pair_sum(pair19));
symmetric_preadder P20 (.x_left(d20), .x_right(d22), .pair_sum(pair20));

//
// Center Tap
//

assign pair21 = {d21[15], d21};
/////////////////////////////////////////////////////////////
// Multiplier Array
/////////////////////////////////////////////////////////////

multiplier_array MULT
(
    .pair0(pair0),
    .pair1(pair1),
    .pair2(pair2),
    .pair3(pair3),
    .pair4(pair4),
    .pair5(pair5),
    .pair6(pair6),
    .pair7(pair7),
    .pair8(pair8),
    .pair9(pair9),
    .pair10(pair10),
    .pair11(pair11),
    .pair12(pair12),
    .pair13(pair13),
    .pair14(pair14),
    .pair15(pair15),
    .pair16(pair16),
    .pair17(pair17),
    .pair18(pair18),
    .pair19(pair19),
    .pair20(pair20),
    .pair21(pair21),

    .prod0(prod0),
    .prod1(prod1),
    .prod2(prod2),
    .prod3(prod3),
    .prod4(prod4),
    .prod5(prod5),
    .prod6(prod6),
    .prod7(prod7),
    .prod8(prod8),
    .prod9(prod9),
    .prod10(prod10),
    .prod11(prod11),
    .prod12(prod12),
    .prod13(prod13),
    .prod14(prod14),
    .prod15(prod15),
    .prod16(prod16),
    .prod17(prod17),
    .prod18(prod18),
    .prod19(prod19),
    .prod20(prod20),
    .prod21(prod21)
);
/////////////////////////////////////////////////////////////
// Adder Tree
/////////////////////////////////////////////////////////////

assign acc_sum =
      prod0  + prod1  + prod2  + prod3
    + prod4  + prod5  + prod6  + prod7
    + prod8  + prod9  + prod10 + prod11
    + prod12 + prod13 + prod14 + prod15
    + prod16 + prod17 + prod18 + prod19
    + prod20 + prod21;

/////////////////////////////////////////////////////////////
// Output Scaler
/////////////////////////////////////////////////////////////

output_scaler SCALE
(
    .acc(acc_sum),
    .y(y_out)
);

endmodule