`timescale 1ns / 1ps

module prob1_tb ();

    logic [63:0] a;
    logic [63:0] b;
    logic [127:0] Z_us;
    logic [127:0] Z_tc;
    logic   clk;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [383:0] testvectors[49:0];
    logic [127:0] golden_us;
    logic [127:0] golden_tc;

    integer handle3;
    integer desc3;

    // instantiate device under test
    multiplier dut (a, b, Z_us, Z_tc);

    // 2 ns clock
    initial
        begin
            clk = 1'b1;
            forever #10 clk = ~clk;
        end

    initial
        begin
            handle3 = $fopen("prob1.out", "w");
            $readmemh("testvectors.tv", testvectors);
            vectornum = 0;
            errors = 0;
            desc3 = handle3;
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {a, b, golden_us, golden_tc} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if (Z_us != golden_us | Z_tc != golden_tc)
                errors = errors + 1;
            $fdisplay(desc3, "%h %h || %h %h || %b %b", Z_us, Z_tc, golden_us, golden_tc, (Z_us == golden_us), (Z_tc == golden_tc));
            vectornum = vectornum + 1;
            if (testvectors[vectornum] == 383'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule