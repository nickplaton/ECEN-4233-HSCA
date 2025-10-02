module FSM (input logic clk, reset, a, b, output logic y);

    typedef enum logic [1:0] {S0, S1, S2} statetype;
    statetype state, nextstate;

    // state register
    always_ff @(posedge clk, posedge reset) begin
        if (reset) state <= S0;
        else       state <= nextstate;
    end

    // next state logic
    always_comb begin
        case (state)
            S0: begin
                if (a) begin
                    y <= 1'b0;
                    nextstate <= S1;
                end
                if (~a) begin
                    y <= 1'b0;
                    nextstate <= S0;
                end
            end
            S1: begin
                if (b) begin
                    y <= 1'b0;
                    nextstate <= S2;
                end
                if (~b) begin
                    y <= 1'b0;
                    nextstate <= S0;
                end
            end
            S2: begin
                if (a & b) begin
                    y <= 1'b1;
                    nextstate <= S2;
                end
                if (~a | ~b) begin
                    y <= 0;
                    nextstate <= S0;
                end
            end
            default: begin
                y <= 1'b0;
                nextstate <= S0;
            end
        endcase
    end
    

endmodule