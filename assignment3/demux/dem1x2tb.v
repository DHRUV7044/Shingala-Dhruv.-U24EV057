`timescale 1ns/1ps
module dem1x2tb;
    reg en ,
    reg i ;
    reg s;
    wire [1:0] y;
    dem1x2 demux(
        .en(en) , .i(i) , .s(s) , .y(y)
    );

    integer z;
    initial begin
         $dumpfile("dem1x2v.vcd");
        $dumpvars(0 , dem1x2tb);
        en =1;
        for (z = 0; z<2; z = z+1) begin
            s =z;
            i = 1;
            #1;
            i = 0;
            #1;
        end
        $finish;
    end
endmodule