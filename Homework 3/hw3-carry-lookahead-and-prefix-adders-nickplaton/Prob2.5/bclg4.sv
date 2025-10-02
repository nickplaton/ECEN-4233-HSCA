module bclg4 (input logic [3:0] gin, pin, logic cin, output logic gout, pout, logic [4:1] cout);

    assign cout[1] = gin[0] | pin[0] & cin;
    assign cout[2] = gin[1] | pin[1] & gin[0] | pin[1] & pin[0] & cin;
    assign cout[3] = gin[2] | pin[2] & gin[1] | pin[2] & pin[1] & gin[0] | pin[2] & pin[1] & pin[0] & cin;
    assign cout[4] = gin[3] | pin[3] & gin[2] | pin[3] & pin[2] & gin[1] | pin[3] & pin[2] & pin[1] & gin[0] | pin[3] & pin[2] & pin[1] & pin[0] & cin;
    assign gout    = gin[3] | pin[3] & gin[2] | pin[3] & pin[2] & gin[1] | pin[3] & pin[2] & pin[1] & gin[0];
    assign pout    = pin[3] & pin[2] & pin[1] & pin[0];

endmodule