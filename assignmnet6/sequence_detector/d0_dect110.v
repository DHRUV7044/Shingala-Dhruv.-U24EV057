`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 11:35:42
// Design Name: 
// Module Name: dect110
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


module dect110(
    input clk,
    input reset,
    input in,
    output out
    );
    
    parameter [1:0] a    = 2'b00,
                    s1   = 2'b01,
                    s11  = 2'b10,
                    s110 = 2'b11;
    reg [1:0] cs , ns;
    
    always @(*) begin
        case(cs)
            a    : ns = in?s1:a;
            s1   : ns = in?s11:a;
            s11  : ns = in?s11:s110;
            s110 : ns = a;
        endcase
    end
    
    always @(posedge clk or posedge reset) begin
        if(reset) cs <=a;
        else cs <= ns;
    end
    assign out = (cs==s110);
endmodule
