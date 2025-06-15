module enc(
    input e,
    input [7:0] i,
    output reg [2:0] s
    );
    task encoder;
    input [7:0] in;
    output [3:0] z;
    begin
    
        casex(in)
        8'b1xxxxxxx : z = 3'd7;
        8'b01xxxxxx : z = 3'd6;
        8'b001xxxxx : z = 3'd5;
        8'b0001xxxx : z = 3'd4;
        8'b00001xxx : z = 3'd3;
        8'b000001xx : z = 3'd2;
        8'b0000001x : z = 3'd1;
        8'b00000001 : z = 3'd0;
        default :     z = 3'd0;
        endcase
        end
        endtask
        
        always @(*) begin
            if(e)
                encoder(i ,s);
            else
                s = 3'd0;
        end
endmodule