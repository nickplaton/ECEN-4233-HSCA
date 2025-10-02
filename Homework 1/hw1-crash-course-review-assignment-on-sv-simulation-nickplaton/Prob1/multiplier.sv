module multiplier (input logic [63:0] a, b, output logic [127:0] Z_us, Z_tc);

    assign Z_us = a * b;
    assign Z_tc = $signed(a) * $signed(b);

endmodule