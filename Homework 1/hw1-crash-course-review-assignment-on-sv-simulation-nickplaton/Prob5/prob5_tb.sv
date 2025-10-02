`timescale 1ns / 1ps

module prob5_tb ();

    logic          up;
    logic [2:0] count;
    logic         clk;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [3:0] testvectors[24:0];
    logic [2:0] golden_count;

    integer handle3;
    integer desc3;

    // instantiate device under test
    gray_ud dut (clk, up, count);

    // 2 ns clock
    initial
        begin
            clk = 1'b1;
            forever #10 clk = ~clk;
        end

    initial
        begin
            handle3 = $fopen("prob5.out", "w");
            $readmemb("testvectors.tv", testvectors);
            vectornum = 0;
            errors = 0;
            desc3 = handle3;
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {up, golden_count} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if (count != golden_count)
                errors = errors + 1;
            $fdisplay(desc3, "%b %b %b || %b", up, count, golden_count, (count == golden_count));
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 4'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule