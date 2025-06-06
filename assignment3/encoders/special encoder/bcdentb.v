`timescale 1ns/1ps

module bcdentb;
    reg en;
    reg [99:0] i;
    wire [7:0] y;
    wire act;

    bcden bcden(
        .en(en) , .i(i) , .y(y) , .act(act)
    );
    integer z;
    initial begin
        $dumpfile("bcdenv.vcd");
        $dumpvars(0 , bcdentb);
        en =1;
        for (z = 0; z<100; z = z+1) begin
            i = 1<<z;
            #1;
        end
        $finish;
    end
endmodule