`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2025 15:04:19
// Design Name: 
// Module Name: debounce
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


module debounce(D1,clk,out);
input D1,clk;
wire Q1,Q2,Q_2;
output out;
d_ff d1(.D(D1),.clk(clk),.outs(Q1));
d_ff d2(.D(Q1),.clk(clk),.outs(Q2));
assign Q_2=~Q2;
assign out=Q1&(~Q_2);
endmodule
