`timescale 1ns / 1ps

module multiplier_array
#(
    parameter DATA_WIDTH  = 16,
    parameter COEFF_WIDTH = 16
)
(
    input signed [DATA_WIDTH:0] pair0,
    input signed [DATA_WIDTH:0] pair1,
    input signed [DATA_WIDTH:0] pair2,
    input signed [DATA_WIDTH:0] pair3,
    input signed [DATA_WIDTH:0] pair4,
    input signed [DATA_WIDTH:0] pair5,
    input signed [DATA_WIDTH:0] pair6,
    input signed [DATA_WIDTH:0] pair7,
    input signed [DATA_WIDTH:0] pair8,
    input signed [DATA_WIDTH:0] pair9,
    input signed [DATA_WIDTH:0] pair10,
    input signed [DATA_WIDTH:0] pair11,
    input signed [DATA_WIDTH:0] pair12,
    input signed [DATA_WIDTH:0] pair13,
    input signed [DATA_WIDTH:0] pair14,
    input signed [DATA_WIDTH:0] pair15,
    input signed [DATA_WIDTH:0] pair16,
    input signed [DATA_WIDTH:0] pair17,
    input signed [DATA_WIDTH:0] pair18,
    input signed [DATA_WIDTH:0] pair19,
    input signed [DATA_WIDTH:0] pair20,
    input signed [DATA_WIDTH:0] pair21,

    output signed [32:0] prod0,
    output signed [32:0] prod1,
    output signed [32:0] prod2,
    output signed [32:0] prod3,
    output signed [32:0] prod4,
    output signed [32:0] prod5,
    output signed [32:0] prod6,
    output signed [32:0] prod7,
    output signed [32:0] prod8,
    output signed [32:0] prod9,
    output signed [32:0] prod10,
    output signed [32:0] prod11,
    output signed [32:0] prod12,
    output signed [32:0] prod13,
    output signed [32:0] prod14,
    output signed [32:0] prod15,
    output signed [32:0] prod16,
    output signed [32:0] prod17,
    output signed [32:0] prod18,
    output signed [32:0] prod19,
    output signed [32:0] prod20,
    output signed [32:0] prod21
);

wire signed [15:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
wire signed [15:0] c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21;

coeff_rom ROM0(
    .addr(6'd0),
    .coeff(c0)
);
coeff_rom ROM1  (6'd1 ,c1 );
coeff_rom ROM2  (6'd2 ,c2 );
coeff_rom ROM3  (6'd3 ,c3 );
coeff_rom ROM4  (6'd4 ,c4 );
coeff_rom ROM5  (6'd5 ,c5 );
coeff_rom ROM6  (6'd6 ,c6 );
coeff_rom ROM7  (6'd7 ,c7 );
coeff_rom ROM8  (6'd8 ,c8 );
coeff_rom ROM9  (6'd9 ,c9 );
coeff_rom ROM10 (6'd10,c10);
coeff_rom ROM11 (6'd11,c11);
coeff_rom ROM12 (6'd12,c12);
coeff_rom ROM13 (6'd13,c13);
coeff_rom ROM14 (6'd14,c14);
coeff_rom ROM15 (6'd15,c15);
coeff_rom ROM16 (6'd16,c16);
coeff_rom ROM17 (6'd17,c17);
coeff_rom ROM18 (6'd18,c18);
coeff_rom ROM19 (6'd19,c19);
coeff_rom ROM20 (6'd20,c20);
coeff_rom ROM21 (6'd21,c21);

assign prod0  = pair0  * c0;
assign prod1  = pair1  * c1;
assign prod2  = pair2  * c2;
assign prod3  = pair3  * c3;
assign prod4  = pair4  * c4;
assign prod5  = pair5  * c5;
assign prod6  = pair6  * c6;
assign prod7  = pair7  * c7;
assign prod8  = pair8  * c8;
assign prod9  = pair9  * c9;
assign prod10 = pair10 * c10;
assign prod11 = pair11 * c11;
assign prod12 = pair12 * c12;
assign prod13 = pair13 * c13;
assign prod14 = pair14 * c14;
assign prod15 = pair15 * c15;
assign prod16 = pair16 * c16;
assign prod17 = pair17 * c17;
assign prod18 = pair18 * c18;
assign prod19 = pair19 * c19;
assign prod20 = pair20 * c20;
assign prod21 = pair21 * c21;

endmodule