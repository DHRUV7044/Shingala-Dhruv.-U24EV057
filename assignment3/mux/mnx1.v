module mnx1 #(parameter N=4 )(
    input en,
    input [$clog2(N)-1:0] s,
    input [N-1:0] i,
    output y
);
    reg x;
    always @(*) begin
        if (en)
            x = i[s];
        else
            x = 0;
    end
    assign y = x;
endmodule