`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 11:30:47
// Design Name: 
// Module Name: syncdnco
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


module syncdnco(
    input clk,
    input reset,
    output [3:0] q
    );
    
    wire [3:0] t;
    and(t[0] , 1 ,1);
    and(t[1] , ~q[0] , 1);
    and(t[2] , ~q[0] , ~q[1]);
    and(t[3] , ~q[0] , ~q[1] , ~q[2]);
    
    tff t0(clk , reset , t[0] , q[0]);
    tff t1(clk , reset , t[1] , q[1]);
    tff t2(clk , reset , t[2] , q[2]);
    tff t3(clk , reset , t[3] , q[3]);
    
endmodule
