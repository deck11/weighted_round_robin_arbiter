// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module weighted_rr_Block_entry_split_proc_Pipeline_VITIS_LOOP_29_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        current_load,
        req,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        weight,
        p_out,
        p_out_ap_vld,
        zext_ln32_out,
        zext_ln32_out_ap_vld,
        shl_ln_out,
        shl_ln_out_ap_vld,
        counters_load_out,
        counters_load_out_ap_vld,
        current,
        current_ap_vld,
        counters_address0,
        counters_ce0,
        counters_we0,
        counters_d0,
        counters_q0
);

parameter    ap_ST_fsm_state1 = 21'd1;
parameter    ap_ST_fsm_state2 = 21'd2;
parameter    ap_ST_fsm_state3 = 21'd4;
parameter    ap_ST_fsm_state4 = 21'd8;
parameter    ap_ST_fsm_state5 = 21'd16;
parameter    ap_ST_fsm_state6 = 21'd32;
parameter    ap_ST_fsm_state7 = 21'd64;
parameter    ap_ST_fsm_state8 = 21'd128;
parameter    ap_ST_fsm_state9 = 21'd256;
parameter    ap_ST_fsm_state10 = 21'd512;
parameter    ap_ST_fsm_state11 = 21'd1024;
parameter    ap_ST_fsm_state12 = 21'd2048;
parameter    ap_ST_fsm_state13 = 21'd4096;
parameter    ap_ST_fsm_state14 = 21'd8192;
parameter    ap_ST_fsm_state15 = 21'd16384;
parameter    ap_ST_fsm_state16 = 21'd32768;
parameter    ap_ST_fsm_state17 = 21'd65536;
parameter    ap_ST_fsm_state18 = 21'd131072;
parameter    ap_ST_fsm_state19 = 21'd262144;
parameter    ap_ST_fsm_state20 = 21'd524288;
parameter    ap_ST_fsm_state21 = 21'd1048576;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [2:0] current_load;
input  [63:0] req;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [31:0] m_axi_gmem_WDATA;
output  [3:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [31:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [8:0] m_axi_gmem_RFIFONUM;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [63:0] weight;
output  [2:0] p_out;
output   p_out_ap_vld;
output  [1:0] zext_ln32_out;
output   zext_ln32_out_ap_vld;
output  [4:0] shl_ln_out;
output   shl_ln_out_ap_vld;
output  [31:0] counters_load_out;
output   counters_load_out_ap_vld;
output  [2:0] current;
output   current_ap_vld;
output  [1:0] counters_address0;
output   counters_ce0;
output   counters_we0;
output  [31:0] counters_d0;
input  [31:0] counters_q0;

reg ap_idle;
reg m_axi_gmem_ARVALID;
reg[63:0] m_axi_gmem_ARADDR;
reg m_axi_gmem_RREADY;
reg p_out_ap_vld;
reg zext_ln32_out_ap_vld;
reg shl_ln_out_ap_vld;
reg counters_load_out_ap_vld;
reg current_ap_vld;

(* fsm_encoding = "none" *) reg   [20:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state21;
reg   [0:0] icmp_ln32_reg_394;
wire   [0:0] icmp_ln34_fu_276_p2;
reg    ap_condition_exit_pp0_iter0_stage20;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_state2;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state20;
reg    ap_block_state1_pp0_stage0_iter0;
reg  signed [2:0] p_load_reg_355;
wire   [1:0] trunc_ln32_fu_198_p1;
reg   [1:0] trunc_ln32_reg_362;
wire  signed [4:0] shl_ln_fu_202_p3;
reg  signed [4:0] shl_ln_reg_368;
wire  signed [63:0] sext_ln32_2_fu_210_p1;
reg  signed [63:0] sext_ln32_2_reg_373;
reg   [63:0] gmem_addr_reg_378;
reg   [31:0] gmem_addr_read_reg_384;
reg    ap_block_state10_pp0_stage9_iter0;
wire  signed [3:0] sext_ln32_fu_240_p1;
reg  signed [3:0] sext_ln32_reg_389;
wire    ap_CS_fsm_state11;
wire   [0:0] icmp_ln32_fu_247_p2;
reg   [1:0] counters_addr_reg_398;
reg   [63:0] gmem_addr_1_reg_403;
reg   [31:0] counters_load_reg_409;
reg    ap_block_state12_io;
reg   [31:0] gmem_addr_1_read_reg_415;
reg    ap_block_state20_pp0_stage19_iter0;
wire   [63:0] zext_ln32_fu_243_p1;
wire  signed [63:0] sext_ln32_1_fu_230_p1;
wire  signed [63:0] sext_ln34_fu_266_p1;
wire   [2:0] select_ln52_fu_324_p3;
reg   [2:0] empty_fu_102;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_p_load;
reg    counters_ce0_local;
reg   [1:0] counters_address0_local;
reg    counters_we0_local;
wire  signed [2:0] trunc_ln32_fu_198_p0;
wire  signed [2:0] shl_ln_fu_202_p1;
wire   [63:0] add_ln32_fu_214_p2;
wire   [61:0] trunc_ln1_fu_220_p4;
wire   [63:0] add_ln34_fu_252_p2;
wire   [61:0] trunc_ln2_fu_256_p4;
wire   [3:0] add_ln52_fu_280_p2;
wire   [1:0] xor_ln52_fu_297_p2;
wire   [2:0] p_and_t_fu_302_p3;
wire   [1:0] trunc_ln52_fu_293_p1;
wire   [0:0] tmp_fu_285_p3;
wire   [2:0] sub_ln52_fu_310_p2;
wire   [2:0] tmp_3_fu_316_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [20:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
reg    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
reg    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 21'd1;
#0 empty_fu_102 = 3'd0;
#0 ap_done_reg = 1'b0;
end

weighted_rr_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage20),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state21))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_pp0_stage0_iter0))) begin
        empty_fu_102 <= current_load;
    end else if (((1'b1 == ap_CS_fsm_state21) & ((icmp_ln34_fu_276_p2 == 1'd0) | (icmp_ln32_reg_394 == 1'd0)))) begin
        empty_fu_102 <= select_ln52_fu_324_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        counters_addr_reg_398 <= zext_ln32_fu_243_p1;
        gmem_addr_1_reg_403 <= sext_ln34_fu_266_p1;
        icmp_ln32_reg_394 <= icmp_ln32_fu_247_p2;
        sext_ln32_reg_389 <= sext_ln32_fu_240_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state12) & (1'b0 == ap_block_state12_io))) begin
        counters_load_reg_409 <= counters_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state20) & (1'b0 == ap_block_state20_pp0_stage19_iter0))) begin
        gmem_addr_1_read_reg_415 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state10) & (1'b0 == ap_block_state10_pp0_stage9_iter0))) begin
        gmem_addr_read_reg_384 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_pp0_stage0_iter0))) begin
        gmem_addr_reg_378 <= sext_ln32_1_fu_230_p1;
        p_load_reg_355 <= ap_sig_allocacmp_p_load;
        sext_ln32_2_reg_373[63 : 2] <= sext_ln32_2_fu_210_p1[63 : 2];
        shl_ln_reg_368[4 : 2] <= shl_ln_fu_202_p3[4 : 2];
        trunc_ln32_reg_362 <= trunc_ln32_fu_198_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state10_pp0_stage9_iter0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state12_io)) begin
        ap_ST_fsm_state12_blk = 1'b1;
    end else begin
        ap_ST_fsm_state12_blk = 1'b0;
    end
end

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state1_pp0_stage0_iter0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state20_pp0_stage19_iter0)) begin
        ap_ST_fsm_state20_blk = 1'b1;
    end else begin
        ap_ST_fsm_state20_blk = 1'b0;
    end
end

assign ap_ST_fsm_state21_blk = 1'b0;

always @ (*) begin
    if ((m_axi_gmem_ARREADY == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln34_fu_276_p2 == 1'd1) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        ap_condition_exit_pp0_iter0_stage20 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage20 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state21))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_p_load = current_load;
    end else begin
        ap_sig_allocacmp_p_load = empty_fu_102;
    end
end

always @ (*) begin
    if (((icmp_ln34_fu_276_p2 == 1'd0) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        counters_address0_local = counters_addr_reg_398;
    end else if (((1'b1 == ap_CS_fsm_state11) & (icmp_ln32_fu_247_p2 == 1'd1))) begin
        counters_address0_local = zext_ln32_fu_243_p1;
    end else begin
        counters_address0_local = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln34_fu_276_p2 == 1'd0) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21)) | ((1'b1 == ap_CS_fsm_state11) & (icmp_ln32_fu_247_p2 == 1'd1)))) begin
        counters_ce0_local = 1'b1;
    end else begin
        counters_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln34_fu_276_p2 == 1'd1) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        counters_load_out_ap_vld = 1'b1;
    end else begin
        counters_load_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln34_fu_276_p2 == 1'd0) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        counters_we0_local = 1'b1;
    end else begin
        counters_we0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) & ((icmp_ln34_fu_276_p2 == 1'd0) | (icmp_ln32_reg_394 == 1'd0)))) begin
        current_ap_vld = 1'b1;
    end else begin
        current_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state12)))) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | ((icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state20)))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state12) & (1'b0 == ap_block_state12_io))) begin
        m_axi_gmem_ARADDR = gmem_addr_1_reg_403;
    end else if (((m_axi_gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_gmem_ARADDR = gmem_addr_reg_378;
    end else begin
        m_axi_gmem_ARADDR = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state12) & (1'b0 == ap_block_state12_io)) | ((m_axi_gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        m_axi_gmem_ARVALID = 1'b1;
    end else begin
        m_axi_gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state20) & (1'b0 == ap_block_state20_pp0_stage19_iter0)) | ((1'b1 == ap_CS_fsm_state10) & (1'b0 == ap_block_state10_pp0_stage9_iter0)))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln34_fu_276_p2 == 1'd1) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        p_out_ap_vld = 1'b1;
    end else begin
        p_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln34_fu_276_p2 == 1'd1) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        shl_ln_out_ap_vld = 1'b1;
    end else begin
        shl_ln_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln34_fu_276_p2 == 1'd1) & (icmp_ln32_reg_394 == 1'd1) & (1'b1 == ap_CS_fsm_state21))) begin
        zext_ln32_out_ap_vld = 1'b1;
    end else begin
        zext_ln32_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (1'b0 == ap_block_state1_pp0_stage0_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((m_axi_gmem_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (1'b0 == ap_block_state10_pp0_stage9_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            if (((1'b1 == ap_CS_fsm_state12) & (1'b0 == ap_block_state12_io))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            if (((1'b1 == ap_CS_fsm_state20) & (1'b0 == ap_block_state20_pp0_stage19_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_state21;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln32_fu_214_p2 = ($signed(sext_ln32_2_fu_210_p1) + $signed(req));

assign add_ln34_fu_252_p2 = ($signed(sext_ln32_2_reg_373) + $signed(weight));

assign add_ln52_fu_280_p2 = ($signed(sext_ln32_reg_389) + $signed(4'd1));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

always @ (*) begin
    ap_block_state10_pp0_stage9_iter0 = (m_axi_gmem_RVALID == 1'b0);
end

always @ (*) begin
    ap_block_state12_io = ((m_axi_gmem_ARREADY == 1'b0) & (icmp_ln32_reg_394 == 1'd1));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

always @ (*) begin
    ap_block_state20_pp0_stage19_iter0 = ((m_axi_gmem_RVALID == 1'b0) & (icmp_ln32_reg_394 == 1'd1));
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage20;

assign ap_ready = ap_ready_sig;

assign counters_address0 = counters_address0_local;

assign counters_ce0 = counters_ce0_local;

assign counters_d0 = 32'd0;

assign counters_load_out = counters_load_reg_409;

assign counters_we0 = counters_we0_local;

assign current = ((tmp_fu_285_p3[0:0] == 1'b1) ? sub_ln52_fu_310_p2 : tmp_3_fu_316_p3);

assign icmp_ln32_fu_247_p2 = ((gmem_addr_read_reg_384 == 32'd1) ? 1'b1 : 1'b0);

assign icmp_ln34_fu_276_p2 = (($signed(counters_load_reg_409) < $signed(gmem_addr_1_read_reg_415)) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = 64'd1;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_AWADDR = 64'd0;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd0;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_AWVALID = 1'b0;

assign m_axi_gmem_BREADY = 1'b0;

assign m_axi_gmem_WDATA = 32'd0;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 4'd0;

assign m_axi_gmem_WUSER = 1'd0;

assign m_axi_gmem_WVALID = 1'b0;

assign p_and_t_fu_302_p3 = {{1'd0}, {xor_ln52_fu_297_p2}};

assign p_out = p_load_reg_355;

assign select_ln52_fu_324_p3 = ((tmp_fu_285_p3[0:0] == 1'b1) ? sub_ln52_fu_310_p2 : tmp_3_fu_316_p3);

assign sext_ln32_1_fu_230_p1 = $signed(trunc_ln1_fu_220_p4);

assign sext_ln32_2_fu_210_p1 = shl_ln_fu_202_p3;

assign sext_ln32_fu_240_p1 = p_load_reg_355;

assign sext_ln34_fu_266_p1 = $signed(trunc_ln2_fu_256_p4);

assign shl_ln_fu_202_p1 = ap_sig_allocacmp_p_load;

assign shl_ln_fu_202_p3 = {{shl_ln_fu_202_p1}, {2'd0}};

assign shl_ln_out = shl_ln_reg_368;

assign sub_ln52_fu_310_p2 = (3'd0 - p_and_t_fu_302_p3);

assign tmp_3_fu_316_p3 = {{1'd0}, {trunc_ln52_fu_293_p1}};

assign tmp_fu_285_p3 = add_ln52_fu_280_p2[32'd3];

assign trunc_ln1_fu_220_p4 = {{add_ln32_fu_214_p2[63:2]}};

assign trunc_ln2_fu_256_p4 = {{add_ln34_fu_252_p2[63:2]}};

assign trunc_ln32_fu_198_p0 = ap_sig_allocacmp_p_load;

assign trunc_ln32_fu_198_p1 = trunc_ln32_fu_198_p0[1:0];

assign trunc_ln52_fu_293_p1 = add_ln52_fu_280_p2[1:0];

assign xor_ln52_fu_297_p2 = (trunc_ln32_reg_362 ^ 2'd3);

assign zext_ln32_fu_243_p1 = $unsigned(p_load_reg_355);

assign zext_ln32_out = trunc_ln32_reg_362;

always @ (posedge ap_clk) begin
    shl_ln_reg_368[1:0] <= 2'b00;
    sext_ln32_2_reg_373[1:0] <= 2'b00;
end

endmodule //weighted_rr_Block_entry_split_proc_Pipeline_VITIS_LOOP_29_2
