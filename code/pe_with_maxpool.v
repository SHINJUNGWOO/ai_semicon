`timescale 1ns / 1ps
module pe_with_maxpool #(parameter IMG_ROW = 54, WEIGHT_COL = 3, WEIGHT_ROW = 3 )(
    input[IMG_ROW-1     :0]        start,
    input[IMG_ROW-1     :0]        reset,
    input                          clk,
    input[2             :0]        channel_packed, 
    input[IMG_ROW*8-1   :0]        img,
    input[WEIGHT_ROW*8-1:0]        weight_top ,
    input[WEIGHT_ROW*8-1:0]        weight_mid ,
    input[WEIGHT_ROW*8-1:0]        weight_bottom,

    input[IMG_ROW/2-1     :0]      pass,

    output[IMG_ROW -1   :0]        done,
    output[IMG_ROW*16-1 :0]        out_value
    );

    wire[IMG_ROW -1   :0]        conv_done;
    wire[IMG_ROW*16-1 :0]        conv_out_value;
    pe_connect CONV(
    .start(start),
    .reset(reset),
    .clk(clk),
    .channel_packed(channel_packed), 
    .img(img),
    .weight_top(weight_top),
    .weight_mid(weight_mid),
    .weight_bottom(weight_bottom),


    .done(conv_done),
    .out_value(conv_out_value)
    );
    genvar idx;
    generate
        
        for(idx =0; idx < IMG_ROW; idx = idx + 2) begin: max_pooling

            wire       relu_done_conjunction_left;
            wire[15:0] relu_value_conjunction_left;

            wire       relu_done_conjunction_right;
            wire[15:0] relu_value_conjunction_right;

            max_pooling MP(
            .reset(reset[idx]),
            .pass(pass[idx/2]),

            .clk(clk),
            .in_done_1(conv_done[idx]),
            .in_done_2(conv_done[idx+1]) ,
            .in_value_1(conv_out_value[(idx+1)*16 -1 :idx * 16]),
            .in_value_2(conv_out_value[(idx+2)*16 -1 :(idx+1) * 16]),
            
            .out_done_1(relu_done_conjunction_left),
            .out_value_1(relu_value_conjunction_left),

            .out_done_2(relu_done_conjunction_right) ,
            .out_value_2(relu_done_conjunction_right)
            );
            leaky_relu left_activ(
            .in_done(relu_done_conjunction_left),
            .in_value(relu_value_conjunction_left),

            .out_done(done[idx]),
            .out_value(out_value[(idx+1)*16 -1 :idx * 16])
            );

            leaky_relu right_activ(
            .in_done(relu_done_conjunction_right),
            .in_value(relu_value_conjunction_right),

            .out_done(done[idx+1]),
            .out_value(out_value[(idx+2)*16 -1 :(idx+1) * 16])
            );

    
        end

    endgenerate

endmodule
