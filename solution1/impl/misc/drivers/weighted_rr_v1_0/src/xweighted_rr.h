// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XWEIGHTED_RR_H
#define XWEIGHTED_RR_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xweighted_rr_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XWeighted_rr_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XWeighted_rr;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XWeighted_rr_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XWeighted_rr_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XWeighted_rr_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XWeighted_rr_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XWeighted_rr_Initialize(XWeighted_rr *InstancePtr, UINTPTR BaseAddress);
XWeighted_rr_Config* XWeighted_rr_LookupConfig(UINTPTR BaseAddress);
#else
int XWeighted_rr_Initialize(XWeighted_rr *InstancePtr, u16 DeviceId);
XWeighted_rr_Config* XWeighted_rr_LookupConfig(u16 DeviceId);
#endif
int XWeighted_rr_CfgInitialize(XWeighted_rr *InstancePtr, XWeighted_rr_Config *ConfigPtr);
#else
int XWeighted_rr_Initialize(XWeighted_rr *InstancePtr, const char* InstanceName);
int XWeighted_rr_Release(XWeighted_rr *InstancePtr);
#endif

void XWeighted_rr_Start(XWeighted_rr *InstancePtr);
u32 XWeighted_rr_IsDone(XWeighted_rr *InstancePtr);
u32 XWeighted_rr_IsIdle(XWeighted_rr *InstancePtr);
u32 XWeighted_rr_IsReady(XWeighted_rr *InstancePtr);
void XWeighted_rr_EnableAutoRestart(XWeighted_rr *InstancePtr);
void XWeighted_rr_DisableAutoRestart(XWeighted_rr *InstancePtr);

void XWeighted_rr_Set_req(XWeighted_rr *InstancePtr, u64 Data);
u64 XWeighted_rr_Get_req(XWeighted_rr *InstancePtr);
void XWeighted_rr_Set_weight(XWeighted_rr *InstancePtr, u64 Data);
u64 XWeighted_rr_Get_weight(XWeighted_rr *InstancePtr);
void XWeighted_rr_Set_grant(XWeighted_rr *InstancePtr, u64 Data);
u64 XWeighted_rr_Get_grant(XWeighted_rr *InstancePtr);
void XWeighted_rr_Set_reset(XWeighted_rr *InstancePtr, u32 Data);
u32 XWeighted_rr_Get_reset(XWeighted_rr *InstancePtr);

void XWeighted_rr_InterruptGlobalEnable(XWeighted_rr *InstancePtr);
void XWeighted_rr_InterruptGlobalDisable(XWeighted_rr *InstancePtr);
void XWeighted_rr_InterruptEnable(XWeighted_rr *InstancePtr, u32 Mask);
void XWeighted_rr_InterruptDisable(XWeighted_rr *InstancePtr, u32 Mask);
void XWeighted_rr_InterruptClear(XWeighted_rr *InstancePtr, u32 Mask);
u32 XWeighted_rr_InterruptGetEnabled(XWeighted_rr *InstancePtr);
u32 XWeighted_rr_InterruptGetStatus(XWeighted_rr *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
