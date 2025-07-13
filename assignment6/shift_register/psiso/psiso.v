`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 01:17:33
// Design Name: 
// Module Name: psiso
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


module psiso(
    input clk ,
    input reset,
    input load,
    input [3:0] din,
    input shift_bit,
    output q
    );
    
    wire [3:0] d , qi;
    wire loadn;
    
    
    m2 mux1(load , {din[0] , 1'b0} , d[0]);
    dff d0(clk , reset , d[0] , qi[0]);
    
    m2 mux2(load , {din[1] , qi[0]} , d[1]);
    dff d1(clk , reset , d[1] , qi[1]);
    
    
    m2 mux3(load , {din[2] , qi[1]} , d[2]);
    dff d2(clk , reset , d[2] , qi[2]);
    
    m2 mux4(load , {din[3] , qi[2]} , d[3]);
    dff d3(clk , reset , d[3] , qi[3]);
    
    assign q = qi[3];
    
endmodule