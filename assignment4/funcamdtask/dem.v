module dem(
    input e,
    input  i,
    input [3:0] s,
    output  reg [15:0] o
);
    function [15:0] demux;
        input i;
        input [3:0] s;
        begin
            demux = 16'b0;
            demux[s] = i;
        end
    endfunction

    always @(*) begin
        if (e)
            o = demux(i, s);
        else
            o = 16'b0;
    end
endmodule