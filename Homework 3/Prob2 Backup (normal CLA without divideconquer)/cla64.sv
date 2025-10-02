module cla64 (input logic [63:0] a, b, logic cin, output logic [63:0] Sum, logic cout);

    logic [63:0] g, p, c;
    logic [15:0] g2, p2;
    logic [3:0] g3, p3;
    assign c[0] = cin;

    //logic [4:0] deadend_cout;

    rfa adders[63:0] (.g(g), .p(p), .Sum(Sum), .A(a), .B(b), .Cin(c));
    //    g, p, Sum, a, b, c[63:0]);

    bclg4 layer1_0  (g[3:0],   p[3:0],   c[0],  g2[0],  p2[0],  c[4:1]);
    bclg4 layer1_1  (g[7:4],   p[7:4],   c[4],  g2[1],  p2[1],  c[8:5]);
    bclg4 layer1_2  (g[11:8],  p[11:8],  c[8],  g2[2],  p2[2],  c[12:9]);
    bclg4 layer1_3  (g[15:12], p[15:12], c[12], g2[3],  p2[3],  c[16:13]);
    bclg4 layer1_4  (g[19:16], p[19:16], c[16], g2[4],  p2[4],  c[20:17]);
    bclg4 layer1_5  (g[23:20], p[23:20], c[20], g2[5],  p2[5],  c[24:21]);
    bclg4 layer1_6  (g[27:24], p[27:24], c[24], g2[6],  p2[6],  c[28:25]);
    bclg4 layer1_7  (g[31:28], p[31:28], c[28], g2[7],  p2[7],  c[32:29]);
    bclg4 layer1_8  (g[35:32], p[35:32], c[32], g2[8],  p2[8],  c[36:33]);
    bclg4 layer1_9  (g[39:36], p[39:36], c[36], g2[9],  p2[9],  c[40:37]);
    bclg4 layer1_10 (g[43:40], p[43:40], c[40], g2[10], p2[10], c[44:41]);
    bclg4 layer1_11 (g[47:44], p[47:44], c[44], g2[11], p2[11], c[48:45]);
    bclg4 layer1_12 (g[51:48], p[51:48], c[48], g2[12], p2[12], c[52:49]);
    bclg4 layer1_13 (g[55:52], p[55:52], c[52], g2[13], p2[13], c[56:53]);
    bclg4 layer1_14 (g[59:56], p[59:56], c[56], g2[14], p2[14], c[60:57]);
    bclg4 layer1_15 (g[63:60], p[63:60], c[60], g2[15], p2[15], {cout, c[63:61]});
/*
    bclg4 layer2_0  (g2[3:0],   p2[3:0],   c[0],  g3[0], p3[0], {c[16], c[12], c[8],  c[4]});
    bclg4 layer2_1  (g2[7:4],   p2[7:4],   c[16], g3[1], p3[1], {c[32], c[28], c[24], c[20]});
    bclg4 layer2_2  (g2[11:8],  p2[11:8],  c[32], g3[2], p3[2], {c[48], c[44], c[40], c[36]});
    bclg4 layer2_3  (g2[15:12], p2[15:12], c[48], g3[3], p3[3], {deadend_cout[1], c[60], c[56], c[52]});

    //logic [2:0] deadend_cout;
    bclg4 layer3 (.gin(g3), .pin(p3), .cin(c[0]), .cout({cout, deadend_cout[4:2]}));
*/
endmodule