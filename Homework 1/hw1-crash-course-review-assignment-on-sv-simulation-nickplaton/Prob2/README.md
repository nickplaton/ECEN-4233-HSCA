# Problem 2

## Seven-Segment Display Decoder

*Write an HDL module for a hexadecimal seven-segment display decoder. The decoder should handle the digits A, B, C, D, E, and F, as well as 0–9. Also, your write a self-checking testbench for this problem. Create a test vector file containing all 16 test cases. Simulate the circuit and show that it works. Introduce an error in the test vector file and show that the testbench reports a mismatch.*

To run in GUI, use
> vsim -do prob2.do

To run without GUI, use
> vsim -do prob2.do -c

Both will output results to `prob2.out` in the format:
*Input S~g-a~ || Golden_S~g-a~ || Is_Equal?*
followed by a beautiful ascii art seven-segment number
