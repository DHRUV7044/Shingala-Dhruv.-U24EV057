`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 01:10:45
// Design Name: 
// Module Name: sipotb
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


module sipotb();

parameter  p =10;
reg clk , reset;
reg din;
wire [3:0]q;
integer i;

sipo sipo(clk , reset , din , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
reset = 1;
din = 0;
#(1*p);
reset = 0;
din = 1'b1;
#(1*p);

for(i = 0 ; i<30  ; i =i+1) begin
    din = $random %2;
    #(1*p);
end

#(2*p);
$finish;
end

endmodule
