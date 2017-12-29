module HC4511(LE,BI,LT,A,Y);
    input LE,BI,LT;
    input [3:0]A;
    output [6:0]Y;
    reg [6:0]Y;
    always@(LE,BI,LT,A)
      begin
        if(!LT)
         Y=7'b1111111;
        else if(!BI)
         Y=0;
        else if(LE)
         Y=Y;
        else
         case (A)
          4'd0:Y=7'b1111110;//Êý×Ö°´abcdefgË³Ðò
          4'd1:Y=7'b0110000;
          4'd2:Y=7'b1101101;
          4'd3:Y=7'b1111001;
          4'd4:Y=7'b0110011;
          4'd5:Y=7'b1011011;
          4'd6:Y=7'b1011111;
          4'd7:Y=7'b1110000;
          4'd8:Y=7'b1111111;
          4'd9:Y=7'b1111011;
          4'd10:Y=7'b1110111;
          4'd11:Y=7'b0011111;
          4'd12:Y=7'b1001110;
          4'd13:Y=7'b0111101;
          4'd14:Y=7'b1001111;
          4'd15:Y=7'b1000111;
         default:;
         endcase
      end
endmodule
