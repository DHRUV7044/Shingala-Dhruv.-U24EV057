`timescale 1ns/1ps
module m4x1tb;

    reg en;
    reg [1:0] s;
    reg [3:0] i;
    wire y;

    m4x1 mux(
        .en(en) , .s(s) , .i(i) , .y(y)
    );
    integer z;
    initial begin
        $dumpfile("m4x1v.vcd");
        $dumpvars(0 , m4x1tb);
        for (z = 0; z<128; z=z+1) begin
            {s , i , en} =z;
            #1;
        end
        $finish;
    end
endmodule