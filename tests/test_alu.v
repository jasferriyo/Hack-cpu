module alu_tb;
  reg [15:0] x, y;
  reg zx, nx, zy, ny, f, no;
  wire [15:0] o;
  wire zr, ng;

  initial
  $monitor ("x=%b, y=%b, zx=%b, zy=%b, nx=%b, ny=%b, f=%b, no=%b, o=%b, zr=%b, ng=%b",
            x, y, zx, zy, nx, ny, f, no, o, zr, ng);

  initial
  begin
    #0
    x = 16'b1100100101111001;
    y = 16'b1011111011111111;
    zx = 1'b0;
    nx = 1'b0;
    zy = 1'b0;
    ny = 1'b0;
    f  = 1'b1;
    no = 1'b0;

    #10
    x = 16'b0000111100101000;
    y = 16'b1001111010010110;
    zx = 1'b0;
    nx = 1'b0;
    zy = 1'b1;
    ny = 1'b1;
    f  = 1'b1;
    no = 1'b0;

    #10
    x = 16'b1000101100010111;
    y = 16'b0001110000011100;
    zx = 1'b0;
    nx = 1'b1;
    zy = 1'b0;
    ny = 1'b1;
    f  = 1'b0;
    no = 1'b1;

    #10
    x = 16'b1110001110001110;
    y = 16'b1110001110001110;
    zx = 1'b0;
    nx = 1'b0;
    zy = 1'b0;
    ny = 1'b1;
    f  = 1'b1;
    no = 1'b1;

    #10 $stop;
  end

  alu inst1 (
    .o(o),
    .zr(zr),
    .ng(ng),
    .x(x),
    .y(y),
    .zx(zx),
    .nx(nx),
    .zy(zy),
    .ny(ny),
    .f(f),
    .no(no)
  );

endmodule
