`timescale 1ns / 1ps
 module testbench_sub_pe();
    reg clk;
    reg start;
    reg [7:0] weight;
    reg [7:0] img;

    sub_pe sp(
    .start(start),
    .clk(clk),
    .img(img),
    .weight(weight),
    .channel(3'b011));
    always begin #50; clk =!clk; end
    
    initial begin
        clk <=1'b0;
        img <= 8'h03;
        weight<= 8'h01;
        start <= 1;
        #100;
        start <= 0;
        
    end
    always @(posedge clk) begin
        img <= img + 1'b1;
        weight <= weight+ 8'h01;
        
        
    end
endmodule
