`timescale 1ns/1fs
module cbatb;
    reg [31:0] a, b;
    reg cin;
    wire [31:0] sum;
    wire cout;
    wire [2:0] c;
    cba cba0(   
        .a(a[7:0]) , .b(b[7:0]) , .cin(cin) , .sum(sum[7:0]) , .cout(c[0])
    );
    cba cba1(
        .a(a[15:8]) , .b(b[15:8]) , .cin(c[0]) , .sum(sum[15:8]) , .cout(c[1])
    );
    cba cba2(
        .a(a[23:16]) , .b(b[23:16]) , .cin(c[1]) , .sum(sum[23:16]) , .cout(c[2])
    );
    cba cba3(
        .a(a[31:24]) , .b(b[31:24]) , .cin(c[2]) , .sum(sum[31:24]) , .cout(cout)
    );

    integer i;
    initial begin
        $dumpfile("cbatb.vcd");
        $dumpvars(0 , cbatb);
        $display(" a          b          cin | sum        cout");
        $display("---------------------------------------------");
        for(i = 0; i<5536 ; i = i+1)begin
            {a , b , cin} = i;
            #1;
            $display("%b %b %b | %b %b", a, b, cin, sum, cout);
        a = 32'hffffffff;
        b = 32'h00000001;
        cin = 1'b0;
            #1;
            $display("%b %b %b | %b %b", a, b, cin, sum, cout);
        a = 32'h0ffffff;
        b = 32'hfdbace01;
        cin = 1'b0;
            #1;
            $display("%b %b %b | %b %b", a, b, cin, sum, cout);
        a = 32'h00ffffff;
        b = 32'h60d0f0a1;
        cin = 1'b0;
            #1;
            $display("%b %b %b | %b %b", a, b, cin, sum, cout);
        end
        $finish;

    end
endmodule