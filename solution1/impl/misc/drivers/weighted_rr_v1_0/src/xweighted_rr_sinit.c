// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xweighted_rr.h"

extern XWeighted_rr_Config XWeighted_rr_ConfigTable[];

#ifdef SDT
XWeighted_rr_Config *XWeighted_rr_LookupConfig(UINTPTR BaseAddress) {
	XWeighted_rr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XWeighted_rr_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XWeighted_rr_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XWeighted_rr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XWeighted_rr_Initialize(XWeighted_rr *InstancePtr, UINTPTR BaseAddress) {
	XWeighted_rr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XWeighted_rr_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XWeighted_rr_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XWeighted_rr_Config *XWeighted_rr_LookupConfig(u16 DeviceId) {
	XWeighted_rr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XWEIGHTED_RR_NUM_INSTANCES; Index++) {
		if (XWeighted_rr_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XWeighted_rr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XWeighted_rr_Initialize(XWeighted_rr *InstancePtr, u16 DeviceId) {
	XWeighted_rr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XWeighted_rr_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XWeighted_rr_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

