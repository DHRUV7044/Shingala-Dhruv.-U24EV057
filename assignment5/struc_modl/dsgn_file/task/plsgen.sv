`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 15:45:56
// Design Name: 
// Module Name: plsgen
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


module plsgen(
    input clk,
    input reset,
    input b,
    output p
    );
    reg [1:0] q ,t;
    wire w1 , w2;
    
    or(w1 , q[0] , b);
    and(t[0] , ~q[1] , w1);
    
    and(w2 , q[1] , ~b);
    or(t[1] , q[0] , w2);
    
    tff t0(clk , reset , t[0] , q[0]);
    tff t1(clk , reset , t[1] , q[1]);
    
    and(p , ~q[1] , q[0]);
endmodule
