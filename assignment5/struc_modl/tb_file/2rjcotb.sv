`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 10:09:08
// Design Name: 
// Module Name: rjcotb
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


module rjcotb #(parameter p = 10)(
    input clk,
    output [3:0] qr , qj
); 


reg reset , preset;


rico ringcounter   (clk , reset , preset , qr);
joco johnsoncounter(clk , reset , preset , qj);



initial begin
reset = 1;
preset = 1;
#p;
reset = 0;
preset = 0;
#(20*p);

$finish;
end

endmodule
