`timescale 1ns/1ps

module enctb;
    reg e;
    reg [7:0] i;
    wire [2:0] s;

    enc encoder ( e , i , s );
    integer j;
    initial begin
        $dumpfile("encv.vcd");
        $dumpvars(0, enctb);
        
        e = 1;
        for (j = 0; j < 256; j = j + 1) begin
            i = j[7:0];
            #1; 
        end
        
        
        e = 0;
        i = 8'b10101010; 
        #1;
        
        
        $finish;
    end
endmodule