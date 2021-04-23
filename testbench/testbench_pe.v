`timescale 1ns / 1ps
 module testbench_pe();
    reg clk;
    reg start;
    reg reset;
    reg [7:0] weight3;
    reg [7:0] weight2;
    reg [7:0] weight1;
    reg [7:0] img;
    reg store;

pe_module pe(
    .weight3(weight3),
    .weight2(weight2),
    .weight1(weight1),
    .channel_packed(3'b000),
    .img(img),
    .start(start),
    .reset(reset),
    .clk(clk)
    );

    always begin #50; clk =!clk; end
    reg[1:0] cnt;
    initial begin
        store <= 1'b0;
        clk <=1'b0;
        cnt <= 2'b00;
        img <= 8'h01;
        weight1<= 8'h01;
        weight2<= 8'h04;
        weight3<= 8'h07;
        start <= 1;
        reset <= 0;
        #100;
        start <= 0;
        #5000;
        reset <= 1;
        #450;
        reset<= 0;
        #100;
        start <=1;
        #100;
        start<=0;
        
    end
    
    always @(posedge clk) begin
        if( cnt == 2'b10) begin
            weight1 <= 8'h01;
            weight2 <=8'h04;
            weight3 <= 8'h07;
            cnt <= 2'b00;
        end
        else begin
            weight1 <= weight1+ 8'h01;
            weight2 <= weight2+ 8'h01;
            weight3 <= weight3+ 8'h01;
            cnt <= cnt+1'b1;
        end
        img <= img + 1'b1;
        
        
    end
endmodule
