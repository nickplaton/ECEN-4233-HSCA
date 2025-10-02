# Problem 5

## Gray Code Counter with UP/DOWN

*Extend your modulo 8 Gray code counter from the previous problem to be an UP/DOWN counter by adding an UP input. If UP = 1, the counter advances to the next number. If UP = 0, the counter retreats to the previous number.*

To run in GUI, use
> vsim -do prob5.do

To run without GUI, use
> vsim -do prob5.do -c

Both will output results to `prob5.out` in the format:
*up count golden_count || (count == golden_count)*
