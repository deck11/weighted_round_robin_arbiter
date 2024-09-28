# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
# Tool Version Limit: 2024.05
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
cmake_minimum_required(VERSION 3.15)
project(weighted_rr)
find_package(common)
collector_create (PROJECT_LIB_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_SOURCES xweighted_rr.c)
collect (PROJECT_LIB_SOURCES xweighted_rr_sinit.c)
collect (PROJECT_LIB_SOURCES xweighted_rr_linux.c)
collect (PROJECT_LIB_SOURCES xweighted_rr_g.c)
collector_list (_sources PROJECT_LIB_SOURCES)
collector_create (PROJECT_LIB_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_HEADERS xweighted_rr.h)
collect (PROJECT_LIB_HEADERS xweighted_rr_hw.h)
collector_list (_headers PROJECT_LIB_HEADERS)
file(COPY ${_headers} DESTINATION ${CMAKE_BINARY_DIR}/include)
include_directories(${CMAKE_BINARY_DIR}/include)
add_library(weighted_rr STATIC ${_sources})
set_target_properties(weighted_rr PROPERTIES LINKER_LANGUAGE C)

