`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 11:45:48
// Design Name: 
// Module Name: seq110tb
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


module seq110tb();
parameter p =4;

reg clk , reset , in;
wire out_non_over_lapping , out_over_lapping;
integer i;
reg [31:0] ip = 32'b10110111011010101110110100101101;

dect110 seqdetnol(clk , reset , in , out_non_over_lapping);
dect110ovrlap seqdetol(clk , reset , in , out_over_lapping);

initial begin
clk =0;
forever #(p/2)  clk = ~clk;
end

initial begin 
reset = 1;
in = 0;
#p;
reset = 0;
#1;
for(i = 0; i < 32 ; i = i+1) begin
in = ip[31-i];
#p;
end
#(10*p);

$finish;
end

endmodule
