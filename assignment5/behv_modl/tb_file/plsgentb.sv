`timescale 1ns / 1ps


module plsgentb();
    parameter p = 10;
    reg clk , b , reset ;
    wire q;
    
    plsgen pulse(clk ,reset ,  b , q);
    
    initial begin
        clk = 0;
        forever #(p/2) clk = ~clk;
    end


    initial begin
    
        b = 0;
        reset = 1;
        #p;
        reset = 0;
        #p;
        b = 1;
        #p;
        b = 0;
        #1;
        b = 1;
        #(2*p);
        b = 0;
        #2;
        b = 1;
        #p;
        b = 0;
        #p;
        b = 1;
        #(2*p);
        
        $finish;
    end
endmodule
