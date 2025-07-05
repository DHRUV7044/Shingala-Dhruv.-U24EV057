`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 00:30:52
// Design Name: 
// Module Name: siso
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
module siso(
    input clk,
    input reset,
    input din,
    output q
    );
    wire [2:0] qi;
    
    
    dff df1(clk , reset , din , qi[0]);
    dff df2(clk , reset , qi[0] , qi[1]);
    dff df3(clk , reset , qi[1] , qi[2]);
    dff df4(clk , reset , qi[2] , q);
    
endmodule
