module dem1x2(
    input en , 
    input i ,
    input s,
    output [1:0] y
);
    reg [1:0]x;
    always @(*) begin
        x = 0;
        if (en==1) begin
            x[s] = i;
        end else begin
            x[s]= 0;
        end 
    end
        assign y = x;
endmodule