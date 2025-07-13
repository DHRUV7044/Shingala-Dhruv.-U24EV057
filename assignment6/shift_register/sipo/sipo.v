`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 01:08:52
// Design Name: 
// Module Name: sipo
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

//MSB enter first
module sipo(
    input clk,
    input reset,
    input din,
    output [3:0] q
    );
    
    dff df1(clk , reset , din , q[0]);
    dff df2(clk , reset , q[0] , q[1]);
    dff df3(clk , reset , q[1] , q[2]);
    dff df4(clk , reset , q[2] , q[3]);
    
endmodule
