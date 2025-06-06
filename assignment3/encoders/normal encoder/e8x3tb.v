module e8x3tb;
    reg en;
    reg [7:0] s;
    wire active;
    wire [2:0] y;

    e8x3 encoder(
        .en(en) , .s(s) , .y(y) , .active(active) 
    );
    integer i;
    initial begin
        $dumpfile("e8x3v.vcd");
        $dumpvars(0 , e8x3tb);
        en = 0;
        for(i =0; i < 256; i= i +1)begin
            s = i;
            #1;
        end
        en =1;
        for(i =0; i < 256; i= i +1)begin
            s = i;
            #1;
        end
        $finish;
    end

endmodule