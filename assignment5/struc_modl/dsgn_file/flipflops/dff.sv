`timescale 1ns / 1ps

module dff(
    input clk,
    input reset,
    input d,
    output q , qb
);
    wire j , k;
    buf(j , d);
    not(k , d);
    
    jkff df(clk , reset , j , k , q , qb);
endmodule