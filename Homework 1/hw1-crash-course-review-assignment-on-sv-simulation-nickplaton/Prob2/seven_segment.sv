module seven_segment (input logic [3:0] a, output logic [6:0] S);

    always_comb begin
        case(a)
        //  Input            GFEDCBA
            4'b0000 : S = 7'b0111111;
            4'b0001 : S = 7'b0000110;
            4'b0010 : S = 7'b1011011;
            4'b0011 : S = 7'b1001111;
            4'b0100 : S = 7'b1100110;
            4'b0101 : S = 7'b1101101;
            4'b0110 : S = 7'b1111101;
            4'b0111 : S = 7'b0000111;
            4'b1000 : S = 7'b1111111;
            4'b1001 : S = 7'b1101111;
            4'b1010 : S = 7'b1110111;
            4'b1011 : S = 7'b1111100;
            4'b1100 : S = 7'b0111001;
            4'b1101 : S = 7'b1011110;
            4'b1110 : S = 7'b1111001;
            4'b1111 : S = 7'b1110001;
            default : S = 7'b1001001;
        endcase
    end

endmodule