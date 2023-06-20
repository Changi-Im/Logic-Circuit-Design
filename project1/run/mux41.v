module mux41(out0,out1,out2,out3,ov0,ov1,ov2,ov3,sel,out,ov);
    input [15:0] out0, out1, out2, out3;
    input ov0, ov1, ov2, ov3;
    input [1:0] sel;
    output reg [15:0] out;
    output reg ov;

    always@(*)begin
        case(sel)
            2'b00 : begin out = out0; ov = ov0; end
            2'b01 : begin out = out1; ov = ov1; end
            2'b10 : begin out = out2; ov = ov2; end
            2'b11 : begin out = out3; ov = ov3; end
        endcase
    end
endmodule
