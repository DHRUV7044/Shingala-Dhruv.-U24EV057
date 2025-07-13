`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 17:27:51
// Design Name: 
// Module Name: lut_ram_32_64_tb
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


module lut_ram_32_64_tb();
    //parameter w = 8 , d = 65536;
    parameter p = 10;
    reg clk , reset;
    reg we;
    reg [13:0] addr;
    reg [31:0] din;
    wire [31:0] dout;
    integer i;
    
lr3264 lut_ram(clk , reset , we , addr , din , dout);

initial begin
    clk = 0;
    forever #(p/2) clk = ~clk;
end


initial begin
    i = 0;
    reset = 1;
    we = 0;
    addr = 0;
    din = 0;
    #p;
    reset = 0;
    
    addr = 10;
    din = 10;
    we = 1;
    #p;
    
    addr = 15;
    din = 15;
    #p;
    
    we = 0;
    addr = 10;
    #p;
    
    addr = 15;
    #(3*p);
    
    we = 1;
    #p;
    
    we = 0;
   for(i = 0;  i < 30 ; i = i+1 ) begin
        we = 1;
        addr = $random;
        din = $random;
        #p;
        we = 0;
        #p;
    end
    
    #(2*p);
    
    $finish;
end

endmodule