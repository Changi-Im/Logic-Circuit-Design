module sub (a, b, out, ov);
    input [15:0] a, b;
    output [15:0] out;
    output ov;
    wire [4:0] carry;
    wire [1:0] co;

    fa4 u0 (a[3:0], ~b[3:0], 1'b1, out[3:0], carry[0]);
    fa4 u1 (a[7:4], ~b[7:4], carry[0], out[7:4], carry[1]);
    fa4 u2 (a[11:8], ~b[11:8], carry[1], out[11:8], carry[2]);
    fa1 u3 (a[12], ~b[12], carry[2], out[12], carry[3]);
    fa1 u4 (a[13], ~b[13], carry[3], out[13], carry[4]);
    fa1 u5 (a[14], ~b[14], carry[4], out[14], co[0]);
    fa1 u6 (a[15], ~b[15], co[0], out[15], co[1]);
    xor u7 (ov, co[0], co[1]);
endmodule

