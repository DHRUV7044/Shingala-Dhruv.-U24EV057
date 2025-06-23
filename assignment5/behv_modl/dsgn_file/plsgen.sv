`timescale 1ns / 1ps


module plsgen(
    input clk,
    input reset,
    input b,
    output q
    );
    
    parameter [1:0] b0 = 2'b00,
                    c1 = 2'b01,
                    c2 = 2'b10;
    reg [1:0] s , ns ;
    reg b_neg;
    
    always @(negedge b or posedge reset) begin
        if(reset) b_neg <= 1'b0;
        else b_neg <= 1'b1;
    end
    
    always @(*) begin
        
        case(s)
            b0 : ns = b?c1:b0;
            c1 : ns = c2;
            c2 : begin 
                ns = b?(b_neg?c1:c2):b0;
                b_neg = 0;
             end
        endcase
    end        
    
    always @(posedge clk or posedge reset) begin
        if(reset)s <=2'b0;
        else s <=ns;
    end  
    assign q = (s==c1);
endmodule
