`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:57:26
// Design Name: 
// Module Name: unishftb
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


module unishftb(
    output reg [31:0] in,
    output reg len, ren,
    output reg [4:0] svl , svr,
    output  [31:0] out
    );
integer  i;
unishf dut(in , len , ren , svl , svr , out);

initial begin
    for(i = 1; i <9 ; i = i+1) begin
    in = i;
    len = $random %2;
    ren = $random %2;
    svl = 32'd1;
    svr = 32'd1;
    #1;
    svl = 32'd31;
    svr = 32'd31;
#1;
end
    $finish;
end

endmodule
