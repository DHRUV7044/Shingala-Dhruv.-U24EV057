`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 19:17:06
// Design Name: 
// Module Name: reg16x16
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


module reg16x16(
    input clk,
    input reset,
    input wren,
    
    input [3:0] rd1ad,
    input [3:0] rd2ad,
    input [3:0] wrad,
    
    input [15:0] wrdt,
    output reg [15:0] rd1dt,
    output reg [15:0] rd2dt
    );
    
    reg [255:0] data;
    
    always @(posedge reset) begin
        if(reset) data <= 0;
    end
    
    
    always @(posedge clk) begin
        if(reset) data <=0;
        else begin
            if(wren) begin
                data[16*(wrad) +:16] <= wrdt; 
            end
            rd1dt <= data[16*(rd1ad) +:16];
            rd2dt <= data[16*(rd2ad) +:16];
        end
    end
    
    
    
endmodule
