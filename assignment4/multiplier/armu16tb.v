`timescale 1ns/1ps

module armu16tb;
    localparam n = 16;
    reg [n-1:0] a , b ;
    wire [2*n-1:0]  m;

    armu16 #(.n(n)) multiplier ( a ,b ,m);

    integer i = 0;
    integer j = 0;

    initial begin
        $dumpfile("armu16v.vcd");
        $dumpvars(0 , armu16tb);
        a =0;
        b =0;
        
        for (i  =0  ;i <n ; i = i+1 ) begin
                a = 2**i ;
            for (j = 0; j<n; j = j+1) begin
                b = 2**j;
                #1;
            end
            #1;
        end
        $finish;
    end

endmodule