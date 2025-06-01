module fatbs;
    reg a, b, cin;
    wire sum, cout;

    fa_structural uut(
        .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("fatbs.vcd"); 
        $dumpvars(0, fatbs);     
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
