`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 18:30:53
// Design Name: 
// Module Name: mefsm
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


module mefsm(
    input clk,
    input reset,
    input in,
    output out
    );
    
    parameter o = 1'b0,
              e = 1'b1;
              
    reg cs , ns;
    
    always @(*) begin
        case(cs)
            o : ns = in?e:o;
            e : ns = in?o:e;
        endcase
    end  
    
    always@(posedge clk or  posedge reset) begin
        if(reset) cs <= e;
        else cs <= ns;
    end
    
    assign out = (~in&(cs==e))|(in&(cs==o));
    
endmodule