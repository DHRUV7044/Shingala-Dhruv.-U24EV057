module csa(
    input [7:0] a, b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [7:0] c1 ,c2;
    wire [7:0] p,g;
    wire [7:0] sum1,sum2;
    wire cout1 ,cout2;

    assign p = a ^ b;
    assign g = a & b;

    assign c1[0] = 0;
    assign c1[1] = g[0] | (p[0] & 0);
    assign c1[2] = g[1] | (p[1] & c1[1]);
    assign c1[3] = g[2] | (p[2] & c1[2]);
    assign c1[4] = g[3] | (p[3] & c1[3]);
    assign c1[5] = g[4] | (p[4] & c1[4]);
    assign c1[6] = g[5] | (p[5] & c1[5]);
    assign c1[7] = g[6] | (p[6] & c1[6]);
    assign cout1 = g[7] | (p[7] & c1[7]);

    assign c2[0] = 1;
    assign c2[1] = g[0] | (p[0] & 1);
    assign c2[2] = g[1] | (p[1] & c2[1]);
    assign c2[3] = g[2] | (p[2] & c2[2]);
    assign c2[4] = g[3] | (p[3] & c2[3]);
    assign c2[5] = g[4] | (p[4] & c2[4]);
    assign c2[6] = g[5] | (p[5] & c2[5]);
    assign c2[7] = g[6] | (p[6] & c2[6]);
    assign cout2 = g[7] | (p[7] & c2[7]);

    assign sum1 = p ^ c1;
    assign sum2 = p ^ c2;

    assign sum = cin ? sum2 : sum1;
    assign cout = cin ? cout2 : cout1;
endmodule