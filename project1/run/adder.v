module add (a, b, out, ov);
    input [15:0] a, b;
    output [15:0] out;
    output ov;
    wire co;

    fa16 u0(a, b, 1'b0, out, co);
    dova u1(co, ov);
endmodule

module dova (co, ov);
    input co;
    output reg ov;
    always @(*) begin
        if(co)
            ov = 1;
        else
            ov = 0;
    end
endmodule

module fa1 (a, b, ci, sum, co);
    input a, b, ci;
    output reg sum, co;

    always @(*) begin
        case({ci,a,b})
            3'b000 : {co, sum} = 2'b00;
            3'b001 : {co, sum} = 2'b01;
            3'b010 : {co, sum} = 2'b01;
            3'b011 : {co, sum} = 2'b10;
            3'b100 : {co, sum} = 2'b01;
            3'b101 : {co, sum} = 2'b10;
            3'b110 : {co, sum} = 2'b10;
            3'b111 : {co, sum} = 2'b11;
        endcase
    end
endmodule

module fa4 (a, b, ci, sum, co);
    input [3:0] a,b;
    input ci;
    output [3:0] sum;
    output co;
    wire [2:0] carry;

    fa1 u0 (a[0], b[0], ci, sum[0], carry[0]);
    fa1 u1 (a[1], b[1], carry[0], sum[1], carry[1]);
    fa1 u2 (a[2], b[2], carry[1], sum[2], carry[2]);
    fa1 u3 (a[3], b[3], carry[2], sum[3], co);
endmodule

module fa16 (a, b, ci, sum, co);
    input [15:0] a, b;
    input ci;
    output [15:0] sum;
    output co;
    wire [2:0] carry;

    fa4 u0 (a[3:0], b[3:0], ci, sum[3:0], carry[0]);
    fa4 u1 (a[7:4], b[7:4], carry[0], sum[7:4], carry[1]);
    fa4 u2 (a[11:8], b[11:8], carry[1], sum[11:8], carry[2]);
    fa4 u3 (a[15:12], b[15:12], carry[2], sum[15:12], co);
endmodule
