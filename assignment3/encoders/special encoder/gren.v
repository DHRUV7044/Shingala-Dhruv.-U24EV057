module gren(
    input en,
    input [7:0] i ,
    output [2:0] y,
    output act
);

    reg [2:0] s1;
    reg [2:0] s2;
    assign act = en & (|i);
    always @(*) begin
        if (en) begin
            casex (i)
                8'b1xxxxxxx: s1 = 3'b111;
                8'b01xxxxxx: s1 = 3'b110;
                8'b001xxxxx: s1 = 3'b101;
                8'b0001xxxx: s1 = 3'b100;
                8'b00001xxx: s1 = 3'b011;
                8'b000001xx: s1 = 3'b010;
                8'b0000001x: s1 = 3'b001;
                8'b00000001: s1 = 3'b000;
                default:     s1 = 3'b000;
            endcase
        end else begin
            s1 = 3'b000;
        end
        s2 = s1 >> 1;
    end
        assign y = s1^s2;
endmodule