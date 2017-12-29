// test_compare.v
`timescale 1ns/10ps
module test_compare;
  reg [3:0]a,b;
  reg [3:0]A,B;
  wire qagb,qasb,qaeb;
  compare_8 u1(.DataA(a),.DataB(b),.DataA_0(A),.DataB_0(B),.QAGB(qagb),.QASB(qasb),.QAEB(qaeb));
  initial
    begin
        A=4'b1000;
        a=4'b0001;
        B=4'b0001;
        b=4'b1000;
        repeat(4)
            #30 A=A<<1;
                a=a>>1;
                B=B>>1;
                b=b<<1;
        repeat(4)
            #30 a=a<<1;
                A=A>>1;
                b=b>>1;
                B=B<<1;
     end
endmodule
