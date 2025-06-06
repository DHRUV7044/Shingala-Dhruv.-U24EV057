module d2x4(
    input en,
    input [1:0] s,
    output [3:0] y
);
    wire [1:0] sn;
    assign sn = ~s;
    assign y[0] = en&sn[1]&sn[0];
    assign y[1] = en&sn[1]&s[0];
    assign y[2] = en&s[1]&sn[0];
    assign y[3] = en&s[1]&s[0];
endmodule