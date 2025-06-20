`timescale 1ns / 1ps

module sync_dn_ct(
    input clk,
    input reset,
    input load,
    input [2:0] data,
    output reg [2:0] q
    );
    
    always @(posedge clk) begin
        if(reset) q <= 3'b000;
        else if(load) q <=data;
        else q <= q-3'b001;
    end
endmodule
