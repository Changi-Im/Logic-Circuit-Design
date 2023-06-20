/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Fri May 20 18:36:35 2022
/////////////////////////////////////////////////////////////


module b2a ( in, clk, cnt, out4260 );
  output [3:0] cnt;
  output [6:0] out4260;
  input in, clk;
  wire   N21, n5, n6, n7, n8, n10, n11, n12, n13, n14, n15, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39;
  assign cnt[3] = 1'b0;

  DFFX1_HVT \cnt_reg[0]  ( .D(N21), .CLK(clk), .Q(cnt[0]), .QN(n13) );
  DFFSSRX1_HVT \cnt_reg[1]  ( .D(n39), .SETB(1'b1), .RSTB(n29), .CLK(clk), .Q(
        cnt[1]), .QN(n12) );
  DFFSSRX1_HVT \cnt_reg[2]  ( .D(n38), .SETB(1'b1), .RSTB(n28), .CLK(clk), .Q(
        cnt[2]), .QN(n11) );
  DFFX1_HVT \out4260_reg[6]  ( .D(n36), .CLK(clk), .Q(out4260[6]) );
  DFFX1_HVT \out4260_reg[5]  ( .D(n35), .CLK(clk), .Q(out4260[5]) );
  DFFX1_HVT \out4260_reg[4]  ( .D(n34), .CLK(clk), .Q(out4260[4]) );
  DFFX1_HVT \out4260_reg[3]  ( .D(n33), .CLK(clk), .Q(out4260[3]) );
  DFFX1_HVT \out4260_reg[2]  ( .D(n32), .CLK(clk), .Q(out4260[2]) );
  DFFX1_HVT \out4260_reg[1]  ( .D(n31), .CLK(clk), .Q(out4260[1]) );
  DFFX1_HVT \out4260_reg[0]  ( .D(n30), .CLK(clk), .Q(out4260[0]) );
  AO22X1_HVT U13 ( .A1(out4260[0]), .A2(n14), .A3(n15), .A4(n8), .Y(n30) );
  OA21X1_HVT U14 ( .A1(n13), .A2(n11), .A3(n38), .Y(n14) );
  AO22X1_HVT U15 ( .A1(out4260[1]), .A2(n17), .A3(n15), .A4(n7), .Y(n31) );
  OA21X1_HVT U16 ( .A1(n11), .A2(cnt[0]), .A3(n39), .Y(n17) );
  AO22X1_HVT U17 ( .A1(out4260[2]), .A2(n18), .A3(n15), .A4(n6), .Y(n32) );
  OA21X1_HVT U18 ( .A1(n13), .A2(n12), .A3(n38), .Y(n18) );
  AO22X1_HVT U19 ( .A1(out4260[3]), .A2(n19), .A3(n15), .A4(n5), .Y(n33) );
  OA21X1_HVT U20 ( .A1(n12), .A2(cnt[0]), .A3(n38), .Y(n19) );
  AO22X1_HVT U21 ( .A1(out4260[4]), .A2(n20), .A3(n21), .A4(n10), .Y(n34) );
  AND2X1_HVT U22 ( .A1(n15), .A2(cnt[0]), .Y(n21) );
  AND2X1_HVT U23 ( .A1(in), .A2(n39), .Y(n15) );
  AO21X1_HVT U24 ( .A1(n38), .A2(n22), .A3(N21), .Y(n20) );
  NAND2X0_HVT U25 ( .A1(n23), .A2(n24), .Y(n35) );
  NAND3X0_HVT U26 ( .A1(n39), .A2(n25), .A3(out4260[5]), .Y(n24) );
  NAND2X0_HVT U27 ( .A1(n10), .A2(n13), .Y(n25) );
  NAND3X0_HVT U28 ( .A1(n10), .A2(in), .A3(N21), .Y(n23) );
  NAND2X0_HVT U29 ( .A1(n12), .A2(n11), .Y(n22) );
  AO22X1_HVT U30 ( .A1(out4260[6]), .A2(n39), .A3(in), .A4(n37), .Y(n36) );
  AO21X1_HVT U32 ( .A1(cnt[0]), .A2(cnt[1]), .A3(cnt[2]), .Y(n28) );
  AND2X1_HVT U33 ( .A1(n38), .A2(n13), .Y(N21) );
  INVX1_HVT U36 ( .A(n37), .Y(n38) );
  INVX1_HVT U37 ( .A(n37), .Y(n39) );
  INVX1_HVT U38 ( .A(n22), .Y(n10) );
  INVX1_HVT U39 ( .A(n14), .Y(n8) );
  INVX1_HVT U40 ( .A(n18), .Y(n6) );
  INVX1_HVT U41 ( .A(n17), .Y(n7) );
  INVX1_HVT U42 ( .A(n19), .Y(n5) );
  AND2X1_HVT U43 ( .A1(cnt[2]), .A2(cnt[1]), .Y(n37) );
  XOR2X1_HVT U44 ( .A1(cnt[1]), .A2(cnt[0]), .Y(n29) );
endmodule

