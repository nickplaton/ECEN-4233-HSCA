`timescale 1ns / 1ps

module prob3_tb ();

    logic [63:0]             a, b;
    logic [63:0] Sum_cla, Sum_rca;
    logic      cout_cla, cout_rca;
    logic                     clk;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [192:0] testvectors[49:0];
    logic [64:0] golden_sum;

    integer handle3;
    integer desc3;

    // instantiate device under test
    cla64 cla_dut (.a(a), .b(b), .cin(1'b0), .Sum(Sum_cla), .cout(cout_cla));
    rca64 rca_dut (.a(a), .b(b), .cin(1'b0), .Sum(Sum_rca), .cout(cout_rca));

    // 2 ns clock
    initial
        begin
            clk = 1'b1;
            forever #10 clk = ~clk;
        end

    initial
        begin
            handle3 = $fopen("prob3.out", "w");
            $readmemb("testvectors.tv", testvectors);
            vectornum = 0;
            errors = 0;
            desc3 = handle3;
            $fdisplay(
                desc3,
                "       a:               b:          co     rca sum:       co     cla sum:             golden:       correct"
            );
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {a, b, golden_sum} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if ({cout_cla, Sum_cla} != golden_sum)
                errors = errors + 1;
            if ({cout_rca, Sum_rca} != golden_sum)
                errors = errors + 1;
            $fdisplay(
                desc3,
                "%h %h || %h %h || %h %h || %h || %h %h",
                a, b,
                cout_cla, Sum_cla,
                cout_rca, Sum_rca,
                golden_sum,
                ({cout_cla, Sum_cla} == golden_sum),
                ({cout_rca, Sum_rca} == golden_sum)
            );
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 193'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule