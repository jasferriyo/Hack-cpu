module mux2(out, d1, d2, sel);
  input d1, d2, sel;
  output out;

  and(x, ~sel, d1);
  and(y, sel, d2);
  or(out, x, y);
endmodule

module dmux8(out, d, addr);
  input d;
  input [2:0] addr;
  output [7:0] out;

  //Use msb of address
  and(x0, d, ~addr[2]);
  and(x1, d,  addr[2]);

  //Use 2nd bit of address
  and(y0, x0, ~addr[1]);
  and(y1, x0,  addr[1]);
  and(y2, x1, ~addr[1]);
  and(y3, x1,  addr[1]);

  //Use lsb of address
  and(out[0], y0, ~addr[0]);
  and(out[1], y0,  addr[0]);
  and(out[2], y1, ~addr[0]);
  and(out[3], y1,  addr[0]);
  and(out[4], y2, ~addr[0]);
  and(out[5], y2,  addr[0]);
  and(out[6], y3, ~addr[0]);
  and(out[7], y3,  addr[0]);
endmodule

module mux8(out, d0, d1, d2, d3, d4, d5, d6, d7, sel);
  input d0, d1, d2, d3, d4, d5, d6, d7;
  input [2:0] sel;
  output out;

  and(x0, d0, ~sel[0]);
  and(x1, d1,  sel[0]);
  and(x2, d2, ~sel[0]);
  and(x3, d3,  sel[0]);
  and(x4, d4, ~sel[0]);
  and(x5, d5,  sel[0]);
  and(x6, d6, ~sel[0]);
  and(x7, d7,  sel[0]);

  or(y0, x0, x1);
  or(y1, x2, x3);
  or(y2, x4, x5);
  or(y3, x6, x7);
  and(y4, y0, ~sel[1]);
  and(y5, y1,  sel[1]);
  and(y6, y2, ~sel[1]);
  and(y7, y3,  sel[1]);

  or(z0, y4, y5);
  or(z1, y6, y7);
  and(z2, z0, ~sel[2]);
  and(z3, z1,  sel[2]);

  or(out, z2, z3);
endmodule

