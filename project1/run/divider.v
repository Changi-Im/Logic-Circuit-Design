module div(a, b, out, ov);
    input [15:0] a, b;
    output reg [15:0] out;
    output reg ov;
    reg [31:0] a_reg, b_reg;

    always @(*) begin
        a_reg = a;
        b_reg = b;
        out = 0;
        ov = 0;
        
        if(((b_reg << 15) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 15);
            out = out + (1 << 15);
        end
        if(((b_reg << 14) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 14);
            out = out + (1 << 14);
        end
        if(((b_reg << 13) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 13);
            out = out + (1 << 13);
        end
        if(((b_reg << 12) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 12);
            out = out + (1 << 12);
        end
        if(((b_reg << 11) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 11);
            out = out + (1 << 11);
        end
        if(((b_reg << 10) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 10);
            out = out + (1 << 10);
        end
        if(((b_reg << 9) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 9);
            out = out + (1 << 9);
        end
        if(((b_reg << 8) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 8);
            out = out + (1 << 8);
        end
        if(((b_reg << 7) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 7);
            out = out + (1 << 7);
        end
        if(((b_reg << 6) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 6);
            out = out + (1 << 6);
        end
        if(((b_reg << 5) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 5);
            out = out + (1 << 5);
        end
        if(((b_reg << 4) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 4);
            out = out + (1 << 4);
        end
        if(((b_reg << 3) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b << 3);
            out = out + (1 << 3);
        end
        if(((b_reg << 2) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b << 2);
            out = out + (1 << 2);
        end
        if(((b_reg << 1) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - (b_reg << 1);
            out = out + (1 << 1);
        end
        if(((b_reg << 0) <= a_reg) && (b != 0)) begin
            a_reg = a_reg - b_reg;
            out = out + 1;
        end
        if((out == 0)) begin
            ov = 1;
        end
    end
endmodule

