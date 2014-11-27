module latch(d_out, active, d_in);
  input active, d_in;
  output reg d_out;
  reg z;

  and(x, ~d_in, active);
  and(y,  d_in, active);
  initial d_out = 0;
  always @(x or y) begin
    z     = ~(y | d_out);
    d_out = ~(z | x);
  end
endmodule

module dff(d_out, active, d_in);
  input active, d_in;
  output d_out;

  latch inst1(x, active, d_in);
  latch inst2(d_out, ~active, x);
endmodule
