`timescale 1ns/1ps
module m2x1tb ;
    reg s , en;
    reg [1:0] i;
    wire y;

    m2x1 mux(
        .en(en) , .s(s) , .i(i) , .y(y)
    );
    integer j;

    initial begin
        $dumpfile("m2x1v.vcd");
        $dumpvars(0 , m2x1tb);
        for (j = 0; j<16; j = j+1) begin
            {en , s , i} = j;
            #1;
        end
        $finish;
    end

endmodule