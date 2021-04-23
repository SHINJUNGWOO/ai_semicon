`timescale 1ns / 1ps

module sub_pe(
    input start,
    input reset,
    input clk,
    input [7:0] img,
    input [7:0] weight,
    input [9:0] channel,
    output reg out_start,
    output reg out_reset,
    output reg[7:0] out_weight,
    output reg[7:0] out_img,
    output reg done,
    output reg[15:0] value
    );
    reg[1:0] state;
    reg[9:0] cnt;
    wire[15:0] tmp;
    mult m1 (
      .CLK(clk),
      .A(weight),      // input wire [7 : 0] A
      .B(img),      // input wire [7 : 0] B
      .P(tmp)      // output wire [7 : 0] P
    );
    always @(posedge clk) begin
    out_start <= start;
    out_reset <= reset;
    out_weight <= weight;
    out_img <= img;

        if(reset == 1'b1) begin
            state <= 2'b00;
            value <= 16'h0000;
            cnt <= 10'h000;;
            done <= 1'b0;
        end
        else begin
            if(state == 2'b01) begin
                state <= 2'b10;
                value <= tmp;
                cnt <= 10'h001;
                done <= 1'b0;
            end
            else if(state == 2'b10) begin

                if(cnt==channel)begin
                    done <= 1'b0;
                    cnt <= 10'h001;
                    value <= tmp;
                end
                else begin
                    value <= value + tmp;
                    cnt <= cnt + 1'b1;
                    if (cnt == channel -1'b1) done <= 1'b1;
                    else done<= 1'b0;
                end
                    
            end
            else begin
                if(start == 1'b1)begin state <= 2'b01; end
                else state <= 2'b00;
            end
        end
    end
endmodule
