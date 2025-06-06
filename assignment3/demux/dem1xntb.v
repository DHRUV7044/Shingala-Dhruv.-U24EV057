`timescale 1ns/1ps
module dem1xntb;
    localparam N  = 16;
    reg en;
    reg i;
    reg [$clog2(N)-1:0] s ;
    wire [N-1:0] y;

    dem1xn #(.N(N)) demux(
        .en(en) , .i(i) , .s(s) , .y(y)
    );
    integer z;
    initial begin
        $dumpfile("dem1xnv.vcd");
        $dumpvars(0 , dem1xntb);
        for (z = 0; z<N ; z =z+1) begin
            en =1;
            s = z;
            i =1;
            #1;
            i =0;
            #1;
            en = 0;
            s =z;
            i =1;
            #1;
            i =0;
            #1;
        end
        $finish;
    end
endmodule