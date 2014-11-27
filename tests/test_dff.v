module dff_tb;

  reg a, d_in;
  wire d_out;

  initial
  $monitor ("a=%b, d_in=%b, d_out=%b",
            a, d_in, d_out);

  initial
  begin
    #0
    a = 0;
    d_in = 0;
    d_in = 1;
    d_in = 0;
    a = 1;

    #10
    a = 0;
    d_in = 0;
    d_in = 1;
    d_in = 1;
    a = 1;

    #10
    a = 1;
    d_in = 0;
    d_in = 1;
    d_in = 0;
    a = 0;

    #10
    a = 1;
    d_in = 0;
    d_in = 1;
    d_in = 1;
    a = 0;

    #10 $stop;
  end

  latch inst1 (
    .d_out(d_out),
    .active(a),
    .d_in(d_in)
  );

endmodule
