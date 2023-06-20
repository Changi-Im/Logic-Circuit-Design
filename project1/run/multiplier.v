module mul (a, b, out, ov);
    input [15:0] a, b;
    output [15:0] out;
    output ov;
    wire [31:0] tmpHL, tmpLH, tmpLL, tmpHH, tmpHLLH, tmpout1, tmpout2;
    wire [1:0] carry;
    wire co;

    multi8x8 u0 (a[7:0], b[7:0], tmpLL);
    multi8x8 u1 (a[15:8], b[7:0], tmpHL);
    multi8x8 u2 (a[7:0], b[15:8], tmpLH);
    multi8x8 u3 (a[15:8], b[15:8], tmpHH);

    fa32 u4 (tmpHL, tmpLH, 1'b0, tmpHLLH, carry[0]);

    fa32 u5 (tmpHH<<16, tmpHLLH<<8, 1'b0, tmpout1, carry[1]);
    fa32 u6 (tmpLL, tmpout1, carry[1], tmpout2, co);
    dovm u7 (tmpout2, ov);
    
    assign out = tmpout2[15:0];
  endmodule

module dovm(out, ov);
  input [31:0] out;
  output reg ov;

  always@(*) begin
    if(out > 65535)
      ov = 1;
    else
      ov = 0;
  end
endmodule

module multi8x8 (a, b, out);
    input [7:0] a,b;
    output [31:0] out;
    wire [54:0] carry;
    wire [41:0] sum;
    wire co;

    fa1 u (a[0]&b[0], 1'b0, 1'b0, out[0], co);

    fa1 u0 (a[1]&b[0], a[0]&b[1], 1'b0, out[1], carry[0]);
    
    fa1 u1 (a[2]&b[0], a[1]&b[1], a[0]&b[2], sum[0], carry[1]);
    fa1 u2 (sum[0], 1'b0, carry[0], out[2], carry[2]);
    
    fa1 u3 (a[3]&b[0], a[2]&b[1], a[1]&b[2], sum[1], carry[3]);
    fa1 u4 (sum[1], a[0]&b[3], carry[1], sum[2], carry[4]);
    fa1 u5 (sum[2], 1'b0, carry[2], out[3], carry[5]);
    
    fa1 u6 (a[4]&b[0], a[3]&b[1], a[2]&b[2], sum[3], carry[6]);
    fa1 u7 (sum[3], a[1]&b[3], carry[3], sum[4], carry[7]);
    fa1 u8 (sum[4], a[0]&b[4], carry[4], sum[5], carry[8]);
    fa1 u9 (sum[5], 1'b0, carry[5], out[4], carry[9]);
    
    fa1 u10 (a[5]&b[0], a[4]&b[1], a[3]&b[2], sum[6], carry[10]);
    fa1 u11 (sum[6], a[2]&b[3], carry[6], sum[7], carry[11]);
    fa1 u12 (sum[7], a[1]&b[4], carry[7], sum[8], carry[12]);
    fa1 u13 (sum[8], a[0]&b[5], carry[8], sum[9], carry[13]);
    fa1 u14 (sum[9], 1'b0, carry[9], out[5], carry[14]);

    fa1 u15 (a[6]&b[0], a[5]&b[1], a[4]&b[2], sum[10], carry[15]);
    fa1 u16 (sum[10], a[3]&b[3], carry[10], sum[11], carry[16]);
    fa1 u17 (sum[11], a[2]&b[4], carry[11], sum[12], carry[17]);
    fa1 u18 (sum[12], a[1]&b[5], carry[12], sum[13], carry[18]);
    fa1 u19 (sum[13], a[0]&b[6], carry[13], sum[14], carry[19]);
    fa1 u20 (sum[14], 1'b0, carry[14], out[6], carry[20]);

    fa1 u21 (a[7]&b[0], a[6]&b[1], a[5]&b[2], sum[15], carry[21]);
    fa1 u22 (sum[15], a[4]&b[3], carry[15], sum[16], carry[22]);
    fa1 u23 (sum[16], a[3]&b[4], carry[16], sum[17], carry[23]);
    fa1 u24 (sum[17], a[2]&b[5], carry[17], sum[18], carry[24]);
    fa1 u25 (sum[18], a[1]&b[6], carry[18], sum[19], carry[25]);
    fa1 u26 (sum[19], a[0]&b[7], carry[19], sum[20], carry[26]);
    fa1 u27 (sum[20], carry[20], 1'b0, out[7], carry[27]);

    fa1 u28 (1'b0, a[7]&b[1], a[6]&b[2], sum[21], carry[28]);
    fa1 u29 (sum[21], a[5]&b[3], carry[21], sum[22], carry[29]);
    fa1 u30 (sum[22], a[4]&b[4], carry[22], sum[23], carry[30]);
    fa1 u31 (sum[23], a[3]&b[5], carry[23], sum[24], carry[31]);
    fa1 u32 (sum[24], a[2]&b[6], carry[24], sum[25], carry[32]);
    fa1 u33 (sum[25], a[1]&b[7], carry[25], sum[26], carry[33]);
    fa1 u34 (sum[26], carry[26], carry[27], out[8], carry[34]);

    fa1 u35 (a[7]&b[2], a[6]&b[3], carry[28], sum[27], carry[35]);
    fa1 u36 (sum[27], a[5]&b[4], carry[29], sum[28], carry[36]);
    fa1 u37 (sum[28], a[4]&b[5], carry[30], sum[29], carry[37]);
    fa1 u38 (sum[29], a[3]&b[6], carry[31], sum[30], carry[38]);
    fa1 u39 (sum[30], a[2]&b[7], carry[32], sum[31], carry[39]);
    fa1 u40 (sum[31], carry[33], carry[34], out[9], carry[40]);
 
    fa1 u41 (a[7]&b[3], a[6]&b[4], carry[35], sum[32], carry[41]);
    fa1 u42 (sum[32], a[5]&b[5], carry[36], sum[33], carry[42]);
    fa1 u43 (sum[33], a[4]&b[6], carry[37], sum[34], carry[43]);
    fa1 u44 (sum[34], a[3]&b[7], carry[38], sum[35], carry[44]);
    fa1 u45 (sum[35], carry[39], carry[40], out[10], carry[45]);
 
    fa1 u46 (a[7]&b[4], a[6]&b[5], carry[41], sum[36], carry[46]);
    fa1 u47 (sum[36], a[5]&b[6], carry[42], sum[37], carry[47]);
    fa1 u48 (sum[37], a[4]&b[7], carry[43], sum[38], carry[48]);
    fa1 u49 (sum[38], carry[44], carry[45], out[11], carry[49]);
   
    fa1 u50 (a[7]&b[5], a[6]&b[6], carry[46], sum[39], carry[50]);
    fa1 u51 (sum[39], a[5]&b[7], carry[47], sum[40], carry[51]);
    fa1 u52 (sum[40], carry[48], carry[49], out[12], carry[52]);
  
    fa1 u53 (a[7]&b[6], a[6]&b[7], carry[50], sum[41], carry[53]);
    fa1 u54 (sum[41], carry[51], carry[52], out[13], carry[54]);

    fa1 u55 (a[7]&b[7], carry[53], carry[54], out[14], out[15]);

    assign out[31:16] = 16'b0;
endmodule

module fa32 (a, b, ci, sum, co);
    input [31:0] a, b;
    input ci;
    output [31:0] sum;
    output co;
    wire carry;

    fa16 u0 (a[15:0], b[15:0], ci, sum[15:0], carry);
    fa16 u1 (a[31:16], b[31:16], carry, sum[31:16], co);
endmodule