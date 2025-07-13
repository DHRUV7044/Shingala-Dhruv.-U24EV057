`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 18:20:57
// Design Name: 
// Module Name: lr864
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


module lr864(
    input clk,
    input reset,
    input we,
    input [15:0] addr,
    input [7:0] din,
    output reg [7:0] dout
    );
    
    parameter W = 8;
    parameter D = 65536;
    
    integer i;
    reg [(W*D)-1:0] lut;
    
    always @(posedge reset) begin
        if(reset) begin
           lut <=0;
     end
    end
    
    always @(posedge clk) begin
        i = addr;
        if(~reset) begin
            if(we) lut[i*8 +: 8] = din;
        end
        dout <= lut[i*8 +:8];
    end
    
endmodule
