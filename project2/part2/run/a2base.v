module a2base(in1, clk, base64, in, cnt, inr, outr, cnt1, out7, out, base, out4260);
    input in1, clk;
    input [6:0] in;
    input [5:0] inr, base64;
    input [3:0] cnt;
    output [3:0] cnt1;
    output [5:0] outr, out, out4260;
    output [6:0] base, out7;
    
    b2a u0 (in1, clk, cnt1, out7);
    a2outr u1 (in, cnt, outr, out);
    outr2base u2(inr, cnt, out, out4260);
    base u3(base64, base);
endmodule

module base(in6, base64);
    input [5:0] in6;
    output reg [6:0] base64;
 
    always @(*) begin
        case(in6)
            0: base64 = "A";
            1: base64 = "B";
            2: base64 = "C";
            3: base64 = "D";
            4: base64 = "E";
            5: base64 = "F";
            6: base64 = "G";
            7: base64 = "H";
            8: base64 = "I";
            9: base64 = "J";
            10: base64 = "K";
            11: base64 = "L";
            12: base64 = "M";
            13: base64 = "N";
            14: base64 = "O";
            15: base64 = "P";
            16: base64 = "Q";
            17: base64 = "R";
            18: base64 = "S";
            19: base64 = "T";
            20: base64 = "U";
            21: base64 = "V";
            22: base64 = "W";
            23: base64 = "X";
            24: base64 = "Y";
            25: base64 = "Z";
            26: base64 = "a";
            27: base64 = "b";
            28: base64 = "c";
            29: base64 = "d";
            30: base64 = "e";
            31: base64 = "f";
            32: base64 = "g";
            33: base64 = "h";
            34: base64 = "i";
            35: base64 = "j";
            36: base64 = "k";
            37: base64 = "l";
            38: base64 = "m";
            39: base64 = "n";
            40: base64 = "o";
            41: base64 = "p";
            42: base64 = "q";
            43: base64 = "r";
            44: base64 = "s";
            45: base64 = "t";
            46: base64 = "u";
            47: base64 = "v";
            48: base64 = "w";
            49: base64 = "x";
            50: base64 = "y";
            51: base64 = "z";
            52: base64 = "0";
            53: base64 = "1";
            54: base64 = "2";
            55: base64 = "3";
            56: base64 = "4";
            57: base64 = "5";
            58: base64 = "6";
            59: base64 = "7";
            60: base64 = "8";
            61: base64 = "9";
            62: base64 = "+";
            63: base64 = "/";
        endcase
    end
    
endmodule

module outr2base(inr, cnt, in, out);
    input [5:0] inr, in;
    input [3:0] cnt;
    output reg [5:0] out;

    always @(*) begin
        case(cnt)
            1: begin
                out = in;
            end
            2: begin
                out = {inr[5], in[4:0]};
            end
            3: begin
                out = {inr[5:4], in[3:0]};
            end
            4: begin
                out = {inr[5:3], in[2:0]};
            end
            5: begin
                out = {inr[5:2], in[1:0]};
            end
            6: begin
                out = {inr[5:1], in[0]};
            end
            7: begin
                out = inr;
            end
        endcase
    end
endmodule

module a2outr(in, cnt1, outr, out);
    input [6:0] in;
    input [3:0] cnt1;
    output reg [5:0] outr, out;
    
    always @(*) begin
        case(cnt1)
            1:begin
                out = 0; //initialize out and outr
                outr = 0;
                out = in[6:1];
                outr[5] = in[0];
            end
            2:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[4:0] = in[6:2];
                outr[5:4] = in[1:0];
            end
            3:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[3:0] = in[6:3];
                outr[5:3] = in[2:0];
            end
            4:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[2:0] = in[6:4];
                outr[5:2] = in[3:0];
            end
            5:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[1:0] = in[6:5];
                outr[5:1] = in[4:0];
            end
            6:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[0] = in[6];
                outr= in[5:0];
            end
            7:begin
                out = 0; //initialize out and outr
                outr = 0;
                out[0] = in[6];
                outr= in[5:0];
            end
        endcase
    end
endmodule




