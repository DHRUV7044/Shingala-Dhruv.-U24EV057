module m2x1(
    input en,
    input [1:0] i,
    input s,
    output y
);
    assign y = en&((i[0]&(~s)) | i[1]&s);
endmodule