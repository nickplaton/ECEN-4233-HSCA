# Problem 4

## Gray Code Counter

*Gray codes have a useful property in that consecutive numbers differ in only a single bit position. Design a 3-bit modulo 8 Gray code counter FSM with no inputs and three outputs. (A modulo N counter counts from 0 to N − 1, then repeats. For example, a watch uses a modulo 60 counter for the minutes and seconds that counts from 0 to 59.) When reset, the output should be 000. On each clock edge, the output should advance to the next Gray code. After reaching 100, it should repeat with 000.*

To run in GUI, use
> vsim -do prob4.do

To run without GUI, use
> vsim -do prob4.do -c

Both will output results to `prob4.out` in the format:
*count golden_count || (count == golden_count)*
