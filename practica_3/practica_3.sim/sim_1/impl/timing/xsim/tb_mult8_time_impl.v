// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Nov 24 20:47:48 2020
// Host        : DESKTOP-UDMFM76 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Pogramas/practica_3/practica_3.sim/sim_1/impl/timing/xsim/tb_mult8_time_impl.v
// Design      : mult8b
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "6d2e8b92" *) 
(* NotValidForBitStream *)
module mult8b
   (X,
    Y,
    Z);
  input [3:0]X;
  input [3:0]Y;
  output [7:0]Z;

  wire [3:0]X;
  wire [3:0]X_IBUF;
  wire [3:0]Y;
  wire [3:0]Y_IBUF;
  wire [7:0]Z;
  wire [7:0]Z_OBUF;
  wire \Z_OBUF[3]_inst_i_1_n_0 ;
  wire \Z_OBUF[3]_inst_i_2_n_0 ;
  wire \Z_OBUF[3]_inst_i_3_n_0 ;
  wire \Z_OBUF[3]_inst_i_4_n_0 ;
  wire \Z_OBUF[3]_inst_i_5_n_0 ;
  wire \Z_OBUF[3]_inst_i_6_n_0 ;
  wire \Z_OBUF[3]_inst_i_7_n_0 ;
  wire \Z_OBUF[3]_inst_i_8_n_0 ;
  wire \Z_OBUF[7]_inst_i_10_n_0 ;
  wire \Z_OBUF[7]_inst_i_11_n_0 ;
  wire \Z_OBUF[7]_inst_i_12_n_0 ;
  wire \Z_OBUF[7]_inst_i_13_n_0 ;
  wire \Z_OBUF[7]_inst_i_2_n_0 ;
  wire \Z_OBUF[7]_inst_i_3_n_0 ;
  wire \Z_OBUF[7]_inst_i_4_n_0 ;
  wire \Z_OBUF[7]_inst_i_5_n_0 ;
  wire \Z_OBUF[7]_inst_i_6_n_0 ;
  wire \Z_OBUF[7]_inst_i_7_n_0 ;
  wire \Z_OBUF[7]_inst_i_8_n_0 ;
  wire \Z_OBUF[7]_inst_i_9_n_0 ;
  wire [2:0]\NLW_Z_OBUF[3]_inst_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Z_OBUF[7]_inst_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_Z_OBUF[7]_inst_i_1_O_UNCONNECTED ;

initial begin
 $sdf_annotate("tb_mult8_time_impl.sdf",,,,"tool_control");
end
  IBUF \X_IBUF[0]_inst 
       (.I(X[0]),
        .O(X_IBUF[0]));
  IBUF \X_IBUF[1]_inst 
       (.I(X[1]),
        .O(X_IBUF[1]));
  IBUF \X_IBUF[2]_inst 
       (.I(X[2]),
        .O(X_IBUF[2]));
  IBUF \X_IBUF[3]_inst 
       (.I(X[3]),
        .O(X_IBUF[3]));
  IBUF \Y_IBUF[0]_inst 
       (.I(Y[0]),
        .O(Y_IBUF[0]));
  IBUF \Y_IBUF[1]_inst 
       (.I(Y[1]),
        .O(Y_IBUF[1]));
  IBUF \Y_IBUF[2]_inst 
       (.I(Y[2]),
        .O(Y_IBUF[2]));
  IBUF \Y_IBUF[3]_inst 
       (.I(Y[3]),
        .O(Y_IBUF[3]));
  OBUF \Z_OBUF[0]_inst 
       (.I(Z_OBUF[0]),
        .O(Z[0]));
  OBUF \Z_OBUF[1]_inst 
       (.I(Z_OBUF[1]),
        .O(Z[1]));
  OBUF \Z_OBUF[2]_inst 
       (.I(Z_OBUF[2]),
        .O(Z[2]));
  OBUF \Z_OBUF[3]_inst 
       (.I(Z_OBUF[3]),
        .O(Z[3]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 4x4}}" *) 
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY4 \Z_OBUF[3]_inst_i_1 
       (.CI(1'b0),
        .CO({\Z_OBUF[3]_inst_i_1_n_0 ,\NLW_Z_OBUF[3]_inst_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Z_OBUF[3]_inst_i_2_n_0 ,\Z_OBUF[3]_inst_i_3_n_0 ,\Z_OBUF[3]_inst_i_4_n_0 ,1'b0}),
        .O(Z_OBUF[3:0]),
        .S({\Z_OBUF[3]_inst_i_5_n_0 ,\Z_OBUF[3]_inst_i_6_n_0 ,\Z_OBUF[3]_inst_i_7_n_0 ,\Z_OBUF[3]_inst_i_8_n_0 }));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \Z_OBUF[3]_inst_i_2 
       (.I0(X_IBUF[2]),
        .I1(Y_IBUF[1]),
        .I2(Y_IBUF[3]),
        .I3(X_IBUF[0]),
        .I4(Y_IBUF[2]),
        .I5(X_IBUF[1]),
        .O(\Z_OBUF[3]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \Z_OBUF[3]_inst_i_3 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[1]),
        .I2(X_IBUF[0]),
        .I3(Y_IBUF[2]),
        .O(\Z_OBUF[3]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Z_OBUF[3]_inst_i_4 
       (.I0(X_IBUF[1]),
        .I1(Y_IBUF[0]),
        .O(\Z_OBUF[3]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h95556AAA6AAA6AAA)) 
    \Z_OBUF[3]_inst_i_5 
       (.I0(\Z_OBUF[3]_inst_i_2_n_0 ),
        .I1(Y_IBUF[1]),
        .I2(\Z_OBUF[7]_inst_i_9_n_0 ),
        .I3(X_IBUF[0]),
        .I4(X_IBUF[3]),
        .I5(Y_IBUF[0]),
        .O(\Z_OBUF[3]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \Z_OBUF[3]_inst_i_6 
       (.I0(Y_IBUF[2]),
        .I1(X_IBUF[0]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[1]),
        .I4(Y_IBUF[0]),
        .I5(X_IBUF[2]),
        .O(\Z_OBUF[3]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \Z_OBUF[3]_inst_i_7 
       (.I0(Y_IBUF[0]),
        .I1(X_IBUF[1]),
        .I2(Y_IBUF[1]),
        .I3(X_IBUF[0]),
        .O(\Z_OBUF[3]_inst_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \Z_OBUF[3]_inst_i_8 
       (.I0(X_IBUF[0]),
        .I1(Y_IBUF[0]),
        .O(\Z_OBUF[3]_inst_i_8_n_0 ));
  OBUF \Z_OBUF[4]_inst 
       (.I(Z_OBUF[4]),
        .O(Z[4]));
  OBUF \Z_OBUF[5]_inst 
       (.I(Z_OBUF[5]),
        .O(Z[5]));
  OBUF \Z_OBUF[6]_inst 
       (.I(Z_OBUF[6]),
        .O(Z[6]));
  OBUF \Z_OBUF[7]_inst 
       (.I(Z_OBUF[7]),
        .O(Z[7]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-9 {cell *THIS*} {string 4x4}}" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \Z_OBUF[7]_inst_i_1 
       (.CI(\Z_OBUF[3]_inst_i_1_n_0 ),
        .CO({Z_OBUF[7],\NLW_Z_OBUF[7]_inst_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,\Z_OBUF[7]_inst_i_2_n_0 ,\Z_OBUF[7]_inst_i_3_n_0 ,\Z_OBUF[7]_inst_i_4_n_0 }),
        .O({\NLW_Z_OBUF[7]_inst_i_1_O_UNCONNECTED [3],Z_OBUF[6:4]}),
        .S({1'b1,\Z_OBUF[7]_inst_i_5_n_0 ,\Z_OBUF[7]_inst_i_6_n_0 ,\Z_OBUF[7]_inst_i_7_n_0 }));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \Z_OBUF[7]_inst_i_10 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[3]),
        .I2(Y_IBUF[2]),
        .I3(X_IBUF[2]),
        .I4(Y_IBUF[3]),
        .I5(X_IBUF[1]),
        .O(\Z_OBUF[7]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hC4B470F04CCC8000)) 
    \Z_OBUF[7]_inst_i_11 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[3]),
        .I2(Y_IBUF[3]),
        .I3(X_IBUF[1]),
        .I4(Y_IBUF[2]),
        .I5(X_IBUF[2]),
        .O(\Z_OBUF[7]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \Z_OBUF[7]_inst_i_12 
       (.I0(X_IBUF[0]),
        .I1(Y_IBUF[2]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[1]),
        .O(\Z_OBUF[7]_inst_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    \Z_OBUF[7]_inst_i_13 
       (.I0(X_IBUF[2]),
        .I1(Y_IBUF[1]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[3]),
        .I4(Y_IBUF[2]),
        .I5(X_IBUF[0]),
        .O(\Z_OBUF[7]_inst_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFC88800080000000)) 
    \Z_OBUF[7]_inst_i_2 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[3]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[3]),
        .I4(Y_IBUF[2]),
        .I5(X_IBUF[2]),
        .O(\Z_OBUF[7]_inst_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \Z_OBUF[7]_inst_i_3 
       (.I0(Y_IBUF[0]),
        .I1(\Z_OBUF[7]_inst_i_8_n_0 ),
        .I2(X_IBUF[3]),
        .O(\Z_OBUF[7]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \Z_OBUF[7]_inst_i_4 
       (.I0(X_IBUF[3]),
        .I1(Y_IBUF[1]),
        .I2(\Z_OBUF[7]_inst_i_9_n_0 ),
        .I3(X_IBUF[0]),
        .I4(Y_IBUF[0]),
        .I5(\Z_OBUF[7]_inst_i_10_n_0 ),
        .O(\Z_OBUF[7]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1777808088000000)) 
    \Z_OBUF[7]_inst_i_5 
       (.I0(X_IBUF[2]),
        .I1(Y_IBUF[2]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[1]),
        .I4(X_IBUF[3]),
        .I5(Y_IBUF[3]),
        .O(\Z_OBUF[7]_inst_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \Z_OBUF[7]_inst_i_6 
       (.I0(X_IBUF[3]),
        .I1(\Z_OBUF[7]_inst_i_8_n_0 ),
        .I2(Y_IBUF[0]),
        .I3(\Z_OBUF[7]_inst_i_11_n_0 ),
        .O(\Z_OBUF[7]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h95556AAA)) 
    \Z_OBUF[7]_inst_i_7 
       (.I0(\Z_OBUF[7]_inst_i_10_n_0 ),
        .I1(Y_IBUF[0]),
        .I2(\Z_OBUF[7]_inst_i_12_n_0 ),
        .I3(X_IBUF[3]),
        .I4(\Z_OBUF[7]_inst_i_13_n_0 ),
        .O(\Z_OBUF[7]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8000200000000000)) 
    \Z_OBUF[7]_inst_i_8 
       (.I0(X_IBUF[0]),
        .I1(Y_IBUF[3]),
        .I2(Y_IBUF[2]),
        .I3(X_IBUF[1]),
        .I4(X_IBUF[2]),
        .I5(Y_IBUF[1]),
        .O(\Z_OBUF[7]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \Z_OBUF[7]_inst_i_9 
       (.I0(Y_IBUF[2]),
        .I1(X_IBUF[1]),
        .O(\Z_OBUF[7]_inst_i_9_n_0 ));
endmodule
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
