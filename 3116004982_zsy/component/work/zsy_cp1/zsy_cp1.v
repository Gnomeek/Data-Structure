`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module zsy_cp1(
       CP,
       dig1,
       A,
       MR,
       B,
       Y,
       dig2,
       dig3,
       dig4,
       dp
    );
input  CP;
output dig1;
input  [3:0] A;
input  MR;
input  [3:0] B;
output [6:0] Y;
output dig2;
output dig3;
output dig4;
output dp;

    wire \HC161_0_Q_[3] , \HC161_0_Q_[2] , \HC161_0_Q_[1] , 
        \HC161_0_Q_[0] , HC85_0_Q1to1, INV_0_Y, GND_net;
    assign dig1 = GND_net;
    assign dig2 = GND_net;
    assign dig3 = GND_net;
    assign dig4 = GND_net;
    
    VCC VCC (.Y(dp));
    INV INV_0 (.A(HC85_0_Q1to1), .Y(INV_0_Y));
    GND GND (.Y(GND_net));
    HC85 HC85_0 (.A({\HC161_0_Q_[3] , \HC161_0_Q_[2] , \HC161_0_Q_[1] , 
        \HC161_0_Q_[0] }), .B({B[3], B[2], B[1], B[0]}), .I({GND_net, 
        dp, GND_net}), .Q({nc0, HC85_0_Q1to1, nc1}));
    HC4511 HC4511_0 (.LE(GND_net), .BI(dp), .LT(dp), .A({
        \HC161_0_Q_[3] , \HC161_0_Q_[2] , \HC161_0_Q_[1] , 
        \HC161_0_Q_[0] }), .Y({Y[6], Y[5], Y[4], Y[3], Y[2], Y[1], 
        Y[0]}));
    HC161 HC161_0 (.MR(MR), .CP(CP), .CEP(dp), .CET(dp), .PE(INV_0_Y), 
        .D({A[3], A[2], A[1], A[0]}), .Q({\HC161_0_Q_[3] , 
        \HC161_0_Q_[2] , \HC161_0_Q_[1] , \HC161_0_Q_[0] }), .TC());
    
endmodule
