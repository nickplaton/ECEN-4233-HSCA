module rca64 (input  logic [63:0] a, b, logic cin, output logic [63:0] Sum, logic cout);

    logic [63:0] c;
    assign c[0] = cin;
    fa adders[63:0] (a, b, c, Sum, {cout, c[63:1]});

endmodule
