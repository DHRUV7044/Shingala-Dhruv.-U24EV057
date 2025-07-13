`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 22:03:27
// Design Name: 
// Module Name: bisipo
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
////////////////////////////////////////////////////////////////////////////////


module bisipo(
    input clk,
    input reset,
    input left, //left==1 >shift_left  left==0 > shift_right
    input din,
    output [3:0] q
    ); 
    wire [3:0] d;
    
    m2 mux3(left , {q[2] , din} , d[3]);
    dff d3(clk , reset , d[3] , q[3]);
    
    m2 mux2(left , {q[1] , q[3]} , d[2]);
    dff d2(clk , reset , d[2] , q[2]);
    
    m2 mux1(left , {q[0] , q[2]} , d[1]);
    dff d1(clk , reset , d[1] , q[1]);
    
    m2 mux0(left , {din , q[1]} , d[0]);
    dff d0(clk , reset , d[0] , q[0]);
    
endmodule

