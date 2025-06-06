module m4x1(
    input en ,
    input [1:0] s ,
    input [3:0] i ,
    output y
);

    assign y = en?(s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0])):0;

endmodule