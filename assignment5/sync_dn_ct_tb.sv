`timescale 1ns / 1ps

module sync_dn_ct_tb();

parameter p = 10;
reg [2:0] data;
reg clk , reset , load;
wire [2:0] q;

sync_dn_ct counter(clk , reset , load , data , q);
initial begin
clk = 0;
forever #(p/2) clk = ~clk;

end

initial begin
data = 0;
load = 0;
reset = 1;
#12;
reset = 0;
load = 1;
data = 6;
#p;
load = 0;
data = 0;
#(6*p);
data = 8;
load = 1;
#p;
load = 0;
data = 0;
#(12*p);

$finish;
end
endmodule
