module HC85(A,B,I,Q);
    input [3:0]A,B;
    input [2:0]I;
    output [2:0]Q;
    reg [2:0]Q;
    always@(A,B)
      begin
        if(A>B)
         Q=3'b100;
        else if(A<B)
         Q=3'b001;
        else if(I[1]==1)
         Q=3'b010;
        else if(I==3'b101)
         Q=3'b000;
        else if(I==0)
         Q=3'b101;
        else
         Q=I;
      end
endmodule

