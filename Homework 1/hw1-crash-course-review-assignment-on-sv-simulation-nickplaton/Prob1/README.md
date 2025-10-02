# Problem 1

## Unsigned/Two's Complement Multiplication

*Z = A × B. You should treat both A and B as unsigned and two’s complement 64-bit values and use behavioral constructs to design your HDL. That is, it should output both unsigned and two’s complement results (i.e., 2 outputs). Make sure you adequately test your design with a testbench.*

To run in GUI, use
> vsim -do prob1.do

To run without GUI, use
> vsim -do prob1.do -c

Both will output results to `prob1.out` in the format:
*Z_us Z_tc || golden_us golden_tc || (Z_us == golden_us) (Z_tc == golden_tc)*

`generate_testvectors.py` generates the `testvectors.tv` file
