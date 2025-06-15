module bomu32 #(
    parameter n = 16
) (
    input  signed [n-1:0]  q,
    input  signed [n-1:0] m,
    output reg [2*(n+1)-1:0] p
);
integer i;
    reg signed [2*(n+1):0] acc;
    reg [n :0] qb , mb;
    always @(*) begin
        qb = {q[n-1] , q};
        mb = {m[n-1] , m};
        acc = { {(n+1){1'b0}}, qb, 1'b0 };
        for (i = 0; i < n+1; i = i + 1) begin
            case (acc[1:0])
                2'b01: acc[2*(n+1)-:n+1] = acc[2*(n+1)-:n+1] +  mb;
                2'b10: acc[2*(n+1)-:n+1] = acc[2*(n+1)-:n+1] -  mb;
                default: ;
            endcase
            acc = acc>>>1; 
        end
     p = acc[2*(n+1):1];
    end
endmodule