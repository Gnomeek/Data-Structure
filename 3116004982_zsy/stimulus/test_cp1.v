// test_cp1.v
`timescale 1ns/1ns
module test_cp1;
	reg [3:0]a,b;
	reg mr,cp;
	wire [6:0]y;
	zsy_cp1 u1(.Dn(a),.DataB(b),.MRN(mr),.CP(cp),.Seg(y));
	initial
		begin
		cp=0;
		#300 $finish;
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
