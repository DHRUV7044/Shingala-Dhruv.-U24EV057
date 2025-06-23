`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 10:02:39
// Design Name: 
// Module Name: rico
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


module rico(
    input clk,
    input reset,
    input preset,
    output [3:0] q
    );
    
    dff d1(clk , reset , q[3]|preset , q[0]);
    dff d2(clk , reset , q[0], q[1]);
    dff d3(clk , reset , q[1], q[2]);
    dff d4(clk , reset , q[2], q[3]);
    
endmodule
