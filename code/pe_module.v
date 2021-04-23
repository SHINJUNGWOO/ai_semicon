`timescale 1ns / 1ps

// rought 3*3 conv
module pe_module(
    input [7:0] weight3,
    input [7:0] weight2,
    input [7:0] weight1,
    input [2:0] channel_packed,
    input [7:0] img,
    input start,
    input reset,
    input clk,
    output reg out_start,
    output reg out_reset,
    output reg [7:0] out_weight3,
    output reg [7:0] out_weight2,
    output reg [7:0] out_weight1,
    output reg [7:0] out_img,
    output reg [15:0] value,
    output reg done
    );
    
    reg [7:0] img_buffer_1;
    reg [7:0] img_buffer_2;
    reg [7:0] img_buffer_3;
    wire start_line1;
    wire start_line2;

    wire reset_line1;
    wire reset_line2;
    
    wire done1;
    wire done2;
    wire done3;
    wire[15:0] value1;
    wire[15:0] value2;
    wire[15:0] value3;
    
    
    reg[7:0] weight_buffer3;
    reg[7:0] weight_buffer2_1;
    reg[7:0] weight_buffer2_2;
    reg[7:0] weight_buffer1_1;
    reg[7:0] weight_buffer1_2;
    reg[7:0] weight_buffer1_3;
    
    reg start_buffer;
    reg reset_buffer;

    wire[9:0] channel_size;
    assign channel_size = (channel_packed == 3'b111)? 10'h200:
                          (channel_packed == 3'b110)? 10'h100:
                          (channel_packed == 3'b101)? 10'h080:
                          (channel_packed == 3'b100)? 10'h040:
                          (channel_packed == 3'b011)? 10'h020:
                          (channel_packed == 3'b010)? 10'h010:
                          (channel_packed == 3'b001)? 10'h008:
                          (channel_packed == 3'b000)? 10'h003:10'h003;
    // packed 2^(channel_packed+2) // for channel making
    // if channel_pack == 0 channelsize = 3

    sub_pe sp_1(
    .start(start_buffer),
    .reset(reset_buffer),
    .clk(clk),
    .img(img_buffer_1),
    .weight(weight_buffer3),
    .channel(channel_size),
    .out_start(start_line1),
    .out_reset(reset_line1),
    .done(done1),
    .value(value1)
    );
    
    sub_pe sp_2(
    .start(start_line1),
    .reset(reset_line1),
    .clk(clk),
    .img(img_buffer_2),
    .weight(weight_buffer2_2),
    .channel(channel_size),
    .out_start(start_line2),
    .out_reset(reset_line2),
    .done(done2),
    .value(value2)
    );
    sub_pe sp_3(
    .start(start_line2),
    .reset(reset_line2),
    .clk(clk),
    .img(img_buffer_3),
    .weight(weight_buffer1_3),
    .channel(channel_size),
    .done(done3),
    .value(value3)
    );

    reg[2:0] state;
    reg[15:0] tmp;
    always @(posedge clk) begin
        start_buffer <= start;
        reset_buffer <= reset;
        weight_buffer3 <= weight3;
        weight_buffer2_1 <= weight2;
        weight_buffer2_2 <= weight_buffer2_1;
        weight_buffer1_1 <= weight1;
        weight_buffer1_2 <= weight_buffer1_1;
        weight_buffer1_3 <= weight_buffer1_2;
        out_start <= start;
        out_reset <= reset;
        
            
        img_buffer_1 <= img;
        img_buffer_2 <=img_buffer_1;
        img_buffer_3 <=img_buffer_2;

        out_weight1 <=weight1;
        out_weight2 <=weight2;
        out_weight3 <=weight3;
        out_img <= img;

        if(reset == 1'b1) begin
            value <= 16'h0000;
            done <= 1'b0;
            state <= 3'b001;
        end
        else begin           
            case(state)
            3'b001: begin
                if(done3 == 1'b1)begin tmp <= value3; state <= 3'b010; end
                else state <= 3'b001;
            end
            3'b010: begin
                if(done2 == 1'b1)begin value <= value2; state <= 3'b011; end
                else state <= 3'b010;
                done <=1'b0;
            end
            3'b011: begin
                if(done3 == 1'b1)begin value <= value + tmp;  state <= 3'b100; tmp<= value3; end
                else state <= 3'b011;
            end
            3'b100: begin
                if(done1 == 1'b1)begin value <= value1+ value; state <= 3'b010; done<=1'b1; end
                else state <= 3'b100;
            end
            default: begin
                value <= 16'h0000;
                done <= 1'b0;
                state <= 2'b01;
            end
            endcase
        end
    end
    
endmodule