`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 11:14:38
// Design Name: 
// Module Name: tbcall
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


module tbcall();

parameter p =10;
reg clk ;
wire [3:0] q_ring     , q_johnson;
wire [2:0] q_async_up , q_async_down;
wire [3:0] q_BCD      , q_sync_down;
wire       button     , pulse;

asytb    #(p) tb1 (clk , q_async_up , q_async_down);
rjcotb   #(p) tb2 (clk , q_ring     , q_johnson   );
synccotb #(p) tb3 (clk , q_BCD      , q_sync_down );
plsgentb #(p) tb4 (clk , button     , pulse       );
initial begin
    clk = 0;
    forever #(p/2) clk = ~clk;
end

endmodule
