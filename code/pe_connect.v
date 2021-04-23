`timescale 1ns / 1ps

module pe_connect #(parameter IMG_ROW = 54, WEIGHT_COL = 3, WEIGHT_ROW = 3 )(
    input[IMG_ROW-1     :0]        start,
    input[IMG_ROW-1     :0]        reset,
    input                          clk,
    input[2             :0]        channel_packed, 
    input[IMG_ROW*8-1   :0]        img,
    input[WEIGHT_ROW*8-1:0]        weight_top ,
    input[WEIGHT_ROW*8-1:0]        weight_mid ,
    input[WEIGHT_ROW*8-1:0]        weight_bottom,


    output[IMG_ROW -1   :0]        done,
    output[IMG_ROW*16-1 :0]        out_value
    );

    ///////////////
    //
    // Model is Designed FOR 3x3 Convolutional Filter
    //
    ////////////////
    // weight_top    [7:0] [15:8] [23:16]
    // weight_mid    [7:0] [15:8] [23:16]
    // weight_bottom [7:0] [15:8] [23:16]
    //
    // 
    // pe  pe   - - - - - pe  buf  buf
    // buf pe   - - - - - pe  pe   buf
    // buf buf  pe- - - - pe  pe   pe
    // ========PE ADDER=======
    //
    // rows Input Image must be one clock delayed before input
    // weight will be controlled in same clock(controlled by buffer so we can put signal in same clk)
    //
    // channel_packed
    // if(channel_pack == 0) channel = 3
    // else                  channel = 2^(channel_packed+2)
    ///////////////

    wire [WEIGHT_ROW*8-1:0] weight_top_connect    [0:IMG_ROW  ];
    wire [WEIGHT_ROW*8-1:0] weight_mid_connect    [0:IMG_ROW  ];
    wire [WEIGHT_ROW*8-1:0] weight_bottom_connect [0:IMG_ROW  ];

    wire [7:0]              img_top_connect       [0:IMG_ROW-1];
    wire [7:0]              img_bottom_connect    [0:IMG_ROW-1];

    wire                    start_top_connect     [0:IMG_ROW-1];
    wire                    start_bottom_connect  [0:IMG_ROW-1];

    wire                    reset_top_connect     [0:IMG_ROW-1];
    wire                    reset_bottom_connect  [0:IMG_ROW-1];

    wire                    done_top_connect      [0:IMG_ROW-1];
    wire                    done_mid_connect      [0:IMG_ROW-1];
    wire                    done_bottom_connect   [0:IMG_ROW-1];

    wire[15:0]              value_top_connect     [0:IMG_ROW-1];
    wire[15:0]              value_mid_connect     [0:IMG_ROW-1];
    wire[15:0]              value_bottom_connect  [0:IMG_ROW-1];


    assign weight_top_connect   [0] = weight_top;
    assign weight_mid_connect   [0] = weight_mid;
    assign weight_bottom_connect[0] = weight_bottom;

    genvar idx;
    generate
        
        for(idx =0; idx < IMG_ROW; idx = idx + 1) begin: pe_top
            pe_module pe(
            .weight3(weight_top_connect[idx][23:16]),
            .weight2(weight_top_connect[idx][15:8]),
            .weight1(weight_top_connect[idx][7:0]),
            .channel_packed(channel_packed),
            .img(img[(idx+1)*8-1:idx*8]),
            .start(start[idx]),
            .reset(reset[idx]),
            .clk(clk),
            .out_start(start_top_connect[idx]),
            .out_reset(reset_top_connect[idx]),
            .out_weight3(weight_top_connect[idx+1][23:16]),
            .out_weight2(weight_top_connect[idx+1][15:8]),
            .out_weight1(weight_top_connect[idx+1][7:0]),
            .out_img(img_top_connect[idx]),
            .value(value_top_connect[idx]),
            .done(done_top_connect[idx])
            );
        end

        for(idx =0; idx < IMG_ROW; idx = idx + 1) begin: pe_mid
            pe_module pe(
            .weight3(weight_mid_connect[idx][23:16]),
            .weight2(weight_mid_connect[idx][15:8]),
            .weight1(weight_mid_connect[idx][7:0]),
            .channel_packed(channel_packed),
            .img(img_top_connect[idx]),
            .start(start_top_connect[idx]),
            .reset(reset_top_connect[idx]),
            .clk(clk),
            .out_start(start_bottom_connect[idx]),
            .out_reset(reset_bottom_connect[idx]),
            .out_weight3(weight_mid_connect[idx+1][23:16]),
            .out_weight2(weight_mid_connect[idx+1][15:8]),
            .out_weight1(weight_mid_connect[idx+1][7:0]),
            .out_img(img_bottom_connect[idx]),
            .value(value_mid_connect[idx]),
            .done(done_mid_connect[idx])
            );
        end

        for(idx =0; idx < IMG_ROW; idx = idx + 1) begin: pe_bottom
            pe_module pe(
            .weight3(weight_bottom_connect[idx][23:16]),
            .weight2(weight_bottom_connect[idx][15:8]),
            .weight1(weight_bottom_connect[idx][7:0]),
            .channel_packed(channel_packed),
            .img(img_bottom_connect[idx]),
            .start(start_bottom_connect[idx]),
            .reset(reset_bottom_connect[idx]),
            .clk(clk),
            .out_weight3(weight_bottom_connect[idx+1][23:16]),
            .out_weight2(weight_bottom_connect[idx+1][15:8]),
            .out_weight1(weight_bottom_connect[idx+1][7:0]),
            .value(value_bottom_connect[idx]),
            .done(done_bottom_connect[idx])
            );
        end

        for(idx =0; idx < IMG_ROW; idx = idx + 1) begin: pe_val_adder
            pe_val_adder PE_Adder(
            .clk   (clk),
            .reset (reset[idx]),
            .done_1(done_top_connect   [idx]),
            .done_2(done_mid_connect   [(idx+1)%IMG_ROW]),
            .done_3(done_bottom_connect[(idx+2)%IMG_ROW]),
            .data_1(value_top_connect   [idx]),
            .data_2(value_mid_connect   [(idx+1)%IMG_ROW]),
            .data_3(value_bottom_connect[(idx+2)%IMG_ROW]),
            .done  (done[idx]),
            .value (out_value[(idx+1)*16-1:idx*16]) 
            );
        end

        
    endgenerate

    //TODO : Buffer connect and connect Weight
    // Image Buffer must be connected



endmodule
