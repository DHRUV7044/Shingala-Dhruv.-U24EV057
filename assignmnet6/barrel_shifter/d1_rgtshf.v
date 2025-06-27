`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 15:49:31
// Design Name: 
// Module Name: rgtshf
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


module rgtshf(
    input [31:0] dt,
    input [4:0] sv,
    output [31:0] out
    );
    
    reg[31:0] st0 , st1 , st2 , st3 , st4;
    
    always @(*) begin
        
        st0 = sv[0]?{dt[0] ,dt[31:1] }:dt;
        st1 = sv[1]?{st0[1:0] ,st0[31:2] }:st0;
        st2 = sv[2]?{st1[3:0] ,st1[31:4] }:st1;
        st3 = sv[3]?{st2[7:0] ,st2[31:8] }:st2;
        st4 = sv[4]?{st3[15:0] ,st3[31:16] }:st3;
        
    end
    assign out = st4;
endmodule
