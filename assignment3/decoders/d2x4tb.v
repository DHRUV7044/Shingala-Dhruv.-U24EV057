`timescale 1ns / 1ps
module d2x4tb;
    reg [1:0] s;
    reg en;
    wire [3:0] y;
    d2x4 decoder(
        .en(en) , .s(s) , .y(y)
    );
    integer i;
    initial begin
        $dumpfile("d2x4v.vcd");
        $dumpvars(0 , d2x4tb);
        for(i = 0 ; i<8 ; i = i+1) begin
            {en , s} = i;
            #1;
        end
        $finish;
    end
endmodule