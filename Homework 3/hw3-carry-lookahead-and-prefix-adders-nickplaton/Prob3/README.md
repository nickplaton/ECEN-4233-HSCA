# Problem 3

## Ripple-Carry Adder vs. Carry-Lookahead Adder

*Design two adders: a 64-bit ripple-carry adder and a 64-bit carry-lookahead adder with 4-bit blocks. Use only two-input gates. You can assume each gate has 15 μm2 of area, has a 50 ps delay, and has 20 fF of total gate capacitance. You may assume that the static power is negligible.*

This was meant to be done on paper, but I figured it would be easy enought to implement in SystemVerilog and make a good entry for this repository. In the testbench, the adders take in 0 as the carry-in because I misinterpreted "two-input gates", but as standalone modules, they work as normal.

To run in GUI, use
> vsim -do prob3.do

To run without GUI, use
> vsim -do prob3.do -c

Both will output results to `prob2.out` in the format:
*A B || RCA: Carry-Out Sum || CLA: Carry-Out Sum || Golden || rca_correct cla_correct*
