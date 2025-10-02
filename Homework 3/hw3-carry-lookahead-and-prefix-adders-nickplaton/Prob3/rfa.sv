module rfa (g, p, Sum, A, B, Cin);

   input logic A;
   input logic B;
   input logic Cin;

   output logic g;
   output logic p;
   output logic Sum;

   assign Sum = A ^ B ^ Cin;
   assign g = A & B;
   assign p = A | B;
   
endmodule // rfa
