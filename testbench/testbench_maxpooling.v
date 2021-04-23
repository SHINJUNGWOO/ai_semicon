`timescale 1ns / 1ps
module testbench_maxpooling();
reg reset;
reg pass;
reg clk;

reg in_done_1;
reg in_done_2;

reg [15:0] in_value_1;
reg [15:0] in_value_2;
 max_pooling MP(
    .reset(reset),
    .pass(pass),
    .clk(clk),
    .in_done_1(in_done_1),
    .in_done_2(in_done_2),
    .in_value_1(in_value_1),
    .in_value_2(in_value_2)
    );
    
 always begin #50; clk =!clk; end
 initial begin
    pass = 1'b0;
    reset = 1'b0;
    clk = 0;
    #100;
    #100;
    #100;
    #100;
    in_done_1 = 1'b1;
    in_value_1 = 16'h0001;
    #100;
    in_done_1 = 1'b0;
    in_value_1 = 16'h0000;
    
    #100;
    in_done_2 = 1'b1;
    in_value_2 = 16'h0002;
    #100;
    in_done_2 = 1'b0;
    in_value_2 = 16'h0000;
    
    #100;
    #100;
    in_done_1 = 1'b1;
    in_value_1 = 16'h0003;
    #100;
    in_done_1 = 1'b0;
    in_value_1 = 16'h0000;
    
    reset =1'b1;
    #100;
    in_done_2 = 1'b1;
    in_value_2 = 16'h0004;
    #100;
    in_done_2 = 1'b0;
    in_value_2 = 16'h0000;
    
 end
endmodule
