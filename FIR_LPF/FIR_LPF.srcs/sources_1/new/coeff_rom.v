`timescale 1ns / 1ps

module coeff_rom(
    input  wire [5:0] addr,
    output reg signed [15:0] coeff
);

always @(*) begin
    case(addr)

        6'd0  : coeff = 16'sd0;
        6'd1  : coeff = 16'sd38;
        6'd2  : coeff = 16'sd48;
        6'd3  : coeff = 16'sd0;
        6'd4  : coeff = -16'sd85;
        6'd5  : coeff = -16'sd114;
        6'd6  : coeff = 16'sd0;
        6'd7  : coeff = 16'sd200;
        6'd8  : coeff = 16'sd258;
        6'd9  : coeff = 16'sd0;
        6'd10 : coeff = -16'sd414;
        6'd11 : coeff = -16'sd518;
        6'd12 : coeff = 16'sd0;
        6'd13 : coeff = 16'sd798;
        6'd14 : coeff = 16'sd992;
        6'd15 : coeff = 16'sd0;
        6'd16 : coeff = -16'sd1582;
        6'd17 : coeff = -16'sd2074;
        6'd18 : coeff = 16'sd0;
        6'd19 : coeff = 16'sd4416;
        6'd20 : coeff = 16'sd8970;
        6'd21 : coeff = 16'sd10903;

        default : coeff = 16'sd0;

    endcase
end

endmodule