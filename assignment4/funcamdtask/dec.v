module dec(
    input e,
    input [2:0] i,
    output reg [7:0] s
);
    task decoder;
    input [3:0] in;
    output [7:0] z;
    begin
        case(in)
            4'd0 : z = 8'b00000001;
            4'd1 : z = 8'b00000010;
            4'd2 : z = 8'b00000100;
            4'd3 : z = 8'b00001000;
            4'd4 : z = 8'b00010000;
            4'd5 : z = 8'b00100000;
            4'd6 : z = 8'b01000000;
            4'd7 : z = 8'b10000000;
            default : z = 8'b00000000;
        endcase
    end
    endtask

    always @(*) begin
        if(e)
            decoder(i, s);
        else
            s = 8'b00000000; // Default output when e is low
    end
endmodule
