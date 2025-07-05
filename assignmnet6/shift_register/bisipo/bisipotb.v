`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 22:31:24
// Design Name: 
// Module Name: bisipotb
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


module bisipotb( );

parameter p = 10;
reg clk , reset , left;
reg  din;
wire [3:0] q;
integer i;

bisipo bidirectional_sipo(clk , reset , left , din , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin 
reset = 1;
left = 0;
din = 0;
i = 0;
#p;
reset = 0;
din = 1;
#(2*p);
left = 1;
#p;
left = 0;
#p;
left = 1;
#p;

for(i = 0; i<32 ; i = i+1) begin
    din = $random%2;
    left = $random%2;
    #(2*p);
end

din =0;
left = 0;
#p;
$finish;
end

endmodule
