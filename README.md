# weighted_round_robin_arbiter

Weighted Round Robin (WRR) is a scheduling algorithm commonly used for data flows in networking, but it can also be applied to process scheduling.

As a generalization of round-robin scheduling, WRR manages a set of queues or tasks by allocating a specified number of service opportunities to each, based on a predefined weight. Unlike traditional round-robin, which provides one service opportunity per cycle for each task, WRR adjusts the frequency of service based on the assigned weights, ensuring that tasks or queues receive a portion of resources proportional to their weight.

In this project, I will be designing a ***4bit weighted round robin arbiter*** using ***Vitis hls*** tool.
This below diagram shows the working of the WRRA that I will be implementing.

![image](https://github.com/user-attachments/assets/77a1c5ab-9ce6-4533-842c-8b3d38c9a78c)


The weights determine the number of cycles each process is given access to the bus. 

## Pragmas

In ```wrr.c``` I have used pragmas. A few of them are:
1.```#pragma HLS INTERFACE m_axi port=req offset=slave
	#pragma HLS INTERFACE m_axi port=weight offset=slave
	#pragma HLS INTERFACE m_axi port=grant offset=slave```
Implements the port as an AXI4 interface.

2.```#pragma HLS INTERFACE s_axilite port=reset
	#pragma HLS INTERFACE s_axilite port=return```
Implements the port as an AXI4-Lite interface. The tool produces an associated set of C driver files when exporting the generated RT for the HLS component.

3.```#pragma HLS DATAFLOW```
The DATAFLOW pragma enables task-level pipelining, allowing functions and loops to overlap in their operation, increasing the concurrency of the RTL implementation and increasing the overall throughput of the design.

4.```#pragma HLS RESOURCE variable=counters core=RAM_1P_BRAM```
This pragma instructs the HLS compiler to implement the counters array using FPGA BRAM to optimize memory usage, rather than implementing it using LUTs or distributed memory.

5.```#pragma HLS unroll factor=4```
The UNROLL pragma transforms loops by creating multiples copies of the loop body in the RTL design, which allows some or all loop iterations to occur in parallel.

6.```#pragma HLS LOOP_TRIPCOUNT min=1 max=4```
When manually applied to a loop, specifies the total number of iterations performed by a loop.

## Outputs:
After running co simulation, the output observed is:
![image](https://github.com/user-attachments/assets/e491920e-5f3e-4a81-9b68-d260837647cd)

After running synthesis, the summary observed is:
![image](https://github.com/user-attachments/assets/22dab91e-0d69-4a30-a2e5-ae156371deba)
Clock period = 10 ns
No setup or hold violations observed
