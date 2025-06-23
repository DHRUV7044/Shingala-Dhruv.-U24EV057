`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 15:59:12
// Design Name: 
// Module Name: plsgentb
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


module plsgentb #(parameter p =10)(
    input clk,
    output reg b,
    output pl
    );
    reg reset;
    
    plsgen pls(clk , reset , b , pl);
    
    initial begin
    reset = 1;
    b = 0;
    #p;
    reset = 0;
    b = 1;
    #(2*p);
    b = 0;
    #(p);
    b = 1;
    #(p);
    b = 0;
    #(p);
    b = 1;
    #(10*p);
    
    $finish;
    end
    
endmodule
