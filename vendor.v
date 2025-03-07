`timescale 1ns / 1ps

module vendor(
    input clk, reset, coin_1, coin_2,
    output reg dispense, change
);
    reg [1:0] state, next_state, prev_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    
    wire coin_1_db, coin_2_db,reset_db;
    
    // Debounce modules for push-button inputs
    debounce db1 (.clk(clk), .D1(coin_1), .out(coin_1_db));
    debounce db2 (.clk(clk), .D1(coin_2), .out(coin_2_db));
    debounce db3 (.clk(clk), .D1(reset), .out(reset_db));
    always @(posedge clk or posedge reset_db)
    begin
        if (reset_db)
            state <= S0;
        else begin
            prev_state <= state;
            state <= next_state;
        end
    end
    
    always @(*)
    begin
        case (state)
            S0: next_state = (coin_1_db) ? S1 : ((coin_2_db) ? S2 : S0);
            S1: next_state = (coin_1_db) ? S2 : ((coin_2_db) ? S3 : S1);
            S2: next_state = (coin_1_db) ? S3 : ((coin_2_db) ? S3 : S2);
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end
    
    always @(*)
    begin
        case (state)
            S0: begin dispense = 0; change = 0; end
            S1: begin dispense = 0; change = 0; end
            S2: begin dispense = 0; change = 0; end
            S3: begin 
                dispense = 1;
                change = (prev_state == S2 && coin_2_db) ? 1 : 0;
            end
            default: begin dispense = 0; change = 0; end
        endcase
    end
endmodule





