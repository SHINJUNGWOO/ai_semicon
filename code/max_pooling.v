`timescale 1ns / 1ps
module max_pooling(
    input                 reset     ,
    input                 pass      ,

    input                 clk       ,
    input                 in_done_1 ,
    input                 in_done_2 ,
    input       [15:0]    in_value_1,
    input       [15:0]    in_value_2,
    
    output reg            out_done_1 ,
    output reg  [15:0]    out_value_1,
    output reg            out_done_2 ,
    output reg  [15:0]    out_value_2
    );


    reg[2:0] state; 

    always @(posedge clk) begin
        if (pass == 1'b1)begin
            out_done_1  <= in_done_1;
            out_value_1 <= in_value_1;
            out_done_2  <= in_done_2;
            out_value_2 <= in_value_2;
        end
        else if (pass == 1'b0)  begin
            if(reset == 1'b1) begin
                state <= 3'b000;
                out_done_1 <= 1'b0;
                out_done_2 <= 1'b0;
                out_value_1<=16'h0000;
                out_value_2<=16'h0000;
            end
            else begin
                case(state)
                    3'b000: begin
                        out_done_1 <= 1'b0;
                        out_done_2 <= 1'b0;
                        out_value_1<=16'h0000;
                        out_value_2<=16'h0000;

                        if(in_done_1 == 1'b1) begin
                            out_value_1 <= in_value_1;
                            state <= 3'b001;
                        end
                        else if(in_done_2 == 1'b1) begin
                            out_value_1 <= in_value_2;
                            state <= 3'b001;
                        end
                        else state<= 3'b000;
                    end
                    3'b001: begin
                        if(in_done_1 == 1'b1) begin
                            if(out_value_1 > in_value_1) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_1) out_value_1 <= in_value_1;
                            else out_value_1 <= out_value_1;
                            state <= 3'b010;
                        end
                        else if(in_done_2 == 1'b1) begin
                            if(out_value_1 > in_value_2) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_2) out_value_1 <= in_value_2;
                            else out_value_1 <= out_value_1;
                            state <= 3'b010;
                        end
                        else state<= 3'b001;
                    end
                    3'b010: begin
                        if(in_done_1 == 1'b1) begin
                            if(out_value_1 > in_value_1) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_1) out_value_1 <= in_value_1;
                            else out_value_1 <= out_value_1;
                            state <= 3'b011;
                        end
                        else if(in_done_2 == 1'b1) begin
                            if(out_value_1 > in_value_2) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_2) out_value_1 <= in_value_2;
                            else out_value_1 <= out_value_1;
                            state <= 3'b011;
                        end
                        else state<= 3'b010;
                    end
                    3'b011: begin
                        if(in_done_1 == 1'b1 && in_done_2 == 1'b0) begin
                            if(out_value_1 > in_value_1) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_1) out_value_1 <= in_value_1;
                            else out_value_1 <= out_value_1;
                            state <= 3'b100;
                            out_done_1 <= 1'b1;
                        end
                        else if(in_done_1 == 1'b0 && in_done_2 == 1'b1) begin
                            if(out_value_1 > in_value_2) out_value_1 <= out_value_1;
                            else if (out_value_1 < in_value_2) out_value_1 <= in_value_2;
                            else out_value_1 <= out_value_1;
                            state <= 3'b100;
                            out_done_1 <= 1'b1;
                        end
                        else state<= 3'b011;
                    end
                    3'b100: begin
                        out_done_1 <= 1'b0;
                        state <= 3'b000;
                    end
                    default: begin
                        state <= 3'b000;
                    end

                endcase
            end
        end
        else begin
            state       <= 3'b000;
            out_done_1  <= 1'b0;
            out_done_2  <= 1'b0;
            out_value_1 <= 16'h0000;
            out_value_2 <= 16'h0000;
        end
    end
endmodule
