`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 15:49:31
// Design Name: 
// Module Name: unishf
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


module unishf(
    input [31:0] dt,
    input len , ren,
    input [4:0] svl , svr,
    output [31:0] out
);

reg[31:0] stl0 , stl1 , stl2 , stl3 , stl4;
reg[31:0] str0 , str1 , str2 , str3 , str4;

 always @(*) begin
        if(len==1)begin
        stl0 = svl[0]?{dt[30:0] ,dt[31] }:dt;
        stl1 = svl[1]?{stl0[29:0] ,stl0[31:30] }:stl0;
        stl2 = svl[2]?{stl1[27:0] ,stl1[31:28] }:stl1;
        stl3 = svl[3]?{stl2[23:0] ,stl2[31:24] }:stl2;
        stl4 = svl[4]?{stl3[15:0] ,stl3[31:16] }:stl3;
        end else stl4 = dt;
        if(ren==1) begin
        str0 = svr[0]?{stl4[0] ,stl4[31:1] }:stl4;
        str1 = svr[1]?{str0[1:0] ,str0[31:2] }:str0;
        str2 = svr[2]?{str1[3:0] ,str1[31:4] }:str1;
        str3 = svr[3]?{str2[7:0] ,str2[31:8] }:str2;
        str4 = svr[4]?{str3[15:0] ,str3[31:16] }:str3;
        end else str4 = stl4;
    end
    
    assign out = str4;
endmodule
