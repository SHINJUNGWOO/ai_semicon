`timescale 1ns / 1ps
module testbench_leakyrelu();
reg[15:0] in_value;
reg in_done;

leaky_relu LR(
    .in_value(in_value),
    .in_done(in_done)

    );

initial begin
    in_value = 0;
    in_done = 0;
    #100;
    in_done = 1;
    in_value = 100;
    #100;
    in_done = 0;
    
    # 200
    in_done = 1;
    in_value = 16'hff00;
    #1000;
end
endmodule
