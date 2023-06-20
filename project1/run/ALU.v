module ALU(ina, inb, sel, out4260, ov);
    input [15:0] ina, inb;
    input [1:0] sel;
    output [15:0] out4260;
    output ov;
    wire [15:0] out0, out1, out2, out3;
    wire ov0, ov1, ov2, ov3;
    
    add u0(ina, inb, out0, ov0);
    sub u1(ina, inb, out1, ov1);
    mul u2(ina, inb, out2, ov2);
    div u3(ina, inb, out3, ov3);
    mux41 u4(out0, out1, out2, out3, ov0, ov1, ov2, ov3, sel, out4260, ov);
endmodule


