module dmux8_tb;

  reg [2:0] a;
  reg d;
  wire [7:0] o;

  initial
  $monitor ("a=%b, d=%b, o=%b",
            a, d, o);

  initial
  begin
    #0
    a = 3'b000;
    d = 1'b1;

    #10
    a = 3'b001;
    d = 1'b1;

    #10
    a = 3'b010;
    d = 1'b1;

    #10
    a = 3'b011;
    d = 1'b1;

    #10
    a = 3'b100;
    d = 1'b1;

    #10
    a = 3'b101;
    d = 1'b1;

    #10
    a = 3'b110;
    d = 1'b1;

    #10
    a = 3'b111;
    d = 1'b1;

    #10
    a = 3'b000;
    d = 1'b0;

    #10
    a = 3'b001;
    d = 1'b0;

    #10
    a = 3'b010;
    d = 1'b0;

    #10
    a = 3'b011;
    d = 1'b0;

    #10
    a = 3'b100;
    d = 1'b0;

    #10
    a = 3'b101;
    d = 1'b0;

    #10
    a = 3'b110;
    d = 1'b0;

    #10
    a = 3'b111;
    d = 1'b0;

    #10 $stop;
  end

  dmux8 inst1 (
    .out(o),
    .d(d),
    .addr(a)
  );

endmodule
