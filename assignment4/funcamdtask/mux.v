module mux (
    input e,
    input [15:0] i,
    input [3:0] s,
    output reg  o
);
    function [0:0] mux;
        input [15:0] i;
        input [3:0] s;
        begin
            mux = i[s];
        end
    endfunction
    always @(*) begin
        if (e)
            o =  mux(i, s);
        else
            o = 1'b0;
    end
endmodule