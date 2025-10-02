module gray (input logic clk, output logic [2:0] count);

    logic [2:0] next;

    // state register
    always_ff @(posedge clk) begin
        count <= next;
    end
    // next state logic
    always_comb begin
        case (count)
            3'b000: next <= 3'b001;
            3'b001: next <= 3'b011;
            3'b011: next <= 3'b010;
            3'b010: next <= 3'b110;
            3'b110: next <= 3'b111;
            3'b111: next <= 3'b101;
            3'b101: next <= 3'b100;
            3'b100: next <= 3'b000;
            default: next <= 3'b000;
        endcase
    end
    

endmodule