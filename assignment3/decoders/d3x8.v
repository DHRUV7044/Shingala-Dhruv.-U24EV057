module d3x8 (
    input en,
    input [2:0] s,
    output [7:0] y
);
    assign y = en ? (8'b00000001<<s) : 0;
endmodule