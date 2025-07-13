`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 17:15:31
// Design Name: 
// Module Name: lr3264
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


module lr3264(
    input clk,
    input reset,
    input we,
    input [13:0] addr,
    input [31:0] din,
    output reg [31:0] dout
    );
    
    parameter W = 32;
    parameter D = 16384;
    
    integer i;
    reg [(W*D)-1:0] lut;
    
    always @(posedge reset) begin
        if(reset) begin
           lut <=0;
     end
    end
    
    always @(posedge clk) begin
        if(~reset) begin
            if(we) lut[addr*32 +: 32] = din;
        end
        dout <= lut[addr*32 +:32];
    end
    
endmodule