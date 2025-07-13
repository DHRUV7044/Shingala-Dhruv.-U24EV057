`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 00:35:03
// Design Name: 
// Module Name: sisotb
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


module sisotb();

parameter  p =10;
reg clk , reset;
reg din;
wire q;
integer i;

siso siso(clk , reset , din , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
reset = 1;
din = 0;
#(1*p);
reset = 0;
din = 1;
#(1*p);

for(i = 0 ; i<30  ; i =i+1) begin
    din = $random %2;
    #(1*p);
end

#(6*p);
$finish;
end

endmodule
