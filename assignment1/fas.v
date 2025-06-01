module fa_structural(
    input a, b, cin,
    output sum, cout
);
    wire w1, w2, w3;
    xor (w1, a, b);
    xor (sum, w1, cin);
    and (w2, a, b);
    and (w3, w1, cin);
    or (cout, w2, w3);
endmodule