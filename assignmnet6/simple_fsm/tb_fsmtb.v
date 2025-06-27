`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 19:14:43
// Design Name: 
// Module Name: fsmtb
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


module fsmtb();

parameter p =4;
reg clk;
reg reset;
reg in;
wire out_moore , out_mealy;
integer i;

mofsm moore_fsm(clk , reset , in , out_moore);
mefsm mealy_fsm(clk , reset , in , out_mealy);

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
    reset = 1;
    #1;
    reset = 0;
    for(i = 0; i <32 ; i = i+1) begin
        in = $random %2;
        #p;
    end
    $finish;
end


endmodule
