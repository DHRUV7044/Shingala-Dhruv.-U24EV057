module e4x2(
    input en ,
    input [3:0] s,
    output [1:0] y,
    output active
);
    assign y = en?(s[3]?2'b11:(s[2]?2'b10:(s[1]?2'b01:(s[0]?2'b00:2'b00)))):2'b00 ;
    assign active = en & (|s);
endmodule