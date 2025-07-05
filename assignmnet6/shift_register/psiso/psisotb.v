`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 21:16:51
// Design Name: 
// Module Name: psisotb
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


module psisotb( );

parameter p = 10;
reg clk , reset , load;
reg shift_bit;
reg [3:0] din;
wire q;
integer i;

psiso psiso(clk , reset , load , din , shift_bit , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
i = 0;
reset = 1;
load = 0;
din = 0;
shift_bit = 0;
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
    shift_bit = $random%2;
    #(5*p);
end

for(i = 0; i <32 ;i = i+1 ) begin
    load = 0;
    shift_bit = $random%2;
    #p;
end

$finish;
end


endmodule
