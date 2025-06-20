`timescale 1ns / 1ps

module async_dn_ct(
    input clk,
    input areset,
    input load,
    input [2:0] data,
    output reg [2:0] q
    );
    
    always @(posedge clk or posedge areset) begin
        if(areset) q <= 3'b000;
        else if(load) q <=data;
        else q <= q-3'b001;
    end
endmodule
