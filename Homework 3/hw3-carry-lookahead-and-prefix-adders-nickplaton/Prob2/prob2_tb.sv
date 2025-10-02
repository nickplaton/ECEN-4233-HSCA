`timescale 1ns / 1ps

module prob2_tb ();

    logic [63:0] a, b, Sum;
    logic        cin, cout;
    logic              clk;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [193:0] testvectors[49:0];
    logic [64:0] golden_sum;

    integer handle3;
    integer desc3;

    // instantiate device under test
    cla64 dut (a, b, cin, Sum, cout);

    // 2 ns clock
    initial
        begin
            clk = 1'b1;
            forever #10 clk = ~clk;
        end

    initial
        begin
            handle3 = $fopen("prob2.out", "w");
            $readmemb("testvectors.tv", testvectors);
            vectornum = 0;
            errors = 0;
            desc3 = handle3;
            $fdisplay(
                desc3,
                "       a:               b:        ci  co       sum:           golden:       correct"
            );
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {a, b, cin, golden_sum} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if ({cout, Sum} != golden_sum)
                errors = errors + 1;
            $fdisplay(
                desc3,
                "%h %h %h || %h %h %h || %h",
                a,    b,   cin,
                cout, Sum, golden_sum,
                ({cout, Sum} == golden_sum)
            );
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 194'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule