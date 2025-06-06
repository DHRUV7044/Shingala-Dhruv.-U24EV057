`timescale 1ns/1ps
module mnx1tb;
    localparam N=50;
    reg en;
    reg [$clog2(N)-1:0] s;
    reg [N-1:0] i;
    wire y;

    mnx1 #(.N(N)) mux(
        .en(en) , .s(s) , .i(i) , .y(y)
    );

    integer x ;
    initial begin
        $dumpfile("mnx1v.vcd");
        $dumpvars(0 , mnx1tb);
        en = 1;
    for (x = 0; x<N ; x=x+1) begin
        s = x;
        i = 1<< x;
        #1;
    end
    $finish;
end 
endmodule