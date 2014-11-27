module ram8_tb;

  reg [15:0] in;
  reg [2:0] a;
  reg l, c;
  wire [15:0] out;

  initial
  $monitor ("out=%b, in=%b, l=%b, a=%b, c=%b",
            out, in, l, a, c);

  initial
  begin
    c =1;
    in = 16'b1100100011010101;
    a = 3'b011;
    l = 1;
    #1
    c = 0;

    #10;
    c = 1;
    in = 16'b1111100001111010;
    a = 3'b100;
    l = 1;
    #1
    c = 0;

    #10
    c = 1;
    in = 16'b1010101011100011;
    a = 3'b011;
    l = 0;
    #1
    c = 0;

    #1 $stop;
  end

  ram8 inst1 (
    .out(out),
    .in(in),
    .load(l),
    .addr(a),
    .clock(c)
  );

endmodule
