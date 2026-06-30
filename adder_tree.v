`timescale 1ns / 1ps

module adder_tree
#(
    parameter PROD_WIDTH = 33,
    parameter ACC_WIDTH  = 40
)
(
    input clk,
    input rst,
    input clk_en,

    input signed [PROD_WIDTH-1:0] prod0,
    input signed [PROD_WIDTH-1:0] prod1,
    input signed [PROD_WIDTH-1:0] prod2,
    input signed [PROD_WIDTH-1:0] prod3,
    input signed [PROD_WIDTH-1:0] prod4,
    input signed [PROD_WIDTH-1:0] prod5,
    input signed [PROD_WIDTH-1:0] prod6,
    input signed [PROD_WIDTH-1:0] prod7,
    input signed [PROD_WIDTH-1:0] prod8,
    input signed [PROD_WIDTH-1:0] prod9,
    input signed [PROD_WIDTH-1:0] prod10,
    input signed [PROD_WIDTH-1:0] prod11,
    input signed [PROD_WIDTH-1:0] prod12,
    input signed [PROD_WIDTH-1:0] prod13,
    input signed [PROD_WIDTH-1:0] prod14,
    input signed [PROD_WIDTH-1:0] prod15,
    input signed [PROD_WIDTH-1:0] prod16,
    input signed [PROD_WIDTH-1:0] prod17,
    input signed [PROD_WIDTH-1:0] prod18,
    input signed [PROD_WIDTH-1:0] prod19,
    input signed [PROD_WIDTH-1:0] prod20,
    input signed [PROD_WIDTH-1:0] prod21,

    output reg signed [ACC_WIDTH-1:0] sum_out
);

//
//---------------------------
// LEVEL 1 : 22 -> 11
//---------------------------
//

reg signed [ACC_WIDTH-1:0] L1_0;
reg signed [ACC_WIDTH-1:0] L1_1;
reg signed [ACC_WIDTH-1:0] L1_2;
reg signed [ACC_WIDTH-1:0] L1_3;
reg signed [ACC_WIDTH-1:0] L1_4;
reg signed [ACC_WIDTH-1:0] L1_5;
reg signed [ACC_WIDTH-1:0] L1_6;
reg signed [ACC_WIDTH-1:0] L1_7;
reg signed [ACC_WIDTH-1:0] L1_8;
reg signed [ACC_WIDTH-1:0] L1_9;
reg signed [ACC_WIDTH-1:0] L1_10;

always @(posedge clk)
begin

    if(rst)
    begin

        L1_0  <= 0;
        L1_1  <= 0;
        L1_2  <= 0;
        L1_3  <= 0;
        L1_4  <= 0;
        L1_5  <= 0;
        L1_6  <= 0;
        L1_7  <= 0;
        L1_8  <= 0;
        L1_9  <= 0;
        L1_10 <= 0;

    end

    else if(clk_en)
    begin

        L1_0  <= prod0  + prod1;
        L1_1  <= prod2  + prod3;
        L1_2  <= prod4  + prod5;
        L1_3  <= prod6  + prod7;
        L1_4  <= prod8  + prod9;
        L1_5  <= prod10 + prod11;
        L1_6  <= prod12 + prod13;
        L1_7  <= prod14 + prod15;
        L1_8  <= prod16 + prod17;
        L1_9  <= prod18 + prod19;
        L1_10 <= prod20 + prod21;

    end

end

//
//---------------------------
// LEVEL 2 : 11 -> 6
//---------------------------
//

reg signed [ACC_WIDTH-1:0] L2_0;
reg signed [ACC_WIDTH-1:0] L2_1;
reg signed [ACC_WIDTH-1:0] L2_2;
reg signed [ACC_WIDTH-1:0] L2_3;
reg signed [ACC_WIDTH-1:0] L2_4;
reg signed [ACC_WIDTH-1:0] L2_5;

always @(posedge clk)
begin

    if(rst)
    begin

        L2_0 <= 0;
        L2_1 <= 0;
        L2_2 <= 0;
        L2_3 <= 0;
        L2_4 <= 0;
        L2_5 <= 0;

    end

    else if(clk_en)
    begin

        L2_0 <= L1_0 + L1_1;
        L2_1 <= L1_2 + L1_3;
        L2_2 <= L1_4 + L1_5;
        L2_3 <= L1_6 + L1_7;
        L2_4 <= L1_8 + L1_9;

        // Pass-through (odd element)
        L2_5 <= L1_10;

    end

end
//
//---------------------------
// LEVEL 3 : 6 -> 3
//---------------------------
//

reg signed [ACC_WIDTH-1:0] L3_0;
reg signed [ACC_WIDTH-1:0] L3_1;
reg signed [ACC_WIDTH-1:0] L3_2;

always @(posedge clk)
begin

    if(rst)
    begin

        L3_0 <= 0;
        L3_1 <= 0;
        L3_2 <= 0;

    end

    else if(clk_en)
    begin

        L3_0 <= L2_0 + L2_1;
        L3_1 <= L2_2 + L2_3;
        L3_2 <= L2_4 + L2_5;

    end

end

//
//---------------------------
// LEVEL 4 : 3 -> 2
//---------------------------
//

reg signed [ACC_WIDTH-1:0] L4_0;
reg signed [ACC_WIDTH-1:0] L4_1;

always @(posedge clk)
begin

    if(rst)
    begin

        L4_0 <= 0;
        L4_1 <= 0;

    end

    else if(clk_en)
    begin

        L4_0 <= L3_0 + L3_1;

        // Pass-through (odd element)
        L4_1 <= L3_2;

    end

end

//
//---------------------------
// LEVEL 5 : 2 -> 1
//---------------------------
//

reg signed [ACC_WIDTH-1:0] L5_0;

always @(posedge clk)
begin

    if(rst)
    begin

        L5_0 <= 0;
    end

    else if(clk_en)
    begin

        L5_0 <= L4_0 + L4_1;
    end

end

//
//---------------------------
// OUTPUT REGISTER
//---------------------------
//

always @(posedge clk)
begin

    if(rst)
    begin
        sum_out <= 0;
    end

    else if(clk_en)
    begin
        sum_out <= L5_0;
    end

end

endmodule