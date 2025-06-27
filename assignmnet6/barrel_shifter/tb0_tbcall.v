`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:57:26
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
    wire [31:0] in_left_shift , in_right_shift , in_uni_shift ;
    wire [4:0]  shift_value_left_shift , shift_value_right_shift , shift_value_uni_left_shift , shift_value_uni_right_shift;
    wire left_shift_en , right_shift_en;
    wire [31:0]  out_left_shift , out_right_shift , out_uni_shift;

lftshftb dut0(in_left_shift , shift_value_left_shift , out_left_shift);
rgtshftb dut1(in_right_shift , shift_value_right_shift , out_right_shift);
unishftb dut2(in_uni_shift , left_shift_en , right_shift_en , shift_value_uni_left_shift , shift_value_uni_right_shift , out_uni_shift);

initial begin
#(50);
$finish;
end
endmodule
