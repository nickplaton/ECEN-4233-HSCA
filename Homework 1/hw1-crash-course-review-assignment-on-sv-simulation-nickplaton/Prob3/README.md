# Problem 3

## Basic FSM

*Write an HDL module for the Finte State Machine (FSM) with the state transition diagram given in Figure 1. Please make sure you adequately test this design include its reset. FSMs are notoriously difficult to verify, so you should write your testbench to adequately test your FSM and demonstrate that is indeed traversing states correctly.*

To run in GUI, use
> vsim -do prob3.do

To run without GUI, use
> vsim -do prob3.do -c

Both will output results to `prob3.out` in the format:
*A B reset || y golden || y==golden*
