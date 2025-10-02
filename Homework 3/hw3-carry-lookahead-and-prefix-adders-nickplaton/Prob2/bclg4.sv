module bclg4 #(COUT_WIDTH = 3) (input logic [3:0] gin, pin, logic cin, output logic gout, pout, logic [COUT_WIDTH:1] cout);

    assign cout[1] = gin[0] | pin[0] & cin;
    assign cout[2] = gin[1] | pin[1] & gin[0] | pin[1] & pin[0] & cin;
    assign cout[3] = gin[2] | pin[2] & gin[1] | pin[2] & pin[1] & gin[0] | pin[2] & pin[1] & pin[0] & cin;
    generate
        if (COUT_WIDTH == 4) begin
            assign cout[4] = gin[3] | pin[3] & gin[2] | pin[3] & pin[2] & gin[1] | pin[3] & pin[2] & pin[1] & gin[0] | pin[3] & pin[2] & pin[1] & pin[0] & cin;
        end
    endgenerate
    assign gout    = gin[3] | pin[3] & gin[2] | pin[3] & pin[2] & gin[1] | pin[3] & pin[2] & pin[1] & gin[0];
    assign pout    = pin[3] & pin[2] & pin[1] & pin[0];

endmodule