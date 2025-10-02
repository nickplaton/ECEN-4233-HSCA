module fa (input logic a, b, cin, output logic Sum, cout);

    assign Sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule