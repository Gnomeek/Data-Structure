`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15
// File used only for Simulation


module zsy_cp1(
       CP,
       Dn,
       DataB,
       MRN,
       Seg
    );
input  CP;
input  [3:0] Dn;
input  [3:0] DataB;
input  MRN;
output [7:0] Seg;

    wire INV_0_Y, \qaux[0] , \qaux[1] , \qaux[2] , \qaux[3] , 
        \SM_8S_1_i_0[0] , \SM_8S_1_i_0[1] , \SM_8S_1_i_0[3] , 
        \HC4511_0.N_6 , CP_c, \Dn_c[0] , \Dn_c[1] , \Dn_c[2] , 
        \Dn_c[3] , \DataB_c[0] , \DataB_c[1] , \DataB_c[2] , 
        \DataB_c[3] , MRN_c, \Seg_c[4] , \Seg_c[5] , \Seg_c[6] , 
        \HC161_0.N_16 , \HC161_0.N_18_i , 
        \HC4511_0/SM_8S_1_i_0_a3_0[1]_net_1 , 
        \HC4511_0/SM_8S_1_0_i_a3_0[2] , 
        \HC4511_0/SM_8S_1_0_i_a3_0_0[2]_net_1 , \HC4511_0/N_17 , 
        \HC4511_0/SM_8S_1_i_0_0[1]_net_1 , \HC4511_0/N_48 , 
        \HC4511_0/N_70 , \HC4511_0/N_15_i_i_0 , \HC4511_0/N_74 , 
        \HC4511_0/N_33 , \HC4511_0/N_67 , \HC4511_0/N_48_1 , 
        \HC4511_0/N_13 , \HC4511_0/N_14_i , \HC4511_0/N_68 , 
        \HC161_0/qaux_n0 , \HC161_0/qaux_n1 , \HC161_0/N_17_i , 
        \HC161_0/qaux_n2 , \HC161_0/qaux_n3 , \HC161_0/N_19_i_i_0 , 
        \HC85_0/un1_DataA_NE_0_net_1 , \HC85_0/un1_DataA_2 , 
        \HC85_0/un1_DataA_0 , \HC85_0/un1_DataA_3 , 
        \DataB_pad[1]/U0/NET1 , \Seg_pad[0]/U0/NET1 , 
        \Seg_pad[0]/U0/NET2 , \Seg_pad[2]/U0/NET1 , 
        \Seg_pad[2]/U0/NET2 , \DataB_pad[2]/U0/NET1 , 
        \Seg_pad[1]/U0/NET1 , \Seg_pad[1]/U0/NET2 , 
        \Dn_pad[1]/U0/NET1 , \Seg_pad[5]/U0/NET1 , 
        \Seg_pad[5]/U0/NET2 , \DataB_pad[0]/U0/NET1 , 
        \Dn_pad[3]/U0/NET1 , \Seg_pad[7]/U0/NET1 , 
        \Seg_pad[7]/U0/NET2 , \DataB_pad[3]/U0/NET1 , 
        \MRN_pad/U0/NET1 , \Seg_pad[4]/U0/NET1 , \Seg_pad[4]/U0/NET2 , 
        \CP_pad/U0/NET1 , \Seg_pad[3]/U0/NET1 , \Seg_pad[3]/U0/NET2 , 
        \Dn_pad[0]/U0/NET1 , \Seg_pad[6]/U0/NET1 , 
        \Seg_pad[6]/U0/NET2 , VCC, \Dn_pad[2]/U0/NET1 , GND, 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    OA1 \HC4511_0/SM_8S_1_i_0[0]  (.A(\HC161_0.N_18_i ), .B(
        \HC4511_0/N_48_1 ), .C(\HC4511_0/N_33 ), .Y(\SM_8S_1_i_0[0] ));
    DFN1C0 \HC161_0/qaux[3]  (.D(\HC161_0/qaux_n3 ), .CLK(CP_c), .CLR(
        MRN_c), .Q(\qaux[3] ));
    IOIN_IB \Dn_pad[0]/U0/U1  (.YIN(\Dn_pad[0]/U0/NET1 ), .Y(\Dn_c[0] )
        );
    AO1C \HC4511_0/SM_8S_1_i_i[4]  (.A(\qaux[0] ), .B(\HC4511_0/N_13 ), 
        .C(\HC4511_0/N_68 ), .Y(\Seg_c[4] ));
    IOTRI_OB_EB \Seg_pad[5]/U0/U1  (.D(\Seg_c[5] ), .E(VCC), .DOUT(
        \Seg_pad[5]/U0/NET1 ), .EOUT(\Seg_pad[5]/U0/NET2 ));
    OR3A \HC4511_0/SM_8S_1_i_0_a3_0[3]  (.A(\qaux[3] ), .B(
        \HC4511_0/N_17 ), .C(\qaux[0] ), .Y(\HC4511_0/N_67 ));
    IOPAD_IN \Dn_pad[2]/U0/U0  (.PAD(Dn[2]), .Y(\Dn_pad[2]/U0/NET1 ));
    IOPAD_TRI \Seg_pad[1]/U0/U0  (.D(\Seg_pad[1]/U0/NET1 ), .E(
        \Seg_pad[1]/U0/NET2 ), .PAD(Seg[1]));
    OR3A \HC4511_0/SM_8S_1_i_0_a3_0[0]  (.A(\HC4511_0/N_14_i ), .B(
        \qaux[1] ), .C(\qaux[3] ), .Y(\HC4511_0/N_33 ));
    XOR2 \HC85_0/un1_DataA_0_0  (.A(\qaux[0] ), .B(\DataB_c[0] ), .Y(
        \HC85_0/un1_DataA_0 ));
    IOPAD_IN \CP_pad/U0/U0  (.PAD(CP), .Y(\CP_pad/U0/NET1 ));
    MX2 \HC4511_0/SM_8S_1_0_i[2]  (.A(
        \HC4511_0/SM_8S_1_0_i_a3_0_0[2]_net_1 ), .B(
        \HC4511_0/SM_8S_1_0_i_a3_0[2] ), .S(\qaux[3] ), .Y(
        \HC4511_0.N_6 ));
    OR2B \HC4511_0/SM_8S_1_i_0_a3_0_1[1]  (.A(\qaux[3] ), .B(\qaux[0] )
        , .Y(\HC4511_0/N_48_1 ));
    OR3C \HC161_0/qaux_n3_0_0_o2  (.A(\qaux[0] ), .B(\qaux[1] ), .C(
        \qaux[2] ), .Y(\HC161_0.N_16 ));
    IOTRI_OB_EB \Seg_pad[6]/U0/U1  (.D(\Seg_c[6] ), .E(VCC), .DOUT(
        \Seg_pad[6]/U0/NET1 ), .EOUT(\Seg_pad[6]/U0/NET2 ));
    IOTRI_OB_EB \Seg_pad[4]/U0/U1  (.D(\Seg_c[4] ), .E(VCC), .DOUT(
        \Seg_pad[4]/U0/NET1 ), .EOUT(\Seg_pad[4]/U0/NET2 ));
    IOPAD_TRI \Seg_pad[5]/U0/U0  (.D(\Seg_pad[5]/U0/NET1 ), .E(
        \Seg_pad[5]/U0/NET2 ), .PAD(Seg[5]));
    NOR2A \HC4511_0/SM_8S_1_i_0_a3_0[1]  (.A(\qaux[1] ), .B(
        \HC4511_0/N_48_1 ), .Y(\HC4511_0/N_48 ));
    IOPAD_IN \DataB_pad[2]/U0/U0  (.PAD(DataB[2]), .Y(
        \DataB_pad[2]/U0/NET1 ));
    IOTRI_OB_EB \Seg_pad[2]/U0/U1  (.D(\HC4511_0.N_6 ), .E(VCC), .DOUT(
        \Seg_pad[2]/U0/NET1 ), .EOUT(\Seg_pad[2]/U0/NET2 ));
    IOIN_IB \Dn_pad[1]/U0/U1  (.YIN(\Dn_pad[1]/U0/NET1 ), .Y(\Dn_c[1] )
        );
    XNOR2 \HC4511_0/SM_8S_1_i_i_x2[6]  (.A(\qaux[3] ), .B(
        \HC4511_0/N_13 ), .Y(\HC4511_0/N_15_i_i_0 ));
    NOR3C \HC4511_0/SM_8S_1_i_0[3]  (.A(\HC4511_0/N_33 ), .B(
        \HC161_0.N_16 ), .C(\HC4511_0/N_67 ), .Y(\SM_8S_1_i_0[3] ));
    XOR2 \HC4511_0/SM_8S_1_i_0_x2[0]  (.A(\qaux[2] ), .B(\qaux[0] ), 
        .Y(\HC4511_0/N_14_i ));
    XNOR2 \HC161_0/qaux_n3_0_0_x2  (.A(\qaux[3] ), .B(\HC161_0.N_16 ), 
        .Y(\HC161_0/N_19_i_i_0 ));
    IOPAD_IN \Dn_pad[0]/U0/U0  (.PAD(Dn[0]), .Y(\Dn_pad[0]/U0/NET1 ));
    OR2A \HC4511_0/SM_8S_1_i_i_o2[4]  (.A(\qaux[2] ), .B(\qaux[1] ), 
        .Y(\HC4511_0/N_13 ));
    IOIN_IB \DataB_pad[2]/U0/U1  (.YIN(\DataB_pad[2]/U0/NET1 ), .Y(
        \DataB_c[2] ));
    IOPAD_TRI \Seg_pad[6]/U0/U0  (.D(\Seg_pad[6]/U0/NET1 ), .E(
        \Seg_pad[6]/U0/NET2 ), .PAD(Seg[6]));
    XOR2 \HC85_0/un1_DataA_2_0  (.A(\qaux[2] ), .B(\DataB_c[2] ), .Y(
        \HC85_0/un1_DataA_2 ));
    AO1D \HC4511_0/SM_8S_1_i_0_0[1]  (.A(
        \HC4511_0/SM_8S_1_i_0_a3_0[1]_net_1 ), .B(\qaux[0] ), .C(
        \HC4511_0/N_48 ), .Y(\HC4511_0/SM_8S_1_i_0_0[1]_net_1 ));
    OA1C \HC4511_0/SM_8S_1_i_0[1]  (.A(\HC4511_0/N_74 ), .B(\qaux[3] ), 
        .C(\HC4511_0/SM_8S_1_i_0_0[1]_net_1 ), .Y(\SM_8S_1_i_0[1] ));
    DFN1C0 \HC161_0/qaux[2]  (.D(\HC161_0/qaux_n2 ), .CLK(CP_c), .CLR(
        MRN_c), .Q(\qaux[2] ));
    IOPAD_TRI \Seg_pad[4]/U0/U0  (.D(\Seg_pad[4]/U0/NET1 ), .E(
        \Seg_pad[4]/U0/NET2 ), .PAD(Seg[4]));
    IOTRI_OB_EB \Seg_pad[3]/U0/U1  (.D(\SM_8S_1_i_0[3] ), .E(VCC), 
        .DOUT(\Seg_pad[3]/U0/NET1 ), .EOUT(\Seg_pad[3]/U0/NET2 ));
    AX1E \HC161_0/qaux_n2_0_0_x2  (.A(\qaux[0] ), .B(\qaux[1] ), .C(
        \qaux[2] ), .Y(\HC161_0.N_18_i ));
    OR2A \HC4511_0/SM_8S_1_0_0_o2[5]  (.A(\qaux[1] ), .B(\qaux[2] ), 
        .Y(\HC4511_0/N_17 ));
    IOPAD_TRI \Seg_pad[2]/U0/U0  (.D(\Seg_pad[2]/U0/NET1 ), .E(
        \Seg_pad[2]/U0/NET2 ), .PAD(Seg[2]));
    XOR2 \HC161_0/qaux_n1_0_0_x2  (.A(\qaux[1] ), .B(\qaux[0] ), .Y(
        \HC161_0/N_17_i ));
    IOIN_IB \Dn_pad[3]/U0/U1  (.YIN(\Dn_pad[3]/U0/NET1 ), .Y(\Dn_c[3] )
        );
    IOPAD_IN \DataB_pad[3]/U0/U0  (.PAD(DataB[3]), .Y(
        \DataB_pad[3]/U0/NET1 ));
    AOI1B \HC4511_0/SM_8S_1_i_i_a3[6]  (.A(\qaux[2] ), .B(\qaux[0] ), 
        .C(\qaux[1] ), .Y(\HC4511_0/N_70 ));
    IOPAD_IN \Dn_pad[1]/U0/U0  (.PAD(Dn[1]), .Y(\Dn_pad[1]/U0/NET1 ));
    IOPAD_TRI \Seg_pad[3]/U0/U0  (.D(\Seg_pad[3]/U0/NET1 ), .E(
        \Seg_pad[3]/U0/NET2 ), .PAD(Seg[3]));
    NOR2A \HC4511_0/SM_8S_1_i_i_a2[6]  (.A(\qaux[0] ), .B(
        \HC4511_0/N_13 ), .Y(\HC4511_0/N_74 ));
    OR2 \HC4511_0/SM_8S_1_0_i_a3_0_0[2]  (.A(\HC4511_0/N_17 ), .B(
        \qaux[0] ), .Y(\HC4511_0/SM_8S_1_0_i_a3_0_0[2]_net_1 ));
    IOTRI_OB_EB \Seg_pad[0]/U0/U1  (.D(\SM_8S_1_i_0[0] ), .E(VCC), 
        .DOUT(\Seg_pad[0]/U0/NET1 ), .EOUT(\Seg_pad[0]/U0/NET2 ));
    IOIN_IB \DataB_pad[3]/U0/U1  (.YIN(\DataB_pad[3]/U0/NET1 ), .Y(
        \DataB_c[3] ));
    IOPAD_IN \DataB_pad[1]/U0/U0  (.PAD(DataB[1]), .Y(
        \DataB_pad[1]/U0/NET1 ));
    IOIN_IB \MRN_pad/U0/U1  (.YIN(\MRN_pad/U0/NET1 ), .Y(MRN_c));
    AO1C \HC4511_0/SM_8S_1_0_i_a3_0_1[2]  (.A(\qaux[1] ), .B(\qaux[0] )
        , .C(\qaux[2] ), .Y(\HC4511_0/SM_8S_1_0_i_a3_0[2] ));
    MX2 \HC161_0/qaux_n3_0_0  (.A(\Dn_c[3] ), .B(\HC161_0/N_19_i_i_0 ), 
        .S(INV_0_Y), .Y(\HC161_0/qaux_n3 ));
    IOTRI_OB_EB \Seg_pad[7]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \Seg_pad[7]/U0/NET1 ), .EOUT(\Seg_pad[7]/U0/NET2 ));
    XO1 \HC85_0/un1_DataA_NE_0  (.A(\DataB_c[1] ), .B(\qaux[1] ), .C(
        \HC85_0/un1_DataA_2 ), .Y(\HC85_0/un1_DataA_NE_0_net_1 ));
    MX2B \HC161_0/qaux_n2_0_0  (.A(\Dn_c[2] ), .B(\HC161_0.N_18_i ), 
        .S(INV_0_Y), .Y(\HC161_0/qaux_n2 ));
    IOPAD_IN \DataB_pad[0]/U0/U0  (.PAD(DataB[0]), .Y(
        \DataB_pad[0]/U0/NET1 ));
    IOIN_IB \DataB_pad[1]/U0/U1  (.YIN(\DataB_pad[1]/U0/NET1 ), .Y(
        \DataB_c[1] ));
    CLKIO \CP_pad/U0/U1  (.A(\CP_pad/U0/NET1 ), .Y(CP_c));
    IOIN_IB \Dn_pad[2]/U0/U1  (.YIN(\Dn_pad[2]/U0/NET1 ), .Y(\Dn_c[2] )
        );
    IOPAD_IN \MRN_pad/U0/U0  (.PAD(MRN), .Y(\MRN_pad/U0/NET1 ));
    DFN1C0 \HC161_0/qaux[0]  (.D(\HC161_0/qaux_n0 ), .CLK(CP_c), .CLR(
        MRN_c), .Q(\qaux[0] ));
    IOIN_IB \DataB_pad[0]/U0/U1  (.YIN(\DataB_pad[0]/U0/NET1 ), .Y(
        \DataB_c[0] ));
    XOR2 \HC85_0/un1_DataA_3_0  (.A(\qaux[3] ), .B(\DataB_c[3] ), .Y(
        \HC85_0/un1_DataA_3 ));
    AO1A \HC4511_0/SM_8S_1_0_0[5]  (.A(\qaux[0] ), .B(\HC4511_0/N_17 ), 
        .C(\HC4511_0/N_15_i_i_0 ), .Y(\Seg_c[5] ));
    DFN1C0 \HC161_0/qaux[1]  (.D(\HC161_0/qaux_n1 ), .CLK(CP_c), .CLR(
        MRN_c), .Q(\qaux[1] ));
    OAI1 \HC4511_0/SM_8S_1_i_i_a3[4]  (.A(\qaux[1] ), .B(\qaux[2] ), 
        .C(\qaux[3] ), .Y(\HC4511_0/N_68 ));
    IOPAD_TRI \Seg_pad[0]/U0/U0  (.D(\Seg_pad[0]/U0/NET1 ), .E(
        \Seg_pad[0]/U0/NET2 ), .PAD(Seg[0]));
    OR3 \HC85_0/un1_DataA_NE  (.A(\HC85_0/un1_DataA_0 ), .B(
        \HC85_0/un1_DataA_3 ), .C(\HC85_0/un1_DataA_NE_0_net_1 ), .Y(
        INV_0_Y));
    IOPAD_IN \Dn_pad[3]/U0/U0  (.PAD(Dn[3]), .Y(\Dn_pad[3]/U0/NET1 ));
    MX2 \HC161_0/qaux_n1_0_0  (.A(\Dn_c[1] ), .B(\HC161_0/N_17_i ), .S(
        INV_0_Y), .Y(\HC161_0/qaux_n1 ));
    MX2B \HC161_0/qaux_n0_0_0  (.A(\Dn_c[0] ), .B(\qaux[0] ), .S(
        INV_0_Y), .Y(\HC161_0/qaux_n0 ));
    IOPAD_TRI \Seg_pad[7]/U0/U0  (.D(\Seg_pad[7]/U0/NET1 ), .E(
        \Seg_pad[7]/U0/NET2 ), .PAD(Seg[7]));
    OAI1 \HC4511_0/SM_8S_1_i_0_a3_0_0[1]  (.A(\qaux[1] ), .B(\qaux[3] )
        , .C(\qaux[2] ), .Y(\HC4511_0/SM_8S_1_i_0_a3_0[1]_net_1 ));
    OR3 \HC4511_0/SM_8S_1_i_i[6]  (.A(\HC4511_0/N_70 ), .B(
        \HC4511_0/N_15_i_i_0 ), .C(\HC4511_0/N_74 ), .Y(\Seg_c[6] ));
    IOTRI_OB_EB \Seg_pad[1]/U0/U1  (.D(\SM_8S_1_i_0[1] ), .E(VCC), 
        .DOUT(\Seg_pad[1]/U0/NET1 ), .EOUT(\Seg_pad[1]/U0/NET2 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
