`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 12:36:07
// Design Name: 
// Module Name: synccotb
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


module synccotb#(parameter p =10)(
    input clk,
    output [3:0] qb,
    output [3:0] qsd
    );
    
    reg reset;
    
    bcdup BCDcounter(clk , reset , qb);
    syncdnco sync_down_counter(clk , reset , qsd);
    
    initial begin
    reset = 1;
    #p;
    reset = 0;
    #(20*p);
    $finish;
    end
    
endmodule
