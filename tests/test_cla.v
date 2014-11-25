module cla_16bit_tb;

  reg [15:0] a, b;
  reg c;
  wire [15:0] o;
  wire g, p;

  initial
  $monitor ("a=%b, b=%b, c=%b, o=%b, g=%b, p=%b",
            a, b, c, o, g, p);

  initial
  begin
    #0
    a = 16'b1100100101111001;
    b = 16'b1011111011111111;
    c = 1'b0;

    #10
    a = 16'b1010101010101011;
    b = 16'b0101010101010101;
    c = 1'b1;

     #10
    a = 16'b1111111111111111;
    b = 16'b0000000000000000;
    c = 1'b1;

    #10 $stop;
  end

  cla_16bit inst1 (
    .o(o),
    .g16p(p),
    .g16g(g),
    .a(a),
    .b(b),
    .c_in(c)
  );

endmodule
