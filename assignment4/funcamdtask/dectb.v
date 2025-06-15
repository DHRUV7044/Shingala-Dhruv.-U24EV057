`timescale 1ns/1ps
module dectb;
    reg e;
    reg [2:0] s;
    wire [7:0] o;

    dec decoder ( e , s , o );
    integer j;
    initial begin
        $dumpfile("decv.vcd");
        $dumpvars(0, dectb);
        
        e = 1;
        for (j = 0; j < 8; j = j + 1) begin
            s = j[2:0];
            #1; 
        end
        
        
        e = 0;
        s = 3'b101; 
        #1;
        
        
        $finish;
    end
    endmodule