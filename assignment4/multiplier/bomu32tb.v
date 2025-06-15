`timescale 1ns/1ps

module bomu32tb;
    localparam n = 32;  
    reg [n-1:0] a , b;
    wire [2*(n+1)-1:0] m;

    bomu32 #(.n(n)) multiplier( a ,b , m);

    integer i = 0;
    integer j = 0;

    initial begin
        $dumpfile("bomu32v.vcd");
        $dumpvars(0 , bomu32tb);
        a =0;
        b =0;
        
        for (i  =0  ;i <n ; i = i+1 ) begin
                a = 2**i;
            for (j = 0; j<n; j = j+1) begin
                b = 2**j;
                #1;
            end
            #1;
        end
        $finish;
    end
endmodule