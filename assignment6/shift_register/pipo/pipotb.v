`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 00:52:01
// Design Name: 
// Module Name: pipotb
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


module pipotb();

parameter  p =10;
reg clk , reset;
reg [3:0]din;
wire [3:0]q;
integer i;

pipo pipo(clk , reset , din , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
reset = 1;
din = 0;
#(1*p);
reset = 0;
din = 4'hf;
#(1*p);

for(i = 0 ; i<30  ; i =i+1) begin
    din = $random %16;
    #(1*p);
end

#(2*p);
$finish;
end


endmodule
