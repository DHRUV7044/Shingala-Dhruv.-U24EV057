`timescale 1ns/1ps
module tbgate ;
    reg s , en;
    reg [1:0] i1 ,i2 ,i3 ,i4 ,i5 ,i6;
    wire y1 ,y2 ,y3 ,y4 ,y5 ,y6;
    reg a;
    reg b;
    m2x1 and_mux(
        .en(en), .s(s), .i(i1), .y(y1)
    );
    m2x1 or_mux(
        .en(en), .s(s), .i(i2), .y(y2)
    );
    m2x1 nor_mux(
        .en(en), .s(s), .i(i3), .y(y3)
    );
    m2x1 nand_mux(
        .en(en), .s(s), .i(i4), .y(y4)
    );
    m2x1 xor_mux(
        .en(en), .s(s), .i(i5), .y(y5)
    );
    m2x1 xnor_mux(
        .en(en), .s(s), .i(i6), .y(y6)
    );
    integer j;

    initial begin
        $dumpfile("tbgatev.vcd");
        $dumpvars(0 , tbgate);

        en =1;
        for (j = 0; j<4; j = j+1) begin
            {a , b} = j;
            // mux select line to b
            s = b;
            // input to a for and gate
            i1[0] = 0;
            i1[1] = a;
            // input to a for or gate
            i2[0] = a;
            i2[1] = 1;
            // input to a for nor gate
            i3[0] = ~a;
            i3[1] = 0;
            // input to a for nand gate
            i4[0] = 1;
            i4[1] = ~a;
            // input to a for xor gate
            i5[0] = a;
            i5[1] = ~a;
            // input to a for xnor gate
            i6[0] = ~a;
            i6[1] = a;
            #1;
        end
        $finish;
    end

endmodule