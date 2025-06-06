`timescale 1ns/1ps
module e4x2tb;
    reg en;
    reg [3:0] s;
    wire active;
    wire [1:0] y;

    e4x2 encoder(
        .en(en) , .s(s) , .y(y) , .active(active) 
    );
    integer i;
    initial begin
        $dumpfile("e4x2v.vcd");
        $dumpvars(0 , e4x2tb);
        en = 0;
        for(i =0; i < 16; i= i +1)begin
            s = i;
            #1;
        end
        en =1;
        for(i =0; i < 16; i= i +1)begin
            s = i;
            #1;
        end
        $finish;
    end

endmodule