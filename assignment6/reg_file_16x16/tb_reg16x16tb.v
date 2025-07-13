`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 19:25:59
// Design Name: 
// Module Name: reg16x16tb
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


module reg16x16tb();

    parameter p = 10;
    reg clk , reset , wren;
    reg [3:0] rd1ad , rd2ad , wrad ;
    reg [15:0]  wrdt;
    wire [15:0] rd1dt , rd2dt;
    
    
    reg16x16 regfile(clk , reset , wren , rd1ad , rd2ad , wrad , wrdt , rd1dt , rd2dt );

    initial begin
    clk = 0;
    forever #(p/2) clk = ~clk;
    end
    integer i;
    initial begin
    reset = 1;
    wren = 0;
    rd1ad = 0;
    rd2ad = 0;
    wrad = 0;
    wrdt = 0;
    #p;
    reset = 0;
    wren = 1;
    wrad = 4'b0101;
    wrdt = 16'hfedc;
    #p;
    wren = 0;
    wrad = 0;
    wrdt = 0;
    rd1ad = 4'b0101;
    #p;
    rd2ad = 4'b0101;
    #p;
    wren = 1;
    for(i = 0; i <16 ; i = i+1) begin
    wrad = i;
    wrdt = i + 16'hfe00;
    #p;
    end
    
    wren = 0;
    
    for(i = 0; i <8 ; i = i+1) begin
    rd1ad = i;
    rd2ad = ~i;
    #p;
    end
    
    $finish;
    end
    
    
endmodule
