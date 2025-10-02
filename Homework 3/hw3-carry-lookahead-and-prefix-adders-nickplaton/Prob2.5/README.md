# Problem 2(.5)

## Not sure of the type of adder

*This is a wrong answer I made while working on Problem 2. The adder works, but I think it functions the same as an RCA, thus not actually meeting the requirements. On the off-chance that it was worth something, I kept it. The testbench should work, but output is not formatted correctly.*

To run in GUI, use
> vsim -do prob2.do

To run without GUI, use
> vsim -do prob2.do -c

Both will output results to `prob2.out` in the format:
*A B Cin || Cout Sum Golden || is_correct*
