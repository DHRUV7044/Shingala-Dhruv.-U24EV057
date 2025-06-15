`timescale 1ns/1ps

module muxtb;

    reg e;
    reg [15:0] i;
    reg [3:0] s;
    wire o;

    mux mux( e ,i ,s ,o);
    integer z;
    initial begin
        $dumpfile("muxv.vcd");
        $dumpvars(0, muxtb);
        
        e = 1;
        for (z = 0; z < 16; z = z + 1) begin
            i = 1<<z;
            s = z;
            #1; 
        end
        
        e = 0;
        i = 16'hffff; 
        s = 4'b0001;
        #1;
        
        $finish;
    end
endmodule