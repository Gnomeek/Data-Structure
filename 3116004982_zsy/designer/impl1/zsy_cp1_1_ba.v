`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15
// File used only for Simulation


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

    wire INV_0_Y, \Q[0] , \Q[1] , \Q[2] , \Q[3] , \Y_1_i[0] , 
        \Y_1_i[2] , \Y_1_i[3] , \Y_1_i[5] , \Y_1_i[6] , CP_c, \A_c[0] , 
        \A_c[1] , \A_c[2] , \A_c[3] , MR_c, \B_c[0] , \B_c[1] , 
        \B_c[2] , \B_c[3] , \Y_c[1] , \Y_c[4] , 
        \HC4511_0/Y_1_0_1[1]_net_1 , \HC4511_0/N_52 , 
        \HC4511_0/Y_1_i_0[0]_net_1 , \HC4511_0/N_53 , \HC4511_0/N_34 , 
        \HC4511_0/N_41 , \HC4511_0/N_46 , \HC4511_0/N_28 , 
        \HC4511_0/N_45_1 , \HC4511_0/N_40 , \HC4511_0/N_42 , 
        \HC4511_0/N_29 , \HC4511_0/N_45 , \HC4511_0/N_30 , 
        \HC4511_0/N_39 , \HC4511_0/N_26_i , \HC4511_0/N_44 , 
        \HC161_0/Q_RNO_0[3]_net_1 , \HC161_0/I_13 , 
        \HC161_0/Q_RNO_0[2]_net_1 , \HC161_0/I_9 , 
        \HC161_0/Q_RNO_0[1]_net_1 , \HC161_0/I_5 , 
        \HC161_0/Q_RNO_0[0]_net_1 , \HC161_0/Q_4[3] , \HC161_0/Q_4[2] , 
        \HC161_0/Q_4[1] , \HC161_0/Q_4[0] , \HC161_0/N_4 , 
        \HC85_0/un1_A_NE_0_net_1 , \HC85_0/un1_A_3 , \HC85_0/un1_A_0 , 
        \HC85_0/un1_A_2 , \Y_pad[0]/U0/NET1 , \Y_pad[0]/U0/NET2 , 
        \B_pad[3]/U0/NET1 , \Y_pad[4]/U0/NET1 , \Y_pad[4]/U0/NET2 , 
        \dp_pad/U0/NET1 , \dp_pad/U0/NET2 , \B_pad[2]/U0/NET1 , 
        \A_pad[3]/U0/NET1 , \B_pad[1]/U0/NET1 , \Y_pad[5]/U0/NET1 , 
        \Y_pad[5]/U0/NET2 , \A_pad[0]/U0/NET1 , \dig1_pad/U0/NET1 , 
        \dig1_pad/U0/NET2 , \dig3_pad/U0/NET1 , \dig3_pad/U0/NET2 , 
        \MR_pad/U0/NET1 , \Y_pad[2]/U0/NET1 , \Y_pad[2]/U0/NET2 , 
        \Y_pad[3]/U0/NET1 , \Y_pad[3]/U0/NET2 , \dig2_pad/U0/NET1 , 
        \dig2_pad/U0/NET2 , \B_pad[0]/U0/NET1 , \A_pad[2]/U0/NET1 , 
        \CP_pad/U0/NET1 , \Y_pad[1]/U0/NET1 , \Y_pad[1]/U0/NET2 , 
        \A_pad[1]/U0/NET1 , \Y_pad[6]/U0/NET1 , \Y_pad[6]/U0/NET2 , 
        \dig4_pad/U0/NET1 , \dig4_pad/U0/NET2 , VCC, GND, AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOIN_IB \MR_pad/U0/U1  (.YIN(\MR_pad/U0/NET1 ), .Y(MR_c));
    XOR2 \HC85_0/un1_A_3_0  (.A(\Q[3] ), .B(\B_c[3] ), .Y(
        \HC85_0/un1_A_3 ));
    OR2A \HC4511_0/Y_1_i_a4_1[6]  (.A(\Q[3] ), .B(\Q[1] ), .Y(
        \HC4511_0/N_45_1 ));
    MX2 \HC161_0/Q_RNO_0[3]  (.A(\A_c[3] ), .B(\HC161_0/I_13 ), .S(
        INV_0_Y), .Y(\HC161_0/Q_RNO_0[3]_net_1 ));
    IOPAD_TRI \dig3_pad/U0/U0  (.D(\dig3_pad/U0/NET1 ), .E(
        \dig3_pad/U0/NET2 ), .PAD(dig3));
    IOPAD_TRI \dp_pad/U0/U0  (.D(\dp_pad/U0/NET1 ), .E(
        \dp_pad/U0/NET2 ), .PAD(dp));
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[0]/U0/U1  (.D(\Y_1_i[0] ), .E(VCC), .DOUT(
        \Y_pad[0]/U0/NET1 ), .EOUT(\Y_pad[0]/U0/NET2 ));
    IOIN_IB \A_pad[3]/U0/U1  (.YIN(\A_pad[3]/U0/NET1 ), .Y(\A_c[3] ));
    IOTRI_OB_EB \Y_pad[5]/U0/U1  (.D(\Y_1_i[5] ), .E(VCC), .DOUT(
        \Y_pad[5]/U0/NET1 ), .EOUT(\Y_pad[5]/U0/NET2 ));
    OA1C \HC4511_0/Y_1_i[5]  (.A(\Q[0] ), .B(\HC4511_0/N_30 ), .C(
        \HC4511_0/N_44 ), .Y(\Y_1_i[5] ));
    IOTRI_OB_EB \Y_pad[4]/U0/U1  (.D(\Y_c[4] ), .E(VCC), .DOUT(
        \Y_pad[4]/U0/NET1 ), .EOUT(\Y_pad[4]/U0/NET2 ));
    IOPAD_TRI \Y_pad[2]/U0/U0  (.D(\Y_pad[2]/U0/NET1 ), .E(
        \Y_pad[2]/U0/NET2 ), .PAD(Y[2]));
    OA1 \HC4511_0/Y_1_0_1[1]  (.A(\Q[0] ), .B(\Q[1] ), .C(
        \HC4511_0/N_52 ), .Y(\HC4511_0/Y_1_0_1[1]_net_1 ));
    AXO7 \HC4511_0/Y_1_0_o4[1]  (.A(\Q[2] ), .B(\Q[1] ), .C(\Q[3] ), 
        .Y(\HC4511_0/N_30 ));
    IOIN_IB \B_pad[1]/U0/U1  (.YIN(\B_pad[1]/U0/NET1 ), .Y(\B_c[1] ));
    IOTRI_OB_EB \Y_pad[1]/U0/U1  (.D(\Y_c[1] ), .E(VCC), .DOUT(
        \Y_pad[1]/U0/NET1 ), .EOUT(\Y_pad[1]/U0/NET2 ));
    OR3B \HC4511_0/Y_1_i_a4[6]  (.A(\Q[0] ), .B(\Q[2] ), .C(
        \HC4511_0/N_45_1 ), .Y(\HC4511_0/N_45 ));
    MX2B \HC161_0/Q_RNO_0[0]  (.A(\A_c[0] ), .B(\Q[0] ), .S(INV_0_Y), 
        .Y(\HC161_0/Q_RNO_0[0]_net_1 ));
    DFN1 \HC161_0/Q[1]  (.D(\HC161_0/Q_4[1] ), .CLK(CP_c), .Q(\Q[1] ));
    IOTRI_OB_EB \Y_pad[6]/U0/U1  (.D(\Y_1_i[6] ), .E(VCC), .DOUT(
        \Y_pad[6]/U0/NET1 ), .EOUT(\Y_pad[6]/U0/NET2 ));
    XOR2 \HC161_0/un1_Q_1_I_13  (.A(\HC161_0/N_4 ), .B(\Q[3] ), .Y(
        \HC161_0/I_13 ));
    NOR2B \HC161_0/Q_RNO[2]  (.A(MR_c), .B(\HC161_0/Q_RNO_0[2]_net_1 ), 
        .Y(\HC161_0/Q_4[2] ));
    IOIN_IB \B_pad[3]/U0/U1  (.YIN(\B_pad[3]/U0/NET1 ), .Y(\B_c[3] ));
    XOR2 \HC85_0/un1_A_2_0  (.A(\Q[2] ), .B(\B_c[2] ), .Y(
        \HC85_0/un1_A_2 ));
    XOR2 \HC161_0/un1_Q_1_I_5  (.A(\Q[0] ), .B(\Q[1] ), .Y(
        \HC161_0/I_5 ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    IOPAD_IN \CP_pad/U0/U0  (.PAD(CP), .Y(\CP_pad/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[3]/U0/U1  (.D(\Y_1_i[3] ), .E(VCC), .DOUT(
        \Y_pad[3]/U0/NET1 ), .EOUT(\Y_pad[3]/U0/NET2 ));
    XOR2 \HC85_0/un1_A_0_0  (.A(\Q[0] ), .B(\B_c[0] ), .Y(
        \HC85_0/un1_A_0 ));
    IOPAD_IN \MR_pad/U0/U0  (.PAD(MR), .Y(\MR_pad/U0/NET1 ));
    OA1B \HC4511_0/Y_1_i[2]  (.A(\HC4511_0/N_29 ), .B(\Q[1] ), .C(
        \HC4511_0/N_39 ), .Y(\Y_1_i[2] ));
    MX2 \HC161_0/Q_RNO_0[2]  (.A(\A_c[2] ), .B(\HC161_0/I_9 ), .S(
        INV_0_Y), .Y(\HC161_0/Q_RNO_0[2]_net_1 ));
    IOPAD_IN \B_pad[0]/U0/U0  (.PAD(B[0]), .Y(\B_pad[0]/U0/NET1 ));
    OR2A \HC4511_0/Y_1_0_o2[1]  (.A(\Q[2] ), .B(\Q[0] ), .Y(
        \HC4511_0/N_28 ));
    DFN1 \HC161_0/Q[0]  (.D(\HC161_0/Q_4[0] ), .CLK(CP_c), .Q(\Q[0] ));
    OR3 \HC85_0/un1_A_NE  (.A(\HC85_0/un1_A_0 ), .B(\HC85_0/un1_A_2 ), 
        .C(\HC85_0/un1_A_NE_0_net_1 ), .Y(INV_0_Y));
    IOPAD_TRI \dig1_pad/U0/U0  (.D(\dig1_pad/U0/NET1 ), .E(
        \dig1_pad/U0/NET2 ), .PAD(dig1));
    NOR2B \HC161_0/Q_RNO[3]  (.A(MR_c), .B(\HC161_0/Q_RNO_0[3]_net_1 ), 
        .Y(\HC161_0/Q_4[3] ));
    IOPAD_TRI \Y_pad[0]/U0/U0  (.D(\Y_pad[0]/U0/NET1 ), .E(
        \Y_pad[0]/U0/NET2 ), .PAD(Y[0]));
    IOPAD_IN \A_pad[3]/U0/U0  (.PAD(A[3]), .Y(\A_pad[3]/U0/NET1 ));
    IOPAD_TRI \Y_pad[5]/U0/U0  (.D(\Y_pad[5]/U0/NET1 ), .E(
        \Y_pad[5]/U0/NET2 ), .PAD(Y[5]));
    IOPAD_TRI \Y_pad[4]/U0/U0  (.D(\Y_pad[4]/U0/NET1 ), .E(
        \Y_pad[4]/U0/NET2 ), .PAD(Y[4]));
    IOIN_IB \B_pad[2]/U0/U1  (.YIN(\B_pad[2]/U0/NET1 ), .Y(\B_c[2] ));
    OR2A \HC4511_0/Y_1_0_a2_1[1]  (.A(\Q[3] ), .B(\Q[2] ), .Y(
        \HC4511_0/N_52 ));
    IOPAD_IN \B_pad[1]/U0/U0  (.PAD(B[1]), .Y(\B_pad[1]/U0/NET1 ));
    IOPAD_TRI \Y_pad[1]/U0/U0  (.D(\Y_pad[1]/U0/NET1 ), .E(
        \Y_pad[1]/U0/NET2 ), .PAD(Y[1]));
    IOPAD_TRI \Y_pad[6]/U0/U0  (.D(\Y_pad[6]/U0/NET1 ), .E(
        \Y_pad[6]/U0/NET2 ), .PAD(Y[6]));
    IOTRI_OB_EB \dig4_pad/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \dig4_pad/U0/NET1 ), .EOUT(\dig4_pad/U0/NET2 ));
    IOPAD_IN \B_pad[3]/U0/U0  (.PAD(B[3]), .Y(\B_pad[3]/U0/NET1 ));
    OR3C \HC4511_0/Y_1_0[1]  (.A(\HC4511_0/N_30 ), .B(\HC4511_0/N_28 ), 
        .C(\HC4511_0/Y_1_0_1[1]_net_1 ), .Y(\Y_c[1] ));
    OR3B \HC4511_0/Y_1_i_a4_0[6]  (.A(\Q[0] ), .B(\Q[1] ), .C(
        \HC4511_0/N_52 ), .Y(\HC4511_0/N_46 ));
    MX2A \HC4511_0/Y_1_0_m2[4]  (.A(\Q[0] ), .B(\Q[3] ), .S(\Q[2] ), 
        .Y(\HC4511_0/N_29 ));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    IOPAD_TRI \Y_pad[3]/U0/U0  (.D(\Y_pad[3]/U0/NET1 ), .E(
        \Y_pad[3]/U0/NET2 ), .PAD(Y[3]));
    AO1D \HC4511_0/Y_1_i_0[0]  (.A(\Q[3] ), .B(\HC4511_0/N_53 ), .C(
        \HC4511_0/N_34 ), .Y(\HC4511_0/Y_1_i_0[0]_net_1 ));
    XO1 \HC85_0/un1_A_NE_0  (.A(\B_c[1] ), .B(\Q[1] ), .C(
        \HC85_0/un1_A_3 ), .Y(\HC85_0/un1_A_NE_0_net_1 ));
    OA1B \HC4511_0/Y_1_i[0]  (.A(\HC4511_0/N_28 ), .B(
        \HC4511_0/N_45_1 ), .C(\HC4511_0/Y_1_i_0[0]_net_1 ), .Y(
        \Y_1_i[0] ));
    IOTRI_OB_EB \dp_pad/U0/U1  (.D(VCC), .E(VCC), .DOUT(
        \dp_pad/U0/NET1 ), .EOUT(\dp_pad/U0/NET2 ));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    DFN1 \HC161_0/Q[2]  (.D(\HC161_0/Q_4[2] ), .CLK(CP_c), .Q(\Q[2] ));
    NOR3C \HC4511_0/Y_1_i[6]  (.A(\HC4511_0/N_45 ), .B(\HC4511_0/N_40 )
        , .C(\HC4511_0/N_46 ), .Y(\Y_1_i[6] ));
    NOR2A \HC4511_0/Y_1_i_a4_0[2]  (.A(\Q[0] ), .B(\Q[3] ), .Y(
        \HC4511_0/N_39 ));
    IOTRI_OB_EB \Y_pad[2]/U0/U1  (.D(\Y_1_i[2] ), .E(VCC), .DOUT(
        \Y_pad[2]/U0/NET1 ), .EOUT(\Y_pad[2]/U0/NET2 ));
    OA1B \HC4511_0/Y_1_i_a4_0[5]  (.A(\Q[1] ), .B(\Q[3] ), .C(
        \HC4511_0/N_28 ), .Y(\HC4511_0/N_44 ));
    DFN1 \HC161_0/Q[3]  (.D(\HC161_0/Q_4[3] ), .CLK(CP_c), .Q(\Q[3] ));
    IOTRI_OB_EB \dig2_pad/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \dig2_pad/U0/NET1 ), .EOUT(\dig2_pad/U0/NET2 ));
    OR3C \HC4511_0/Y_1_0[4]  (.A(\HC4511_0/N_42 ), .B(\HC4511_0/N_29 ), 
        .C(\HC4511_0/N_52 ), .Y(\Y_c[4] ));
    IOTRI_OB_EB \dig3_pad/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \dig3_pad/U0/NET1 ), .EOUT(\dig3_pad/U0/NET2 ));
    IOTRI_OB_EB \dig1_pad/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \dig1_pad/U0/NET1 ), .EOUT(\dig1_pad/U0/NET2 ));
    IOPAD_IN \B_pad[2]/U0/U0  (.PAD(B[2]), .Y(\B_pad[2]/U0/NET1 ));
    AX1C \HC161_0/un1_Q_1_I_9  (.A(\Q[1] ), .B(\Q[0] ), .C(\Q[2] ), .Y(
        \HC161_0/I_9 ));
    NOR2B \HC161_0/Q_RNO[0]  (.A(MR_c), .B(\HC161_0/Q_RNO_0[0]_net_1 ), 
        .Y(\HC161_0/Q_4[0] ));
    CLKIO \CP_pad/U0/U1  (.A(\CP_pad/U0/NET1 ), .Y(CP_c));
    OR3A \HC4511_0/Y_1_i_a4[3]  (.A(\HC4511_0/N_26_i ), .B(\Q[1] ), .C(
        \Q[3] ), .Y(\HC4511_0/N_40 ));
    NOR3 \HC4511_0/Y_1_i_a4[0]  (.A(\Q[1] ), .B(\Q[3] ), .C(\Q[2] ), 
        .Y(\HC4511_0/N_34 ));
    OR2A \HC4511_0/Y_1_0_a4[4]  (.A(\HC4511_0/N_28 ), .B(\Q[1] ), .Y(
        \HC4511_0/N_42 ));
    MX2 \HC161_0/Q_RNO_0[1]  (.A(\A_c[1] ), .B(\HC161_0/I_5 ), .S(
        INV_0_Y), .Y(\HC161_0/Q_RNO_0[1]_net_1 ));
    NOR2B \HC161_0/Q_RNO[1]  (.A(MR_c), .B(\HC161_0/Q_RNO_0[1]_net_1 ), 
        .Y(\HC161_0/Q_4[1] ));
    XOR2 \HC4511_0/Y_1_i_x2_0[3]  (.A(\Q[2] ), .B(\Q[0] ), .Y(
        \HC4511_0/N_26_i ));
    OR3C \HC4511_0/Y_1_i_a2[3]  (.A(\Q[0] ), .B(\Q[2] ), .C(\Q[1] ), 
        .Y(\HC4511_0/N_53 ));
    NOR3C \HC4511_0/Y_1_i[3]  (.A(\HC4511_0/N_41 ), .B(\HC4511_0/N_40 )
        , .C(\HC4511_0/N_53 ), .Y(\Y_1_i[3] ));
    AND3 \HC161_0/un1_Q_1_I_12  (.A(\Q[0] ), .B(\Q[1] ), .C(\Q[2] ), 
        .Y(\HC161_0/N_4 ));
    IOPAD_TRI \dig2_pad/U0/U0  (.D(\dig2_pad/U0/NET1 ), .E(
        \dig2_pad/U0/NET2 ), .PAD(dig2));
    IOIN_IB \B_pad[0]/U0/U1  (.YIN(\B_pad[0]/U0/NET1 ), .Y(\B_c[0] ));
    IOPAD_TRI \dig4_pad/U0/U0  (.D(\dig4_pad/U0/NET1 ), .E(
        \dig4_pad/U0/NET2 ), .PAD(dig4));
    OR3A \HC4511_0/Y_1_i_a4_0[3]  (.A(\Q[1] ), .B(\HC4511_0/N_52 ), .C(
        \Q[0] ), .Y(\HC4511_0/N_41 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
