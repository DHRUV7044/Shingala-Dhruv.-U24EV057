`timescale 100us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 22:57:19
// Design Name: 
// Module Name: tralgttb
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


module tralgttb();
parameter p = 10;
reg clk;
reg reset;
wire red_light;
wire yellow_light;
wire green_light;


tralgt trafic_light(clk , reset , red_light , yellow_light , green_light );

initial begin
clk = 0;
forever #(p/2) clk = ~clk;
end

initial begin
reset = 1;
#p;
reset = 0;
#(100*p);
$finish;
end

endmodule
