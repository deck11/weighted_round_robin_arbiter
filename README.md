# weighted_round_robin_arbiter

Weighted Round Robin (WRR) is a scheduling algorithm commonly used for data flows in networking, but it can also be applied to process scheduling.

As a generalization of round-robin scheduling, WRR manages a set of queues or tasks by allocating a specified number of service opportunities to each, based on a predefined weight. Unlike traditional round-robin, which provides one service opportunity per cycle for each task, WRR adjusts the frequency of service based on the assigned weights, ensuring that tasks or queues receive a portion of resources proportional to their weight.

In this project, I will be designing a ***4bit weighted round robin arbiter*** using ***Vitis hls*** tool.
This below diagram shows the wokring of the WRRA that I will be implementing.
![image](https://github.com/user-attachments/assets/77a1c5ab-9ce6-4533-842c-8b3d38c9a78c)

The weights determine the number of cycles each process is given access to the bus. 

