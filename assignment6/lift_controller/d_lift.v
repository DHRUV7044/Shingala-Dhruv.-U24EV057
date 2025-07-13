`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 10:22:45
// Design Name: 
// Module Name: lift
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


module lift(
    input clk,
    input reset,
    input [2:0] dstn,
    output atf1 , atf2 , atf3
    );
    
    parameter [1:0] f1 = 2'b00,
                    f2 = 2'b01,
                    f3 = 2'b10;
                    
    parameter [2:0] sf1 = 4'h0,
                    gf1 = 4'h1,
                    sf2 = 4'h2,
                    gf2 = 4'h3,
                    sf3 = 4'h4,
                    gf3 = 4'h5;
    reg [2:0] cs , ns;
    reg [2:0] ftg;
    reg [2:0]  r;
    wire[2:0]  s;
    reg rst  , rr;
    wire sr;
    reg sk;
    
    
    assign s = dstn;
    assign sr = reset;
    
    always @(*) begin
        rst = sr?1:(rr?0:rst);
        ftg[0] = rst?1:(r[0]?0:(s[0]?1:ftg[0]));
        ftg[1] = rst?0:(r[1]?0:(s[1]?1:ftg[1]));
        ftg[2] = rst?0:(r[2]?0:(s[2]?1:ftg[2]));
    end
    
    always @(*) begin
        case(cs) 
            sf1 : begin
                ns = reset?sf1:ftg[0]?sf1:(ftg[1]|ftg[2])?gf2:sf1;
                sk = 1'b0;
                {r , rr} = 4'b0011;
            end
            gf1 : begin
                ns = sf1;
                {r , rr} = 4'b0000;
            end
            sf2 : begin
                ns = ftg[1]?sf2:sk?gf1:ftg[2]?gf3:ftg[0]?gf1:sf2;
                {r , rr} = 4'b0100;
            end
            gf2 : begin
                ns = ftg[1]?sf2:sk?gf1:ftg[2]?gf3:ftg[0]?gf1:sf2;
                {r , rr} = 4'b0000;
            end
            sf3 : begin
                ns = ftg[2]?sf3:(ftg[1]|ftg[0])?gf2:sf3;
                sk = ftg[0];
                {r , rr} = 4'b1000;
            end
            gf3 : begin
                ns = rst?gf2:sf3;
                {r , rr} = 4'b0000;
            end
            
            default : ns = sf1;
        endcase
    end
    
    always @(posedge clk or posedge reset)begin
        if(reset) {r , rr} = 4'b0000;
        cs <=ns;
       
    end
    
    
    
    assign atf1 = (cs==sf1);
    assign atf2 = (cs==sf2);
    assign atf3 = (cs==sf3);
    
    
endmodule
