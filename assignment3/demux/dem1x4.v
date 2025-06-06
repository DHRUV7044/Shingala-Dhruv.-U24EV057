module dem1x4(
    input en,
    input i,
    input [1:0] s,
    output [3:0] y
);

    reg [3:0] x;
    always @(*) begin
        x = 0;
        if (en == 1) begin
            x[s] = i;
        end else begin
            x[s] = 0;
        end
    end
    assign y =x;

endmodule