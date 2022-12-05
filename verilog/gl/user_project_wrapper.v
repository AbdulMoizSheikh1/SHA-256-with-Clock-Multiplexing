module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    vss,
    vdd,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input vss;
 input vdd;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [63:0] la_data_in;
 output [63:0] la_data_out;
 input [63:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire zero_;

 top_tukka_proj mprj (.VDD(vdd),
    .VSS(vss),
    .clk1(wb_clk_i),
    .clk2(user_clock2),
    .cs(wbs_stb_i),
    .error(wbs_dat_o[0]),
    .reset_n(wb_rst_i),
    .sel_clk2(io_in[0]),
    .we(wbs_we_i),
    .address({wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .read_data({zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    zero_,
    wbs_dat_o[0]}),
    .write_data({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}));
 gf180mcu_fd_sc_mcu7t5v0__tiel TIE_ZERO_zero_ (.ZN(zero_),
    .VDD(vdd),
    .VSS(vss));
 assign wbs_dat_o[10] = zero_;
 assign wbs_dat_o[11] = zero_;
 assign wbs_dat_o[12] = zero_;
 assign wbs_dat_o[13] = zero_;
 assign wbs_dat_o[14] = zero_;
 assign wbs_dat_o[15] = zero_;
 assign wbs_dat_o[16] = zero_;
 assign wbs_dat_o[17] = zero_;
 assign wbs_dat_o[18] = zero_;
 assign wbs_dat_o[19] = zero_;
 assign wbs_dat_o[1] = zero_;
 assign wbs_dat_o[20] = zero_;
 assign wbs_dat_o[21] = zero_;
 assign wbs_dat_o[22] = zero_;
 assign wbs_dat_o[23] = zero_;
 assign wbs_dat_o[24] = zero_;
 assign wbs_dat_o[25] = zero_;
 assign wbs_dat_o[26] = zero_;
 assign wbs_dat_o[27] = zero_;
 assign wbs_dat_o[28] = zero_;
 assign wbs_dat_o[29] = zero_;
 assign wbs_dat_o[2] = zero_;
 assign wbs_dat_o[30] = zero_;
 assign wbs_dat_o[31] = zero_;
 assign wbs_dat_o[3] = zero_;
 assign wbs_dat_o[4] = zero_;
 assign wbs_dat_o[5] = zero_;
 assign wbs_dat_o[6] = zero_;
 assign wbs_dat_o[7] = zero_;
 assign wbs_dat_o[8] = zero_;
 assign wbs_dat_o[9] = zero_;
endmodule
