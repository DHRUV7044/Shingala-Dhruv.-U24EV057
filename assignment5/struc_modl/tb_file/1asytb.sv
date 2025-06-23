`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 10:33:56
// Design Name: 
// Module Name: asytb
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


module asytb #(parameter p = 10)(
    input clk,
    output [2:0] qu , qd
);



reg reset;


asyupco upcounter(clk , reset , qu);
asydnco downcounter(clk , reset , qd);



initial begin
reset = 1;
#p;
reset = 0;
#(20*p);

$finish;
end

endmodule
