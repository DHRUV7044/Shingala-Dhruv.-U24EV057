`timescale 1ns/1ps
module prientb;
    reg en;
    reg [7:0] i;
    wire act;
    wire [2:0] y;

    prien encoder(
        .en(en) , .i(i) , .act(act) , .y(y)
    );
    integer z;
    initial begin
        $dumpfile("prienv.vcd");
        $dumpvars(0 , prientb);
        for (z = 0; z<256; z =z+1) begin
            en =1;
            i = z;
            #1;
            en = 0;
            i =z;
            #1;
        end
        $finish;
    end
endmodule