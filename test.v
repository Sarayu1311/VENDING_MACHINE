`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2024 22:22:23
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module vendor_tb;
    reg clk, reset, coin_1, coin_2;
    wire dispense, change;
    
    vendor uut (
        .clk(clk),
        .reset(reset),
        .coin_1(coin_1),
        .coin_2(coin_2),
        .dispense(dispense),
        .change(change)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        coin_1 = 0;
        coin_2 = 0;
        
        #10 reset = 0;
        
        #10 coin_1 = 1; #10 coin_1 = 0;
        #20 coin_1 = 1; #10 coin_1 = 0;
        #20 coin_1 = 1; #10 coin_1 = 0;
        
        #20;
        
        reset = 1; #10 reset = 0;
        
        #10 coin_2 = 1; #10 coin_2 = 0;
        #20 coin_1 = 1; #10 coin_1 = 0;
        
        #20;
        
        reset = 1; #10 reset = 0;
        #10 coin_2 = 1; #10 coin_2 = 0;
        #20 coin_2 = 1; #10 coin_2 = 0;
        
        #100 $stop;
    end
endmodule


