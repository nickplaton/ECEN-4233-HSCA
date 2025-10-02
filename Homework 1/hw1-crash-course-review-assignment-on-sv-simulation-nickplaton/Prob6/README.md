# Problem 6

## Gray Code Counter with UP/DOWN and LOAD

*Modify the previous problem to add a LOAD option. A LOAD option loads a value to the counter where to start from.*

To run in GUI, use
> vsim -do prob6.do

To run without GUI, use
> vsim -do prob6.do -c

Both will output results to `prob6.out` in the format:
*up load_en load_value || count golden_count || (count == golden_count)*
