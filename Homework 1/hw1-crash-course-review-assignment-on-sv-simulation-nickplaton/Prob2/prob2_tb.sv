`timescale 1ns / 1ps

module prob2_tb ();

    logic [3:0] a;
    logic [6:0] S;
    logic   clk;

    logic [5:0] vectornum;
    logic [5:0] errors;
    logic [11:0] testvectors[16:0];
    logic [6:0] golden_s;

    integer handle3;
    integer desc3;

    // instantiate device under test
    seven_segment dut (a, S);

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
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {a, golden_s} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if (S != golden_s)
                errors = errors + 1;
            $fdisplay(desc3, "%h %b || %b || %b", a, S, golden_s, (S == golden_s));
            //$fdisplay(desc3, " %b \n%b %b\n %b \n%b %b\n %b", S[0], S[5], S[1], S[6], S[4], S[2], S[3]); old formatting
            // Print into prob2.out s/t they appear as 7-segment numbers.
            // Visually inspired by Thomas Parsley's output; no idea as to what his actual code looked like.
            $fdisplay(desc3, "%-9s   %-9s", S[0]?"  ■ ■ ■  ":"",golden_s[0]?"  ■ ■ ■  ":"");
            $fdisplay(
                desc3,
                "%-1s       %-1s   %-1s       %-1s\n", S[5]?"■":"",S[1]?"■":"",golden_s[5]?"■":"",golden_s[1]?"■":"",
                "%-1s       %-1s   %-1s       %-1s\n", S[5]?"■":"",S[1]?"■":"",golden_s[5]?"■":"",golden_s[1]?"■":"",
                "%-1s       %-1s   %-1s       %-1s",   S[5]?"■":"",S[1]?"■":"",golden_s[5]?"■":"",golden_s[1]?"■":"",
            );
            $fdisplay(desc3, "%-9s   %-9s", S[6]?"  ■ ■ ■  ":"",golden_s[6]?"  ■ ■ ■  ":"");
            $fdisplay(
                desc3,
                "%-1s       %-1s   %-1s       %-1s\n", S[4]?"■":"",S[2]?"■":"",golden_s[4]?"■":"",golden_s[2]?"■":"",
                "%-1s       %-1s   %-1s       %-1s\n", S[4]?"■":"",S[2]?"■":"",golden_s[4]?"■":"",golden_s[2]?"■":"",
                "%-1s       %-1s   %-1s       %-1s",   S[4]?"■":"",S[2]?"■":"",golden_s[4]?"■":"",golden_s[2]?"■":"",
            );
            $fdisplay(desc3, "%-9s   %-9s", S[3]?"  ■ ■ ■  ":"",golden_s[3]?"  ■ ■ ■  ":"");
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 12'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule