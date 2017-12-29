// decoder2_4.v
module decoder2_4(IN,OUT);
    input [1:0]IN;
    output [3:0]OUT;
    reg [3:0]OUT;
    integer I;
    always@(IN)
        begin
        for(I=0;I<=3;I=I+1)
            if(IN==I)
                OUT[I]=0;
            else
                OUT[I]=1;
         end
endmodule