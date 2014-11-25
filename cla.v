//Gets propogate, generate and sum bits for adding
module pg(p, g, o, i1, i2, c_in);
  input i1, i2, c_in;
  output p, g, o;

  xor(p, i1, i2);
  xor(o, p, c_in);
  and(g, i1, i2);
endmodule

//4-bit carry lookahead adder. Outputs a group propogate bit (gp),
//a group generate bit (gg) and a carry bit (c4).
module cla_4bit(o, gp, gg, c4, a, b, c_in);
  input [3:0] a, b;
  input c_in;
  output [3:0] o;
  output gp, gg, c4;
  wire [3:0] p, g;

  pg inst1(p[0], g[0], o[0], a[0], b[0], c_in);
  pg inst2(p[1], g[1], o[1], a[1], b[1], c1);
  pg inst3(p[2], g[2], o[2], a[2], b[2], c2);
  pg inst4(p[3], g[3], o[3], a[3], b[3], c3);

  and(x0, c_in, p[0]);
  and(x1, g[0], p[1]);
  and(x2, c_in, p[0], p[1]);
  and(x3, g[1], p[2]);
  and(x4, g[0], p[1], p[2]);
  and(x5, c_in, p[0], p[1], p[2]);
  and(x6, g[2], p[3]);
  and(x7, g[1], p[2], p[3]);
  and(x8, g[0], p[1], p[2], p[3]);
  and(x9, c_in, p[0], p[1], p[2], p[3]);
  and(gp, p[0], p[1], p[2], p[3]);

  or(c1, g[0], x0);
  or(c2, g[1], x1, x2);
  or(c3, g[2], x3, x4, x5);
  or(c4, g[3], x6, x7, x8, x9);
  or(gg, g[3], x6, x7, x8);
endmodule

//Put 4 4-bit cla's together with the same logic
module cla_16bit(o, g16p, g16g, a, b, c_in);
  input [15:0] a, b;
  input c_in;
  output [15:0] o;
  output g16p, g16g, c_out;
  wire [3:0] gp, gg;

  cla_4bit inst1(o[3:0], gp[0], gg[0], X, a[3:0], b[3:0], c_in);
  cla_4bit inst2(o[7:4], gp[1], gg[1], X, a[7:4], b[7:4], c4);
  cla_4bit inst3(o[11:8], gp[2], gg[2], X, a[11:8], b[11:8], c8);
  cla_4bit inst4(o[15:12], gp[3], gg[3], X, a[15:12], b[15:12], c12);

  and(x0, c_in, gp[0]);
  and(x1, gg[0], gp[1]);
  and(x2, c_in, gp[0], gp[1]);
  and(x3, gg[1], gp[2]);
  and(x4, gg[0], gp[1], gp[2]);
  and(x5, c_in, gp[0], gp[1], gp[2]);
  and(x6, gg[2], gp[3]);
  and(x7, gg[1], gp[2], gp[3]);
  and(x8, gg[0], gp[1], gp[2], gp[3]);
  and(x9, c_in, gp[0], gp[1], gp[2], gp[3]);
  and(g16p, gp[0], gp[1], gp[2], gp[3]);

  or(c4, gg[0], x0);
  or(c8, gg[1], x1, x2);
  or(c12, gg[2], x3, x4, x5);
  or(g16g, gg[3], x6, x7, x8, x9);
endmodule
