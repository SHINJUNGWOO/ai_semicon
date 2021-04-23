`timescale 1ns / 1ps

module leaky_relu(
    input [15:0] in_value,
    input in_done,

    output [15:0] out_value,
    output out_done
    );
    assign out_value = (in_done == 1'b1)?
                        (in_value[15] == 1'b1)?
                            {3'b111,in_value[15:3]} :
                        in_value
                    : 16'h0000;
    assign out_done = in_done;
endmodule
