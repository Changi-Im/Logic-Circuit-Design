/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Fri May 20 18:24:16 2022
/////////////////////////////////////////////////////////////


module b2a ( in, clk, cnt, out4260 );
  output [3:0] cnt;
  output [6:0] out4260;
  input in, clk;
  wire   N21, n11, n12, n13, n14, n15, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n2, n5, n6, n7,
         n8, n9, n10;
  assign cnt[3] = 1'b0;

  DFFX1_HVT \cnt_reg[0]  ( .D(N21), .CLK(clk), .Q(cnt[0]), .QN(n13) );
  DFFSSRX1_HVT \cnt_reg[1]  ( .D(n5), .SETB(1'b1), .RSTB(n29), .CLK(clk), .Q(
        cnt[1]), .QN(n12) );
  DFFSSRX1_HVT \cnt_reg[2]  ( .D(n2), .SETB(1'b1), .RSTB(n28), .CLK(clk), .Q(
        cnt[2]), .QN(n11) );
  DFFX1_HVT \out4260_reg[6]  ( .D(n36), .CLK(clk), .Q(out4260[6]) );
  DFFX1_HVT \out4260_reg[5]  ( .D(n35), .CLK(clk), .Q(out4260[5]) );
  DFFX1_HVT \out4260_reg[4]  ( .D(n34), .CLK(clk), .Q(out4260[4]) );
  DFFX1_HVT \out4260_reg[3]  ( .D(n33), .CLK(clk), .Q(out4260[3]) );
  DFFX1_HVT \out4260_reg[2]  ( .D(n32), .CLK(clk), .Q(out4260[2]) );
  DFFX1_HVT \out4260_reg[1]  ( .D(n31), .CLK(clk), .Q(out4260[1]) );
  DFFX1_HVT \out4260_reg[0]  ( .D(n30), .CLK(clk), .Q(out4260[0]) );
  AO22X1_HVT U13 ( .A1(out4260[0]), .A2(n14), .A3(n15), .A4(n6), .Y(n30) );
  OA21X1_HVT U14 ( .A1(n13), .A2(n11), .A3(n2), .Y(n14) );
  AO22X1_HVT U15 ( .A1(out4260[1]), .A2(n17), .A3(n15), .A4(n8), .Y(n31) );
  OA21X1_HVT U16 ( .A1(n11), .A2(cnt[0]), .A3(n2), .Y(n17) );
  AO22X1_HVT U17 ( .A1(out4260[2]), .A2(n18), .A3(n15), .A4(n7), .Y(n32) );
  OA21X1_HVT U18 ( .A1(n13), .A2(n12), .A3(n5), .Y(n18) );
  AO22X1_HVT U19 ( .A1(out4260[3]), .A2(n19), .A3(n15), .A4(n9), .Y(n33) );
  OA21X1_HVT U20 ( .A1(n12), .A2(cnt[0]), .A3(n2), .Y(n19) );
  AO22X1_HVT U21 ( .A1(out4260[4]), .A2(n20), .A3(n21), .A4(n10), .Y(n34) );
  AND2X1_HVT U22 ( .A1(n15), .A2(cnt[0]), .Y(n21) );
  AND2X1_HVT U23 ( .A1(in), .A2(n5), .Y(n15) );
  AO21X1_HVT U24 ( .A1(n2), .A2(n22), .A3(N21), .Y(n20) );
  NAND2X0_HVT U25 ( .A1(n23), .A2(n24), .Y(n35) );
  NAND3X0_HVT U26 ( .A1(n5), .A2(n25), .A3(out4260[5]), .Y(n24) );
  NAND2X0_HVT U27 ( .A1(n10), .A2(n13), .Y(n25) );
  NAND3X0_HVT U28 ( .A1(n10), .A2(in), .A3(N21), .Y(n23) );
  NAND2X0_HVT U29 ( .A1(n12), .A2(n11), .Y(n22) );
  AO22X1_HVT U30 ( .A1(out4260[6]), .A2(n5), .A3(in), .A4(n1), .Y(n36) );
  AO21X1_HVT U32 ( .A1(cnt[0]), .A2(cnt[1]), .A3(cnt[2]), .Y(n28) );
  AND2X1_HVT U33 ( .A1(n2), .A2(n13), .Y(N21) );
  INVX1_HVT U5 ( .A(n1), .Y(n2) );
  INVX1_HVT U7 ( .A(n1), .Y(n5) );
  INVX1_HVT U8 ( .A(n22), .Y(n10) );
  INVX1_HVT U9 ( .A(n14), .Y(n6) );
  INVX1_HVT U10 ( .A(n18), .Y(n7) );
  INVX1_HVT U11 ( .A(n17), .Y(n8) );
  INVX1_HVT U12 ( .A(n19), .Y(n9) );
  AND2X1_HVT U31 ( .A1(cnt[2]), .A2(cnt[1]), .Y(n1) );
  XOR2X1_HVT U34 ( .A1(cnt[1]), .A2(cnt[0]), .Y(n29) );
endmodule


module a2outr ( in, cnt1, outr, out );
  input [6:0] in;
  input [3:0] cnt1;
  output [5:0] outr;
  output [5:0] out;
  wire   N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n1,
         n2, n3;

  LATCHX1_HVT \out_reg[5]  ( .CLK(N51), .D(N44), .Q(out[5]) );
  LATCHX1_HVT \out_reg[4]  ( .CLK(N51), .D(N43), .Q(out[4]) );
  LATCHX1_HVT \out_reg[3]  ( .CLK(N51), .D(N42), .Q(out[3]) );
  LATCHX1_HVT \out_reg[2]  ( .CLK(N51), .D(N41), .Q(out[2]) );
  LATCHX1_HVT \out_reg[1]  ( .CLK(N51), .D(N40), .Q(out[1]) );
  LATCHX1_HVT \out_reg[0]  ( .CLK(N51), .D(N39), .Q(out[0]) );
  LATCHX1_HVT \outr_reg[5]  ( .CLK(N51), .D(N50), .Q(outr[5]) );
  LATCHX1_HVT \outr_reg[4]  ( .CLK(N51), .D(N49), .Q(outr[4]) );
  LATCHX1_HVT \outr_reg[3]  ( .CLK(N51), .D(N48), .Q(outr[3]) );
  LATCHX1_HVT \outr_reg[2]  ( .CLK(N51), .D(N47), .Q(outr[2]) );
  LATCHX1_HVT \outr_reg[1]  ( .CLK(N51), .D(N46), .Q(outr[1]) );
  LATCHX1_HVT \outr_reg[0]  ( .CLK(N51), .D(N45), .Q(outr[0]) );
  AND3X1_HVT U7 ( .A1(n2), .A2(n1), .A3(n3), .Y(n4) );
  NAND2X0_HVT U8 ( .A1(n5), .A2(n6), .Y(N50) );
  AOI222X1_HVT U9 ( .A1(n7), .A2(in[3]), .A3(n8), .A4(in[5]), .A5(n9), .A6(
        in[4]), .Y(n6) );
  AOI222X1_HVT U10 ( .A1(n10), .A2(in[0]), .A3(n11), .A4(in[2]), .A5(n12), 
        .A6(in[1]), .Y(n5) );
  AO221X1_HVT U11 ( .A1(in[1]), .A2(n11), .A3(in[0]), .A4(n12), .A5(n13), .Y(
        N49) );
  AO222X1_HVT U12 ( .A1(in[3]), .A2(n9), .A3(in[4]), .A4(n8), .A5(in[2]), .A6(
        n7), .Y(n13) );
  AO221X1_HVT U13 ( .A1(in[1]), .A2(n7), .A3(in[0]), .A4(n11), .A5(n14), .Y(
        N48) );
  AO22X1_HVT U14 ( .A1(in[2]), .A2(n9), .A3(in[3]), .A4(n8), .Y(n14) );
  AO222X1_HVT U15 ( .A1(in[1]), .A2(n9), .A3(in[2]), .A4(n8), .A5(in[0]), .A6(
        n7), .Y(N47) );
  AO22X1_HVT U16 ( .A1(in[0]), .A2(n9), .A3(in[1]), .A4(n8), .Y(N46) );
  AND2X1_HVT U17 ( .A1(in[0]), .A2(n8), .Y(N45) );
  AND2X1_HVT U18 ( .A1(in[6]), .A2(n10), .Y(N44) );
  AO22X1_HVT U19 ( .A1(n10), .A2(in[5]), .A3(in[6]), .A4(n12), .Y(N43) );
  AO222X1_HVT U20 ( .A1(n12), .A2(in[5]), .A3(in[6]), .A4(n11), .A5(n10), .A6(
        in[4]), .Y(N42) );
  AO221X1_HVT U21 ( .A1(n12), .A2(in[4]), .A3(n10), .A4(in[3]), .A5(n15), .Y(
        N41) );
  AO22X1_HVT U22 ( .A1(n11), .A2(in[5]), .A3(in[6]), .A4(n7), .Y(n15) );
  AO221X1_HVT U23 ( .A1(n12), .A2(in[3]), .A3(n10), .A4(in[2]), .A5(n16), .Y(
        N40) );
  AO222X1_HVT U24 ( .A1(n7), .A2(in[5]), .A3(in[6]), .A4(n9), .A5(n11), .A6(
        in[4]), .Y(n16) );
  NAND2X0_HVT U25 ( .A1(n17), .A2(n18), .Y(N39) );
  AOI222X1_HVT U26 ( .A1(in[4]), .A2(n7), .A3(n8), .A4(in[6]), .A5(in[5]), 
        .A6(n9), .Y(n18) );
  AND3X1_HVT U27 ( .A1(cnt1[2]), .A2(n2), .A3(cnt1[0]), .Y(n9) );
  AND2X1_HVT U28 ( .A1(cnt1[2]), .A2(cnt1[1]), .Y(n8) );
  AND3X1_HVT U29 ( .A1(n3), .A2(n2), .A3(cnt1[2]), .Y(n7) );
  AOI222X1_HVT U30 ( .A1(in[1]), .A2(n10), .A3(in[3]), .A4(n11), .A5(in[2]), 
        .A6(n12), .Y(n17) );
  AND3X1_HVT U31 ( .A1(n3), .A2(n1), .A3(cnt1[1]), .Y(n12) );
  AND3X1_HVT U32 ( .A1(cnt1[1]), .A2(n1), .A3(cnt1[0]), .Y(n11) );
  AND3X1_HVT U33 ( .A1(n2), .A2(n1), .A3(cnt1[0]), .Y(n10) );
  NOR2X2_HVT U3 ( .A1(cnt1[3]), .A2(n4), .Y(N51) );
  INVX1_HVT U4 ( .A(cnt1[1]), .Y(n2) );
  INVX1_HVT U5 ( .A(cnt1[2]), .Y(n1) );
  INVX1_HVT U6 ( .A(cnt1[0]), .Y(n3) );
endmodule


module outr2base ( inr, cnt, in, out );
  input [5:0] inr;
  input [3:0] cnt;
  input [5:0] in;
  output [5:0] out;
  wire   N39, N40, N41, N42, N43, N44, N45, n2, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18;

  LATCHX1_HVT \out_reg[5]  ( .CLK(N45), .D(N44), .Q(out[5]) );
  LATCHX1_HVT \out_reg[4]  ( .CLK(N45), .D(N43), .Q(out[4]) );
  LATCHX1_HVT \out_reg[3]  ( .CLK(N45), .D(N42), .Q(out[3]) );
  LATCHX1_HVT \out_reg[2]  ( .CLK(N45), .D(N41), .Q(out[2]) );
  LATCHX1_HVT \out_reg[1]  ( .CLK(N45), .D(N40), .Q(out[1]) );
  LATCHX1_HVT \out_reg[0]  ( .CLK(N45), .D(N39), .Q(out[0]) );
  NOR2X0_HVT U3 ( .A1(cnt[3]), .A2(n2), .Y(N45) );
  NOR3X0_HVT U5 ( .A1(cnt[0]), .A2(cnt[2]), .A3(cnt[1]), .Y(n2) );
  INVX1_HVT U4 ( .A(n3), .Y(n14) );
  INVX1_HVT U6 ( .A(n4), .Y(n16) );
  INVX1_HVT U7 ( .A(n1), .Y(n15) );
  INVX1_HVT U8 ( .A(n10), .Y(n18) );
  INVX1_HVT U9 ( .A(n7), .Y(n13) );
  INVX1_HVT U10 ( .A(cnt[1]), .Y(n12) );
  INVX1_HVT U11 ( .A(cnt[2]), .Y(n17) );
  INVX1_HVT U12 ( .A(cnt[0]), .Y(n11) );
  NAND2X0_HVT U13 ( .A1(cnt[1]), .A2(cnt[2]), .Y(n3) );
  NAND2X0_HVT U14 ( .A1(cnt[0]), .A2(n14), .Y(n1) );
  AO22X1_HVT U15 ( .A1(in[0]), .A2(n1), .A3(inr[0]), .A4(n15), .Y(N39) );
  AO22X1_HVT U16 ( .A1(in[1]), .A2(n3), .A3(inr[1]), .A4(n14), .Y(N40) );
  NAND2X0_HVT U17 ( .A1(n12), .A2(n11), .Y(n6) );
  NAND2X0_HVT U18 ( .A1(cnt[2]), .A2(n6), .Y(n4) );
  AO22X1_HVT U19 ( .A1(in[2]), .A2(n4), .A3(inr[2]), .A4(n16), .Y(N41) );
  AO22X1_HVT U20 ( .A1(inr[3]), .A2(cnt[2]), .A3(in[3]), .A4(n17), .Y(n5) );
  OA21X1_HVT U21 ( .A1(n6), .A2(inr[3]), .A3(n5), .Y(N42) );
  OA22X1_HVT U22 ( .A1(n11), .A2(n12), .A3(n6), .A4(inr[4]), .Y(n7) );
  AO22X1_HVT U23 ( .A1(n13), .A2(cnt[1]), .A3(cnt[2]), .A4(n7), .Y(n9) );
  AND2X1_HVT U24 ( .A1(n7), .A2(n17), .Y(n8) );
  AO22X1_HVT U25 ( .A1(inr[4]), .A2(n9), .A3(n8), .A4(in[4]), .Y(N43) );
  NAND2X0_HVT U26 ( .A1(n12), .A2(n17), .Y(n10) );
  AO22X1_HVT U27 ( .A1(inr[5]), .A2(n10), .A3(in[5]), .A4(n18), .Y(N44) );
endmodule


module base ( in6, base64 );
  input [5:0] in6;
  output [6:0] base64;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18;

  NAND2X0_HVT U21 ( .A1(n19), .A2(n3), .Y(base64[5]) );
  NAND3X0_HVT U22 ( .A1(in6[4]), .A2(n20), .A3(in6[3]), .Y(n19) );
  AO22X1_HVT U23 ( .A1(in6[4]), .A2(n21), .A3(in6[3]), .A4(n22), .Y(base64[4])
         );
  AO22X1_HVT U24 ( .A1(in6[5]), .A2(n23), .A3(in6[0]), .A4(n6), .Y(n22) );
  NAND2X0_HVT U25 ( .A1(n24), .A2(n25), .Y(n23) );
  AO21X1_HVT U26 ( .A1(n12), .A2(n18), .A3(n26), .Y(n25) );
  NAND2X0_HVT U27 ( .A1(n26), .A2(n7), .Y(n24) );
  AND2X1_HVT U28 ( .A1(in6[1]), .A2(in6[2]), .Y(n26) );
  NAND2X0_HVT U29 ( .A1(in6[3]), .A2(n20), .Y(n21) );
  NAND2X0_HVT U30 ( .A1(n15), .A2(n13), .Y(n20) );
  OR2X1_HVT U31 ( .A1(n27), .A2(n28), .Y(base64[3]) );
  OAI222X1_HVT U32 ( .A1(n29), .A2(n14), .A3(n30), .A4(n31), .A5(n32), .A6(n33), .Y(n28) );
  AND3X1_HVT U33 ( .A1(n34), .A2(n33), .A3(n35), .Y(n31) );
  NAND4X0_HVT U34 ( .A1(n36), .A2(n37), .A3(n38), .A4(n39), .Y(n27) );
  AO22X1_HVT U35 ( .A1(n40), .A2(n41), .A3(n14), .A4(n30), .Y(n37) );
  AO21X1_HVT U36 ( .A1(n29), .A2(n42), .A3(n43), .Y(n36) );
  AND3X1_HVT U37 ( .A1(n34), .A2(n44), .A3(n35), .Y(n29) );
  NAND3X0_HVT U38 ( .A1(n45), .A2(n46), .A3(n47), .Y(base64[2]) );
  OA221X1_HVT U39 ( .A1(n48), .A2(n30), .A3(n49), .A4(n43), .A5(n50), .Y(n47)
         );
  OR2X1_HVT U40 ( .A1(n51), .A2(n14), .Y(n46) );
  NAND3X0_HVT U41 ( .A1(n52), .A2(n45), .A3(n53), .Y(base64[1]) );
  AOI222X1_HVT U42 ( .A1(n1), .A2(n54), .A3(n17), .A4(n55), .A5(n16), .A6(n56), 
        .Y(n53) );
  NAND4X0_HVT U43 ( .A1(n33), .A2(n57), .A3(n58), .A4(n44), .Y(n56) );
  NAND3X0_HVT U44 ( .A1(n41), .A2(n58), .A3(n50), .Y(n55) );
  OR2X1_HVT U45 ( .A1(n59), .A2(n60), .Y(n58) );
  OA21X1_HVT U46 ( .A1(n61), .A2(n62), .A3(n34), .Y(n49) );
  NAND2X0_HVT U47 ( .A1(n2), .A2(n11), .Y(n34) );
  AND2X1_HVT U48 ( .A1(n63), .A2(n64), .Y(n62) );
  AND4X1_HVT U49 ( .A1(n38), .A2(n39), .A3(n65), .A4(n66), .Y(n45) );
  OA22X1_HVT U50 ( .A1(n30), .A2(n44), .A3(n14), .A4(n48), .Y(n66) );
  AND2X1_HVT U51 ( .A1(n40), .A2(n42), .Y(n48) );
  AO21X1_HVT U52 ( .A1(n63), .A2(n64), .A3(n59), .Y(n42) );
  NAND2X0_HVT U53 ( .A1(n2), .A2(n10), .Y(n40) );
  NAND2X0_HVT U54 ( .A1(n3), .A2(n7), .Y(n63) );
  NAND2X0_HVT U55 ( .A1(n32), .A2(n67), .Y(n54) );
  AO21X1_HVT U56 ( .A1(n60), .A2(n57), .A3(n61), .Y(n44) );
  NAND2X0_HVT U57 ( .A1(n9), .A2(n13), .Y(n61) );
  AO21X1_HVT U58 ( .A1(n51), .A2(n50), .A3(n43), .Y(n65) );
  NAND2X0_HVT U59 ( .A1(n11), .A2(n5), .Y(n50) );
  NAND2X0_HVT U60 ( .A1(n16), .A2(n4), .Y(n39) );
  NAND2X0_HVT U61 ( .A1(in6[0]), .A2(in6[1]), .Y(n43) );
  OR3X1_HVT U62 ( .A1(n57), .A2(n30), .A3(n68), .Y(n38) );
  OA22X1_HVT U63 ( .A1(n51), .A2(n30), .A3(n33), .A4(n32), .Y(n52) );
  NAND2X0_HVT U64 ( .A1(in6[0]), .A2(n15), .Y(n32) );
  OR2X1_HVT U65 ( .A1(n64), .A2(n68), .Y(n33) );
  NAND2X0_HVT U66 ( .A1(n15), .A2(n18), .Y(n30) );
  OA21X1_HVT U67 ( .A1(n69), .A2(n70), .A3(n35), .Y(n51) );
  OR2X1_HVT U68 ( .A1(n59), .A2(n57), .Y(n35) );
  AND2X1_HVT U69 ( .A1(n64), .A2(n57), .Y(n70) );
  NAND2X0_HVT U70 ( .A1(in6[5]), .A2(n7), .Y(n57) );
  NAND2X0_HVT U71 ( .A1(in6[4]), .A2(n3), .Y(n64) );
  AO222X1_HVT U72 ( .A1(n17), .A2(n8), .A3(in6[0]), .A4(n71), .A5(base64[6]), 
        .A6(n18), .Y(base64[0]) );
  AO21X1_HVT U73 ( .A1(n8), .A2(n69), .A3(n60), .Y(base64[6]) );
  AO21X1_HVT U74 ( .A1(n5), .A2(n72), .A3(n4), .Y(n71) );
  NAND2X0_HVT U75 ( .A1(n10), .A2(n5), .Y(n41) );
  NAND2X0_HVT U76 ( .A1(in6[3]), .A2(in6[2]), .Y(n69) );
  NAND2X0_HVT U77 ( .A1(in6[5]), .A2(in6[4]), .Y(n60) );
  NAND2X0_HVT U78 ( .A1(n68), .A2(n59), .Y(n72) );
  NAND2X0_HVT U79 ( .A1(in6[2]), .A2(n9), .Y(n59) );
  NAND2X0_HVT U80 ( .A1(in6[3]), .A2(n13), .Y(n68) );
  NAND2X0_HVT U81 ( .A1(in6[1]), .A2(n18), .Y(n67) );
  INVX1_HVT U3 ( .A(n41), .Y(n4) );
  INVX1_HVT U4 ( .A(n63), .Y(n2) );
  INVX1_HVT U5 ( .A(n54), .Y(n14) );
  INVX1_HVT U6 ( .A(n72), .Y(n8) );
  INVX1_HVT U7 ( .A(n60), .Y(n5) );
  INVX1_HVT U8 ( .A(n68), .Y(n11) );
  INVX1_HVT U9 ( .A(n43), .Y(n16) );
  INVX1_HVT U10 ( .A(n20), .Y(n12) );
  INVX1_HVT U11 ( .A(n69), .Y(n10) );
  INVX1_HVT U12 ( .A(n67), .Y(n17) );
  INVX1_HVT U13 ( .A(n49), .Y(n1) );
  INVX1_HVT U14 ( .A(n24), .Y(n6) );
  INVX1_HVT U15 ( .A(in6[0]), .Y(n18) );
  INVX1_HVT U16 ( .A(in6[1]), .Y(n15) );
  INVX1_HVT U17 ( .A(in6[5]), .Y(n3) );
  INVX1_HVT U18 ( .A(in6[2]), .Y(n13) );
  INVX1_HVT U19 ( .A(in6[4]), .Y(n7) );
  INVX1_HVT U20 ( .A(in6[3]), .Y(n9) );
endmodule


module a2base ( in1, clk, base64, in, cnt, inr, outr, cnt1, out7, out, base, 
        out4260 );
  input [5:0] base64;
  input [6:0] in;
  input [3:0] cnt;
  input [5:0] inr;
  output [5:0] outr;
  output [3:0] cnt1;
  output [6:0] out7;
  output [5:0] out;
  output [6:0] base;
  output [5:0] out4260;
  input in1, clk;

  wire   SYNOPSYS_UNCONNECTED__0;
  assign cnt1[3] = 1'b0;

  b2a u0 ( .in(in1), .clk(clk), .cnt({SYNOPSYS_UNCONNECTED__0, cnt1[2:0]}), 
        .out4260(out7) );
  a2outr u1 ( .in(in), .cnt1(cnt), .outr(outr), .out(out) );
  outr2base u2 ( .inr(inr), .cnt(cnt), .in(out), .out(out4260) );
  base u3 ( .in6(base64), .base64(base) );
endmodule

