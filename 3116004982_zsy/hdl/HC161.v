module HC161(MR,CP,CEP,CET,PE,D,Q,TC);
    input MR,CP,CEP,CET,PE;
    input [3:0]D;
    output [3:0]Q;
    output TC;
    reg [3:0]Q;
    reg TC;
    always@(posedge CP)
      begin
        if(!MR)
         Q<=0;
        else if(!PE)
         Q<=D;
        else if(!CEP||!CET)
         Q<=Q;
        else
         Q<=Q+1;
      end
      always@(posedge CP)
        begin
          if(Q==4'b1110)
           TC<=1;
          else
           TC<=0;
        end
endmodule
