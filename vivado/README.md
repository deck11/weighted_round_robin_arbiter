# implementation of weighted round robin arbiter in vivado

The steps involved in generating bitstream and tcl files for implementation on hardware are:
1. Write Vitis HLS C code
2. Verify the working of the code using a testbench
3. Export RTL as IP
4. Import IP in Vivado
5. Generate Block desgin by integrating IP with IPs of Zynq processing system
6. Generate bitstream
7. Export block desgin as tcl file 

After this, upload the files generated on to the SD card. These are the few necessary steps for successful implementation on hardware.
