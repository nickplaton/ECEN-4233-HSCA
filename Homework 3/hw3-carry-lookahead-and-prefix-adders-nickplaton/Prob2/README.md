# Problem 2

## Carry-Lookahead Adder with BLCG 4

*Using SystemVerilog, design a 64-bit carry-lookahead adder by dividing and conquering (i.e., Block Carry Lookahead Generation) and r = 4. Make sure you adequately test your design with a self- validating testbench. You should also have a README.md that tells me what files to run and any output that is relevant.*

To run in GUI, use
> vsim -do prob2.do

To run without GUI, use
> vsim -do prob2.do -c

Both will output results to `prob2.out` in the format:
*A B Cin || Cout Sum Golden || is_correct*
