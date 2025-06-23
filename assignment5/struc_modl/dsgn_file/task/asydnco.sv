`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 10:26:08
// Design Name: 
// Module Name: asydnco
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


module asydnco(
    input clk,
    input reset ,
    output [2:0] q
    );
    reg rstclk;
    reg [2:0] cl , ce;
    and(rstclk , clk , reset);
    
    and(cl[0] , clk , ~reset);
    and(cl[1] , q[0] , ~reset);
    and(cl[2] , q[1] , ~reset);
    
    or(ce[0] , cl[0] , rstclk);
    or(ce[1] , cl[1] , rstclk);
    or(ce[2] , cl[2] , rstclk);
    tff t1(ce[0] , reset , 1 , q[0]);
    tff t2(ce[1] , reset , 1 , q[1]);
    tff t3(ce[2] , reset , 1 , q[2]);
endmodule
