Hack CPU
========

The Hack CPU is specified in the book *The Elements of Computing Systems* by Nisan & Schocken. The purpose is to build (virtually) a complete modern computer from primitive logic gates; the project is described [here](http://www.nand2tetris.org/).

I am implementing the CPU here, however I am doing things slightly different from the book:

* Using Verilog HDL instead of the book's own HDL
* Implementing the clock and DFFs which the book accepts as primitive
* Using a carry-lookahead adder instead of a ripple carry adder

You might look at the code and say something like "Hey, almost all of this can be refactored/written better!" Well, you would be correct. The reasons for that are A: I am choosing to frame everything in terms of physically realizable gates rather than Verilog programming constructs and B: I'm not very good at Verilog.
