############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project weighted_round_robin
set_top weighted_rr
add_files weighted_round_robin/wrr.c
add_files -tb weighted_round_robin/wrr_tb.c
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_cosim -tool xsim
source "./weighted_round_robin/solution1/directives.tcl"
csim_design -clean -setup
csynth_design
cosim_design
export_design -format ip_catalog

