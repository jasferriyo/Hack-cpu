module add_or_and(o1, o2, i1, i2, sw);
  input i1, i2, sw;
  output o1, o2;

  or(x, i2, sw);
  and(o1, x, i1);
  and(o2, i2, sw);
endmodule

module zero(out, x, tf);
  input [15:0] x;
  input tf;
  output [15:0] out;

  and(out[0], x[0], ~tf);
  and(out[1], x[1], ~tf);
  and(out[2], x[2], ~tf);
  and(out[3], x[3], ~tf);
  and(out[4], x[4], ~tf);
  and(out[5], x[5], ~tf);
  and(out[6], x[6], ~tf);
  and(out[7], x[7], ~tf);
  and(out[8], x[8], ~tf);
  and(out[9], x[9], ~tf);
  and(out[10], x[10], ~tf);
  and(out[11], x[11], ~tf);
  and(out[12], x[12], ~tf);
  and(out[13], x[13], ~tf);
  and(out[14], x[14], ~tf);
  and(out[15], x[15], ~tf);
endmodule

module negate(out, x, tf);
  input [15:0] x;
  input tf;
  output [15:0] out;

  xor(out[0], x[0], tf);
  xor(out[1], x[1], tf);
  xor(out[2], x[2], tf);
  xor(out[3], x[3], tf);
  xor(out[4], x[4], tf);
  xor(out[5], x[5], tf);
  xor(out[6], x[6], tf);
  xor(out[7], x[7], tf);
  xor(out[8], x[8], tf);
  xor(out[9], x[9], tf);
  xor(out[10], x[10], tf);
  xor(out[11], x[11], tf);
  xor(out[12], x[12], tf);
  xor(out[13], x[13], tf);
  xor(out[14], x[14], tf);
  xor(out[15], x[15], tf);
endmodule

module do_f(o1, o2, x, y, tf);
  input [15:0] x, y;
  input tf;
  output [15:0] o1, o2;

  add_or_and inst0(o1[0], o2[0], x[0], y[0], tf);
  add_or_and inst1(o1[1], o2[1], x[1], y[1], tf);
  add_or_and inst2(o1[2], o2[2], x[2], y[2], tf);
  add_or_and inst3(o1[3], o2[3], x[3], y[3], tf);
  add_or_and inst4(o1[4], o2[4], x[4], y[4], tf);
  add_or_and inst5(o1[5], o2[5], x[5], y[5], tf);
  add_or_and inst6(o1[6], o2[6], x[6], y[6], tf);
  add_or_and inst7(o1[7], o2[7], x[7], y[7], tf);
  add_or_and inst8(o1[8], o2[8], x[8], y[8], tf);
  add_or_and inst9(o1[9], o2[9], x[9], y[9], tf);
  add_or_and inst10(o1[10], o2[10], x[10], y[10], tf);
  add_or_and inst11(o1[11], o2[11], x[11], y[11], tf);
  add_or_and inst12(o1[12], o2[12], x[12], y[12], tf);
  add_or_and inst13(o1[13], o2[13], x[13], y[13], tf);
  add_or_and inst14(o1[14], o2[14], x[14], y[14], tf);
  add_or_and inst15(o1[15], o2[15], x[15], y[15], tf);
endmodule

module alu(o, zr, ng, x, y, zx, nx, zy, ny, f, no);
  input [15:0] x, y;
  input zx, nx, zy, ny, f, no;
  output [15:0] o;
  output zr, ng;
  wire [15:0] a1, a2, a3, b1, b2, b3, c;

  zero      inst1(a1, x, zx);
  zero      inst2(b1, y, zy);
  negate    inst3(a2, a1, nx);
  negate    inst4(b2, b1, ny);
  do_f      inst5(a3, b3, a2, b2, f);
  cla_16bit inst6(c, X, X, a3, b3, 1'b0);
  negate    inst7(o, c, no);
  //ng <= o[15]; Why doesn't this work?
  not(ng, ~o[15]);//This is a workaround until I figure out how to use '<='
  nor(zr, o[0], o[1], o[2], o[3],
          o[4], o[5], o[6], o[7],
          o[8], o[9], o[10], o[11],
          o[12],o[13],o[14], o[15]);
endmodule
