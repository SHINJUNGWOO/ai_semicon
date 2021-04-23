`timescale 1ns / 1ps
module testbench_pe_with_maxpool();
parameter IMG_ROW = 13,WEIGHT_ROW =3 ;

reg[IMG_ROW-1     :0]        start;
reg[IMG_ROW-1     :0]        reset;
reg                          clk;
reg[2             :0]        channel_packed; 
reg[IMG_ROW*8-1   :0]        img;
reg[WEIGHT_ROW*8-1:0]        weight_top;
reg[WEIGHT_ROW*8-1:0]        weight_mid;
reg[WEIGHT_ROW*8-1:0]        weight_bottom;

wire[15:0] test;
pe_with_maxpool PE(
    .start(start),
    .reset(reset),
    .clk(clk),
    .channel_packed(channel_packed), 
    .img(img),
    .weight_top(weight_top),
    .weight_mid(weight_mid),
    .weight_bottom(weight_bottom),
    .out_value(test)
    );
    
    always begin #50; clk =!clk; end
    initial begin
        clk =1'b0;
        img = 8'h01;
        start =1'b1;
        weight_top = 23'h010101;
        weight_mid = 23'h010101;
        weight_bottom = 23'h010101;
        channel_packed = 3'b010;
    end
    always @(posedge clk) begin
        img = img<<8;
        img[7:0] = 8'h01;
        start <= start<<1;
        
    end
endmodule