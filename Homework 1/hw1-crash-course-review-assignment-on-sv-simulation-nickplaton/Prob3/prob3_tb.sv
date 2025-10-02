`timescale 1ns / 1ps

module prob3_tb ();

    logic     a;
    logic     b;
    logic     y;
    logic   clk;
    logic reset;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [3:0] testvectors[14:0];
    logic golden_y;

    integer handle3;
    integer desc3;

    // instantiate device under test
    FSM dut (clk, reset, a, b, y);

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
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {a, b, reset, golden_y} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if (y != golden_y)
                errors = errors + 1;
            $fdisplay(desc3, "A:%h B:%h reset:%h || y:%h golden:%h || %b", a, b, reset, y, golden_y, (y == golden_y));
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 4'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule