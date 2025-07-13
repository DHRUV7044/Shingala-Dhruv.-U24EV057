`timescale 100us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 21:58:27
// Design Name: 
// Module Name: tralgt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// cycle like below
//red_light for 10sec > red&yellow_light for 5 sec > green_light for 10 sec > yellow_right for 5 sec  

module tralgt(
    input clk,
    input reset,
    output red_light,
    output yellow_light,
    output green_light
    );
    
    parameter r_t = 10000,
              y_t = 5000,
              g_t = 10000;
              
    parameter [1:0] l_r = 2'b00,
                    l_y = 1'b01,
                    l_g = 2'b10;
                    
    reg [1:0] cs , ns;
    reg rtg;
    integer i;
    
    always @(*) begin
        case(cs)
            l_r : begin
                ns = (i==r_t-1)?l_y:l_r;
                rtg = 1'b1;
            end
            l_y : ns = (i==y_t-1)?((rtg==1)?l_g:l_r):l_y;
            l_g : begin 
                ns = (i==g_t-1)?l_y:l_g;
                rtg = 1'b0;
            end
        endcase
    end
    
    
    
    always @(posedge clk or posedge reset) begin
        if(reset) i <=0;
        else if(((i==r_t-1)&&(cs==l_r))||((i==y_t-1)&&(cs==l_y))||((i==g_t-1)&&(cs==l_g))) i <=0;
        else i <= i+1;
        
        if(reset) cs <= l_r;
        else cs <= ns;
        
        
    end
    
    assign red_light    = (cs==l_r)|(rtg);
    assign yellow_light = (cs==l_y);
    assign green_light  = (cs==l_g);
    
endmodule
