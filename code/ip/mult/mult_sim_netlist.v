// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Feb  7 21:29:44 2021
// Host        : LAPTOP-7GNIJ01S running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/hardware/ETRI_semi/pe_rough_test/pe_rough_test.srcs/sources_1/ip/mult/mult_sim_netlist.v
// Design      : mult
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [15:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "8" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "8" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "15" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [7:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [15:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [15:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "8" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "15" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iWq1YRiPHaG6c702wN+jUYEYVccK0tAPaXxKKfjX3wWTz9O3Sr5rPw99p1nG58TlI35Rp5Az7+De
+JPEjQNToqcZ6qJBuvti6k528LPRuJ7doK667AMCsbDAB7ImzkfZEgeuERtizkFmvxC7WBU94XNh
6+X2VixeZK3A+VkcLOkOUg601D0GJR2f5+4egh8dmZXYapw3jSRWAIkNyk9IKLIO0LBY/jtgoD+w
jmShlU7tD9+ipMWu4uCTKMcj3exYFC8ogVHIAaRPfswD5XlmpuINX0N61Dqk5BZsTIznucF9Tkxc
mXM3PVhFkKWuoD/ItDKvP2FqrH24eyX0CWGFbg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cth49Dfbf1tVdOf4NcKKbv7py6X2VBS16UN5octA3ynQ411ZVtFIpZu6bEHqm1NvtWaQifp/Lym1
JJ6MEHutZYiRN/gpLaUPlo/Od7cN+GNzMsSG9kgVncVkqxX8UtIAWTV/yt8ufr3bhp2g2yJ2ac1K
UIbyi4YZob276lZZxsha4EU4XAc0DHXeMrHouoh2TcV2VHmFMS4kSmkdrxodkPAKY5L2YfkzHeqL
fJlp4COAZ58H+jpcja/Sv0bd00vGIxuaepkCVNQVN7X3TVKqB6vc7U0WmVf4fwEFU7GCuQIqN/bJ
DTWYVXvRLcNJXOfTht6XNQo8/BkbCXeTe6n0zA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7600)
`pragma protect data_block
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
rxDXnNn2VbL7KvzOUvU59cgxlw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
