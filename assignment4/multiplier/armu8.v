module armu8 #(
    parameter n = 8
) (
    input [n-1:0] a,
    input [n-1:0] b,
    output [2*n-1:0] m
);
    wire [2*n-1:0] c;
    wire [2*n-1:0] d;

    wire [(2*n)*(2*n)-1:0] p;
    wire [2*n-1:0] so;

    assign c = {{n{a[n-1]}}, a};
    assign d = {{n{b[n-1]}}, b};

    pgen #(.n(2*n)) pgen ( c ,d ,p);
    sum #(.n(2*n)) sum_product ( p , so);

    assign m = so; 
    
    
endmodule

module pgen #(
    parameter n=16
)
(
    input [n-1:0] a,
    input [n-1:0] b,
    output  reg [(n*n)-1:0] p
); 
    integer i, j;

    always @(*) begin
        p = 0;
        for (i = 0; i < n; i = i + 1) begin
            for (j = i; j < n; j = j + 1) begin
                p[i*n + j] = a[j-i] & b[i];
            end
        end
    end
endmodule

module sum #(
    parameter n=16
)(
    input [(n*n)-1:0] p,
    output  [n-1:0] sum
);
    reg [n-1:0] po [0:n-1];
    integer j;
    always @(*) begin
        for (j = 0; j<n ; j = j+1) begin
            po[j] = p[j*n +:n];
        end
    end

    genvar i;
    //reg [n-1:0] s2; 
    reg [n-1:0] s [n:0];
    wire s0;
    assign s0 =0;

    always @(*) begin
        s[0] =s0;
    end
   
    
    generate
        
        
        for (i = 0; i < n; i = i + 1) begin : sum_pro
        wire [n-1:0] g;
            fn #(.n(n)) supr (
                .a(p[i*n +:n]),
                .b(s[i]),
                .c(1'b0),
                .s(g),
                .co()
            );
            always @(*) begin
                s [i+1] <= g; 
            end
        end
    endgenerate
    assign sum = s[n];
endmodule

module fn  #(
    parameter n = 16
) (
    input [n-1:0] a,
    input [n-1:0] b,
    input c,
    output [n-1:0] s,
    output reg co
);
    wire [n:0] c_out;
    wire [n-1:0] sa;
    assign c_out[0] = c;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : adder
            f adder_inst (
                .a(a[i]),
                .b(b[i]),
                .c(c_out[i]),
                .s(sa[i]),
                .co(c_out[i+1])
            );
        end
    endgenerate

    assign s = sa;
    always @(*) begin
     co = c_out[n];
        
    end
endmodule

module f (
    input a,
    input b,
    input c,
    output reg s,
    output reg co
);
    always @(*) begin
        {co , s} = a +b +c;
    end
endmodule