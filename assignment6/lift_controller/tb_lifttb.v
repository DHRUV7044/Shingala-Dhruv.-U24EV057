`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 11:13:13
// Design Name: 
// Module Name: lifttb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lifttb();
    
    parameter p =10;
    reg clk , reset;
    reg [2:0] dstn;
    wire at_floor1 , at_floor2 , at_floor3;
    
   
    lift lift(clk , reset , dstn , at_floor1 , at_floor2 , at_floor3 );
    
    initial begin
    clk = 0;
    forever #(p/2) clk = ~clk;
    end
    
    initial begin
        reset = 1; dstn = 3'b000; #(2*p);
        reset = 0;

        dstn = 3'b001; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b010; #(p);
        dstn = 3'b000; #(4*p);
        dstn = 3'b100; #(p);
        dstn = 3'b000; #(3*p);
        dstn = 3'b011; #(p);
        dstn = 3'b000; #(1*p);
        dstn = 3'b101; #(p);
        dstn = 3'b000; #(3*p);
        dstn = 3'b110; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b111; #(p);
        dstn = 3'b000; #(4*p);
        dstn = 3'b001; #(p);
        dstn = 3'b000; #(1*p);
        dstn = 3'b100; #(p);
        dstn = 3'b000; #(3*p);
        dstn = 3'b010; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b101; #(p);
        dstn = 3'b000; #(1*p);
        dstn = 3'b011; #(p);
        dstn = 3'b000; #(4*p);
        dstn = 3'b110; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b100; #(p);
        dstn = 3'b000; #(3*p);
        dstn = 3'b010; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b111; #(p);
        dstn = 3'b000; #(4*p);
        dstn = 3'b001; #(p);
        dstn = 3'b000; #(2*p);
        dstn = 3'b100; #(p);
        dstn = 3'b000; #(1*p);
        
        
        $finish;
    end
    
endmodule
