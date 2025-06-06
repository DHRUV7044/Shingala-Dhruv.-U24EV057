module bcden(
    input en,
    input [99:0] i,
    output [7:0] y,
    output act
);
    integer z;
    integer tens, units, temp;
    reg [7:0] a;
    always @(*) begin
        a = 0;
        if (en == 1) begin
             for (z = 99; z >= 0; z = z - 1) begin
                if (i[z] == 1) begin
                    // Calculate tens and units without / or %
                    
                    temp = z;
                    tens = 0;
                    while (temp >= 10) begin
                        temp = temp - 10;
                        tens = tens + 1;
                    end
                    units = temp;
                    a[3:0] = units; // lsb
                    a[7:4] = tens;  // msb
                end 
            end
        end
    end
    assign y = a;
    assign act = en&(|i);
endmodule