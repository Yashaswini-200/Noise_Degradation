`timescale 1ns / 1ps

module output_scaler
#(
    parameter ACC_WIDTH = 40
)
(
    input signed [ACC_WIDTH-1:0] acc,
    output reg signed [15:0] y
);

wire signed [ACC_WIDTH-1:0] shifted;

assign shifted = acc >>> 15;

integer overflow_pos = 0;
integer overflow_neg = 0;

always @(*) begin

    if (shifted > 32767) begin

        overflow_pos = overflow_pos + 1;

        $display("Positive Overflow #%0d : shifted = %0d",
                 overflow_pos, shifted);

        y = 16'sd32767;

    end
    else if (shifted < -32768) begin

        overflow_neg = overflow_neg + 1;

        $display("Negative Overflow #%0d : shifted = %0d",
                 overflow_neg, shifted);

        y = -16'sd32768;

    end
    else begin

        y = shifted[15:0];

    end

end

endmodule