`timescale 1ns/1ps  

module demtb;

    reg e;
    reg  i;
    reg [3:0] s;
    wire [15:0] o;

    dem demux( e ,i ,s ,o);
    integer j;
    initial begin
        $dumpfile("demv.vcd");
        $dumpvars(0, demtb);
        
        e = 1;
        for (j = 0; j < 16; j = j + 1) begin
            i = 1;
            s = j;
            #1; 
        end
        
        e = 0;
        i = 8'hff; 
        s = 3'b001;
        #1;
        
        $finish;
    end
endmodule