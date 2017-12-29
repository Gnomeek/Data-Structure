// choose.v
module choose(A1,A2,A3,A4,S,Y);
    input [3:0]A1,A2,A3,A4;
    input [1:0]S;
    output [3:0]Y;
    reg [3:0]Y;
    always@(A1,A2,A3,A4,S)
        begin
            case(S)
            0:Y=A1;
            1:Y=A2;
            2:Y=A3;
            3:Y=A4;
            endcase
         end
endmodule