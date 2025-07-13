`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 22:03:27
// Design Name: 
// Module Name: unishr
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


module unishr(
    input clk , 
    input reset ,
    input [1:0] sel,
    input [3:0] d_par,
    input d_ser,
    output [3:0] q
    );
    //sel    ope
    //00    no change
    //01    paraller load
    //10    shift left
    //11    shift right
    
    wire [3:0] d;
    
    m4 mux3(sel , {d_ser , q[2] , d_par[3] ,q[3]} , d[3]);
    
    dff df3(clk , reset , d[3] , q[3]);
    
    m4 mux2(sel , {q[3] , q[1] , d_par[2] ,q[2]} , d[2]);
    
    dff df2(clk , reset , d[2] , q[2]);
    
    m4 mux1(sel , {q[2] , q[0] , d_par[1] ,q[1]} , d[1]);
    
    dff df1(clk , reset , d[1] , q[1]);
    
    m4 mux0(sel , {q[1] , d_ser , d_par[0] ,q[0]} , d[0]);
    
    dff df0(clk , reset , d[0] , q[0]);
    
    
endmodule


