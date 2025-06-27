`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:57:26
// Design Name: 
// Module Name: lftshftb
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


module lftshftb(
    output reg [31:0] in,
    output reg [4:0] sv,
    output  [31:0] out
);
integer i ;
lftshf dut(in , sv, out);

initial begin
for(i = 1; i <9 ; i = i+1) begin
in = i;
sv = 32'd1;
#1;
sv = 32'd31;
#1;
end

$finish;
end

endmodule
