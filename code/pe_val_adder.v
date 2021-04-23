`timescale 1ns / 1ps
module pe_val_adder(
    input             clk,
    input             reset,
    input             done_1,
    input             done_2,
    input             done_3,
    input     [15:0]  data_1,
    input     [15:0]  data_2,
    input     [15:0]  data_3,
    output reg        done,
    output reg[15:0]  value 
    );

    reg[1:0] state;

    always @(posedge clk) begin
        if(reset == 1'b1) begin
            state <= 2'b00;
            done  <= 1'b0;
            value <= 16'h0000;
        end
        else begin
            case(state)
            2'b00: begin
                if(done_1== 1'b1) begin
                    value <= data_1;
                    state <= 2'b01;
                    done <= 1'b0;
                end
                else begin
                    state<= 2'b00;
                    done <= 1'b0;
                end
            end
            2'b01: begin
                if(done_2== 1'b1) begin
                    value <= value + data_2;
                    state <= 2'b10;
                end
                else state<= 2'b01;
            end
            2'b10: begin
                if(done_3== 1'b1) begin
                    value <= value + data_3;
                    done <=1'b1;
                    state <= 2'b00;
                end
                else state<= 2'b10;
            end
            default: begin
                value <= 16'h0000;
                done <= 1'b0;
                state<= 2'b00;
            end
            
            endcase
        end
    end


endmodule
