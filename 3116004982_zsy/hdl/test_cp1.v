//≤‚ ‘∆ΩÃ®¥˙¬Î
`timescale 1ns/1ns
module test;
  reg [3:0]a,b;
  reg mr,cp;
  wire [6:0]y;
  zsy_cp1 u_cp1(.A(a),.B(b),.MR(mr),.CP(cp),.Y(y),.dig1(dig1),.dig2(dig2),.dig3(dig3),.dig4(dig4),.dp(dp));
  initial
    begin
      cp=0;
      #400 $finish;
    end
  parameter period=20;
  always#(period/2) cp=~cp;
  initial
    begin
      mr=0;
      #25
      mr=1;
    end
  initial
    begin
      a=2;
      b=9;
    end
endmodule
