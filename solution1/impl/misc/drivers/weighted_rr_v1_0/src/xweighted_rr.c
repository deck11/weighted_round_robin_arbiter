// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xweighted_rr.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XWeighted_rr_CfgInitialize(XWeighted_rr *InstancePtr, XWeighted_rr_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XWeighted_rr_Start(XWeighted_rr *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL) & 0x80;
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XWeighted_rr_IsDone(XWeighted_rr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XWeighted_rr_IsIdle(XWeighted_rr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XWeighted_rr_IsReady(XWeighted_rr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XWeighted_rr_EnableAutoRestart(XWeighted_rr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XWeighted_rr_DisableAutoRestart(XWeighted_rr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_AP_CTRL, 0);
}

void XWeighted_rr_Set_req(XWeighted_rr *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_REQ_DATA, (u32)(Data));
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_REQ_DATA + 4, (u32)(Data >> 32));
}

u64 XWeighted_rr_Get_req(XWeighted_rr *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_REQ_DATA);
    Data += (u64)XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_REQ_DATA + 4) << 32;
    return Data;
}

void XWeighted_rr_Set_weight(XWeighted_rr *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_WEIGHT_DATA, (u32)(Data));
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_WEIGHT_DATA + 4, (u32)(Data >> 32));
}

u64 XWeighted_rr_Get_weight(XWeighted_rr *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_WEIGHT_DATA);
    Data += (u64)XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_WEIGHT_DATA + 4) << 32;
    return Data;
}

void XWeighted_rr_Set_grant(XWeighted_rr *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GRANT_DATA, (u32)(Data));
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GRANT_DATA + 4, (u32)(Data >> 32));
}

u64 XWeighted_rr_Get_grant(XWeighted_rr *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GRANT_DATA);
    Data += (u64)XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GRANT_DATA + 4) << 32;
    return Data;
}

void XWeighted_rr_Set_reset(XWeighted_rr *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_RESET_DATA, Data);
}

u32 XWeighted_rr_Get_reset(XWeighted_rr *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_RESET_DATA);
    return Data;
}

void XWeighted_rr_InterruptGlobalEnable(XWeighted_rr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GIE, 1);
}

void XWeighted_rr_InterruptGlobalDisable(XWeighted_rr *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_GIE, 0);
}

void XWeighted_rr_InterruptEnable(XWeighted_rr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_IER);
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_IER, Register | Mask);
}

void XWeighted_rr_InterruptDisable(XWeighted_rr *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_IER);
    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_IER, Register & (~Mask));
}

void XWeighted_rr_InterruptClear(XWeighted_rr *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XWeighted_rr_WriteReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_ISR, Mask);
}

u32 XWeighted_rr_InterruptGetEnabled(XWeighted_rr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_IER);
}

u32 XWeighted_rr_InterruptGetStatus(XWeighted_rr *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XWeighted_rr_ReadReg(InstancePtr->Control_BaseAddress, XWEIGHTED_RR_CONTROL_ADDR_ISR);
}

