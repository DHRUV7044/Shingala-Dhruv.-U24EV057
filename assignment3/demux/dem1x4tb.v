`timescale 1ns/1ps
module dem1x4tb;
    reg en;
    reg i;
    reg [1:0] s;
    wire [3:0] y;

    dem1x4 demux(
      .en(en) , .i(i) , .s(s) , .y(y)
    );
    integer z;

    initial begin
        $dumpfile("dem1x4v.vcd");
        $dumpvars(0 , dem1x4tb);
        for (z = 0; z<4; z = z+1) begin
            en = 1;
            s = z;
            i = 1;
            #1;
            en = 0;
            s = z;
            i = 1;
            #1;
        end
    $finish;
    end
endmodule   