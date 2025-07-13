`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 11:50:37
// Design Name: 
// Module Name: unishrtb
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


module unishrtb();

parameter p =10;
reg clk , reset;
reg [1:0] sel;
reg [3:0] d_paraller;
reg d_series;
wire [3:0] q;  //paraller output
integer i;

unishr universal_shift_register(clk , reset , sel , d_paraller , d_series , q);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
reset =1;
sel = 0;
d_paraller = 0;
d_series = 0;
i = 0;
#p;
reset = 0;

for(i = 0 ; i <10 ; i = i+1) begin
    sel = 2'b01;
    d_paraller = i;
    #p;
    sel = 2'b10 ;
    #(5*p);
end

for(i = 0 ; i <10 ; i = i+1) begin
    sel = 2'b01;
    d_paraller = i;
    #p;
    sel = 2'b11;
    #(5*p);
end

for(i = 0 ; i <10 ; i = i+1) begin
    sel = 2'b01;
    d_paraller = i;
    #p;
    sel = 2'b00;
    #p;
    sel = 2'b11;
    d_series = 1;
    #(3*p);
end

$finish;
end

endmodule
