module bitreg(out, in, load, clock);
  input in, load, clock;
  output out;

  mux2 inst1(x, out, in, load);
  dff  inst2(out, clock, x);
endmodule

module wordreg(out, in, load, clock);
  input [15:0] in;
  input load, clock;
  output [15:0] out;

  bitreg inst0(out[0], in[0], load, clock);
  bitreg inst1(out[1], in[1], load, clock);
  bitreg inst2(out[2], in[2], load, clock);
  bitreg inst3(out[3], in[3], load, clock);
  bitreg inst4(out[4], in[4], load, clock);
  bitreg inst5(out[5], in[5], load, clock);
  bitreg inst6(out[6], in[6], load, clock);
  bitreg inst7(out[7], in[7], load, clock);
  bitreg inst8(out[8], in[8], load, clock);
  bitreg inst9(out[9], in[9], load, clock);
  bitreg inst10(out[10], in[10], load, clock);
  bitreg inst11(out[11], in[11], load, clock);
  bitreg inst12(out[12], in[12], load, clock);
  bitreg inst13(out[13], in[13], load, clock);
  bitreg inst14(out[14], in[14], load, clock);
  bitreg inst15(out[15], in[15], load, clock);
endmodule

module ram8(out, in, load, addr, clock);
  input [15:0] in;
  input [2:0] addr;
  input load;
  input clock;
  output [15:0] out;
  wire [7:0] ibus;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;

  dmux8 selectreg(ibus, load, addr);
  wordreg reg0(o0, in, ibus[0], clock);
  wordreg reg1(o1, in, ibus[1], clock);
  wordreg reg2(o2, in, ibus[2], clock);
  wordreg reg3(o3, in, ibus[3], clock);
  wordreg reg4(o4, in, ibus[4], clock);
  wordreg reg5(o5, in, ibus[5], clock);
  wordreg reg6(o6, in, ibus[6], clock);
  wordreg reg7(o7, in, ibus[7], clock);
  mux8 obit0(out[0], o0[0], o1[0], o2[0], o3[0],
                     o4[0], o5[0], o6[0], o7[0], addr);
  mux8 obit1(out[1], o0[1], o1[1], o2[1], o3[1],
                     o4[1], o5[1], o6[1], o7[1], addr);
  mux8 obit2(out[2], o0[2], o1[2], o2[2], o3[2],
                     o4[2], o5[2], o6[2], o7[2], addr);
  mux8 obit3(out[3], o0[3], o1[3], o2[3], o3[3],
                     o4[3], o5[3], o6[3], o7[3], addr);
  mux8 obit4(out[4], o0[4], o1[4], o2[4], o3[4],
                     o4[4], o5[4], o6[4], o7[4], addr);
  mux8 obit5(out[5], o0[5], o1[5], o2[5], o3[5],
                     o4[5], o5[5], o6[5], o7[5], addr);
  mux8 obit6(out[6], o0[6], o1[6], o2[6], o3[6],
                     o4[6], o5[6], o6[6], o7[6], addr);
  mux8 obit7(out[7], o0[7], o1[7], o2[7], o3[7],
                     o4[7], o5[7], o6[7], o7[7], addr);
  mux8 obit8(out[8], o0[8], o1[8], o2[8], o3[8],
                     o4[8], o5[8], o6[8], o7[8], addr);
  mux8 obit9(out[9], o0[9], o1[9], o2[9], o3[9],
                     o4[9], o5[9], o6[9], o7[9], addr);
  mux8 obit10(out[10], o0[10], o1[10], o2[10], o3[10],
                       o4[10], o5[10], o6[10], o7[10], addr);
  mux8 obit11(out[11], o0[11], o1[11], o2[11], o3[11],
                       o4[11], o5[11], o6[11], o7[11], addr);
  mux8 obit12(out[12], o0[12], o1[12], o2[12], o3[12],
                       o4[12], o5[12], o6[12], o7[12], addr);
  mux8 obit13(out[13], o0[13], o1[13], o2[13], o3[13],
                       o4[13], o5[13], o6[13], o7[13], addr);
  mux8 obit14(out[14], o0[14], o1[14], o2[14], o3[14],
                       o4[14], o5[14], o6[14], o7[14], addr);
  mux8 obit15(out[15], o0[15], o1[15], o2[15], o3[15],
                       o4[15], o5[15], o6[15], o7[15], addr);

endmodule
