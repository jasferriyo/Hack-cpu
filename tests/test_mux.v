module mux2_tb;
  reg d1, d2, sel;
  wire out;

  initial
  $monitor ("d1=%b, d2=%b, sel=%b, out=%b",
            d1, d2, sel, out);

  initial
  begin
    #0
    d1=1;
    d2=0;
    sel=1;

    #10
    d1=1;
    d2=0;
    sel=0;

    #10
    d1=0;
    d2=1;
    sel=0;

    #10
    d1=0;
    d2=1;
    sel=1;

    #10 $stop;
  end

  mux2 inst1 (
    .out(out),
    .d1(d1),
    .d2(d2),
    .sel(sel)
  );
endmodule
