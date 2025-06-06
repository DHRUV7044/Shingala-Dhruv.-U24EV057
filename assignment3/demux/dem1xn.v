module dem1xn #(parameter N = 4) (
    input en,
    input i,
    input [$clog2(N)-1:0] s,
    output [N-1:0] y
);
    reg [N-1:0] x;
    always @(*)  begin
        x=0;
        if (en==1) begin
            x[s] = i;
        end else begin
            x[s] = 0;
        end
    end
    assign y =x;

endmodule