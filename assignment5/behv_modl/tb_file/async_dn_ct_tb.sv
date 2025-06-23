`timescale 1ns / 1ps

module async_dn_ct_tb();

parameter p = 10;
reg [2:0] data;
reg clk , areset , load;
wire [2:0] q;

async_dn_ct counter(clk , areset , load , data , q);
initial begin
clk = 0;
forever #(p/2) clk = ~clk;

end

initial begin
data = 0;
load = 0;
areset = 1;
#12;
areset = 0;
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
#(5*p);
areset = 1;
#1;
areset = 0;
load =1;
data = 7;
#(p);
load = 0;
data =6;
#(5*p);

$finish;
end
endmodule
