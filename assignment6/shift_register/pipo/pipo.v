`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 00:49:19
// Design Name: 
// Module Name: pipo
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


module pipo(
    input clk,
    input reset,
    input [3:0] din,
    output [3:0] q
    );
    
    dff df1(clk , reset , din[0] , q[0]);
    dff df2(clk , reset , din[1] , q[1]);
    dff df3(clk , reset , din[2] , q[2]);
    dff df4(clk , reset , din[3] , q[3]);
endmodule
