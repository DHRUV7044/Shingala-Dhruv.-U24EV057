module e8x3(
    input en ,
    input [7:0] s,
    output [2:0] y,
    output active
);
    assign y = en?(
        s[7]?3'b111:
        (s[6]?3'b110:
        (s[5]?3'b101:
        (s[4]?3'b100:
        (s[3]?3'b011:
        (s[2]?3'b010:
        (s[1]?3'b001:
        (s[0]?3'b000:3'b000))))))))
        :3'b000;
    assign active = en & (|s);
endmodule