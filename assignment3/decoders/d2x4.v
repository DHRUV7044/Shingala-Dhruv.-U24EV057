module d2x4(
    input en,
    input [1:0] s,
    output [3:0] y
);
    assign y = en ? (4'b0001 << s) : 0;
endmodule