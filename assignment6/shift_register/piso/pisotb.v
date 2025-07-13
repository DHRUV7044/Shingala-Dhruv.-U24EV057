`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 15:05:57
// Design Name: 
// Module Name: pisotb
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


module pisotb( );

parameter p =10;
reg clk , reset , load;
reg [3:0] din;
wire q;
integer i;

piso piso(clk , reset , load , din , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
i = 1;
reset = 1;
load = 0;
din = 0;
#p;
reset = 0;
load = 1;
din = 4'b1101;
#p;
load = 0;
#(5*p);

for(i = 0; i <16 ; i = i+1)begin
    load = 1;
    din = i;
    #p;
    load = 0;
    #(5*p);
end

$finish;
end

endmodule
