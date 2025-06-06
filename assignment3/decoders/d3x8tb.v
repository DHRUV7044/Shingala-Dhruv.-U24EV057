`timescale 1ns/1ps
module d3x8tb;
    wire [7:0] y;
    reg [2:0] s;
    reg en;

    d3x8 decoder (
        .en(en), .s(s), .y(y)
    );
    integer i;
    initial begin
        $dumpfile("d3x8v.vcd");
        $dumpvars(0, d3x8tb);
        for(i =1; i<16 ; i= i+1) begin
            {en , s} =i;
            #1;
        end
        $finish;
    end
  endmodule