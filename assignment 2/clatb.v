`timescale 1ns/1ps
module clatb;
    reg [7:0] a, b;
    reg cin ;
    wire [7:0] sum;
    wire cout;

    cla clao(
        .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)
    );
    integer i;
    initial begin
        $dumpfile("clatb.vcd");
        $dumpvars(0, clatb);
        $display(" a  b  cin | sum cout");
        $display("----------------------");
        for (i = 0; i < 256; i = i + 1) begin
            {a, b, cin} = i;
            #1;
            $display("%b %b  %b  | %b  %b", a, b, cin, sum, cout);
        end
        $finish;
    end
endmodule