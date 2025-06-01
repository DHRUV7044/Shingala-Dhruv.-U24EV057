module fatbb;
    reg a, b, cin;
    wire sum, cout;

    fa_behavioral uut(
        .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("fatbb.vcd");
        $dumpvars(0, fatbb);     
        $display("a b cin | sum cout");
        $display("-------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #1;
            $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);
        end
        $finish;
    end
endmodule
