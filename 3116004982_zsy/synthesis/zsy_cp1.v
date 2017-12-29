`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module HC4511(
       SM_8S_1_i_0_0,
       SM_8S_1_i_0_1,
       SM_8S_1_i_0_3,
       Seg_c,
       qaux,
       N_18_i,
       N_6,
       N_16
    );
output SM_8S_1_i_0_0;
output SM_8S_1_i_0_1;
output SM_8S_1_i_0_3;
output [6:4] Seg_c;
input  [3:0] qaux;
input  N_18_i;
output N_6;
input  N_16;

    wire \SM_8S_1_i_0_a3_0[1]_net_1 , \SM_8S_1_0_i_a3_0[2] , 
        \SM_8S_1_0_i_a3_0_0[2]_net_1 , N_17, \SM_8S_1_i_0_0[1]_net_1 , 
        N_48, N_70, N_15_i_i_0, N_74, N_33, N_67, N_48_1, N_13, N_14_i, 
        N_68, GND, VCC, GND_net_1, VCC_net_1;
    
    OAI1 \SM_8S_1_i_0_a3_0_0[1]  (.A(qaux[1]), .B(qaux[3]), .C(qaux[2])
        , .Y(\SM_8S_1_i_0_a3_0[1]_net_1 ));
    NOR2A \SM_8S_1_i_i_a2[6]  (.A(qaux[0]), .B(N_13), .Y(N_74));
    XNOR2 \SM_8S_1_i_i_x2[6]  (.A(qaux[3]), .B(N_13), .Y(N_15_i_i_0));
    MX2 \SM_8S_1_0_i[2]  (.A(\SM_8S_1_0_i_a3_0_0[2]_net_1 ), .B(
        \SM_8S_1_0_i_a3_0[2] ), .S(qaux[3]), .Y(N_6));
    GND GND_i_0 (.Y(GND_net_1));
    AO1D \SM_8S_1_i_0_0[1]  (.A(\SM_8S_1_i_0_a3_0[1]_net_1 ), .B(
        qaux[0]), .C(N_48), .Y(\SM_8S_1_i_0_0[1]_net_1 ));
    AO1C \SM_8S_1_0_i_a3_0_1[2]  (.A(qaux[1]), .B(qaux[0]), .C(qaux[2])
        , .Y(\SM_8S_1_0_i_a3_0[2] ));
    OR2A \SM_8S_1_0_0_o2[5]  (.A(qaux[1]), .B(qaux[2]), .Y(N_17));
    NOR2A \SM_8S_1_i_0_a3_0[1]  (.A(qaux[1]), .B(N_48_1), .Y(N_48));
    AO1A \SM_8S_1_0_0[5]  (.A(qaux[0]), .B(N_17), .C(N_15_i_i_0), .Y(
        Seg_c[5]));
    VCC VCC_i (.Y(VCC));
    OA1 \SM_8S_1_i_0[0]  (.A(N_18_i), .B(N_48_1), .C(N_33), .Y(
        SM_8S_1_i_0_0));
    NOR3C \SM_8S_1_i_0[3]  (.A(N_33), .B(N_16), .C(N_67), .Y(
        SM_8S_1_i_0_3));
    AOI1B \SM_8S_1_i_i_a3[6]  (.A(qaux[2]), .B(qaux[0]), .C(qaux[1]), 
        .Y(N_70));
    OR2A \SM_8S_1_i_i_o2[4]  (.A(qaux[2]), .B(qaux[1]), .Y(N_13));
    GND GND_i (.Y(GND));
    XOR2 \SM_8S_1_i_0_x2[0]  (.A(qaux[2]), .B(qaux[0]), .Y(N_14_i));
    OR2 \SM_8S_1_0_i_a3_0_0[2]  (.A(N_17), .B(qaux[0]), .Y(
        \SM_8S_1_0_i_a3_0_0[2]_net_1 ));
    OA1C \SM_8S_1_i_0[1]  (.A(N_74), .B(qaux[3]), .C(
        \SM_8S_1_i_0_0[1]_net_1 ), .Y(SM_8S_1_i_0_1));
    VCC VCC_i_0 (.Y(VCC_net_1));
    OR3 \SM_8S_1_i_i[6]  (.A(N_70), .B(N_15_i_i_0), .C(N_74), .Y(
        Seg_c[6]));
    OR3A \SM_8S_1_i_0_a3_0[3]  (.A(qaux[3]), .B(N_17), .C(qaux[0]), .Y(
        N_67));
    OAI1 \SM_8S_1_i_i_a3[4]  (.A(qaux[1]), .B(qaux[2]), .C(qaux[3]), 
        .Y(N_68));
    OR3A \SM_8S_1_i_0_a3_0[0]  (.A(N_14_i), .B(qaux[1]), .C(qaux[3]), 
        .Y(N_33));
    AO1C \SM_8S_1_i_i[4]  (.A(qaux[0]), .B(N_13), .C(N_68), .Y(
        Seg_c[4]));
    OR2B \SM_8S_1_i_0_a3_0_1[1]  (.A(qaux[3]), .B(qaux[0]), .Y(N_48_1));
    
endmodule


module HC161(
       qaux,
       Dn_c,
       MRN_c,
       CP_c,
       N_16,
       N_18_i,
       INV_0_Y
    );
output [3:0] qaux;
input  [3:0] Dn_c;
input  MRN_c;
input  CP_c;
output N_16;
output N_18_i;
input  INV_0_Y;

    wire qaux_n0, qaux_n1, N_17_i, qaux_n2, qaux_n3, N_19_i_i_0, GND, 
        VCC, GND_net_1, VCC_net_1;
    
    AX1E qaux_n2_0_0_x2 (.A(qaux[0]), .B(qaux[1]), .C(qaux[2]), .Y(
        N_18_i));
    XOR2 qaux_n1_0_0_x2 (.A(qaux[1]), .B(qaux[0]), .Y(N_17_i));
    MX2B qaux_n0_0_0 (.A(Dn_c[0]), .B(qaux[0]), .S(INV_0_Y), .Y(
        qaux_n0));
    XNOR2 qaux_n3_0_0_x2 (.A(qaux[3]), .B(N_16), .Y(N_19_i_i_0));
    OR3C qaux_n3_0_0_o2 (.A(qaux[0]), .B(qaux[1]), .C(qaux[2]), .Y(
        N_16));
    DFN1C0 \qaux[0]  (.D(qaux_n0), .CLK(CP_c), .CLR(MRN_c), .Q(qaux[0])
        );
    MX2 qaux_n3_0_0 (.A(Dn_c[3]), .B(N_19_i_i_0), .S(INV_0_Y), .Y(
        qaux_n3));
    MX2B qaux_n2_0_0 (.A(Dn_c[2]), .B(N_18_i), .S(INV_0_Y), .Y(qaux_n2)
        );
    VCC VCC_i_0 (.Y(VCC_net_1));
    DFN1C0 \qaux[1]  (.D(qaux_n1), .CLK(CP_c), .CLR(MRN_c), .Q(qaux[1])
        );
    VCC VCC_i (.Y(VCC));
    DFN1C0 \qaux[3]  (.D(qaux_n3), .CLK(CP_c), .CLR(MRN_c), .Q(qaux[3])
        );
    GND GND_i_0 (.Y(GND_net_1));
    GND GND_i (.Y(GND));
    MX2 qaux_n1_0_0 (.A(Dn_c[1]), .B(N_17_i), .S(INV_0_Y), .Y(qaux_n1));
    DFN1C0 \qaux[2]  (.D(qaux_n2), .CLK(CP_c), .CLR(MRN_c), .Q(qaux[2])
        );
    
endmodule


module HC85(
       qaux,
       DataB_c,
       INV_0_Y
    );
input  [3:0] qaux;
input  [3:0] DataB_c;
output INV_0_Y;

    wire un1_DataA_NE_0_net_1, un1_DataA_2, un1_DataA_0, un1_DataA_3, 
        GND, VCC, GND_net_1, VCC_net_1;
    
    VCC VCC_i_0 (.Y(VCC_net_1));
    XOR2 un1_DataA_2_0 (.A(qaux[2]), .B(DataB_c[2]), .Y(un1_DataA_2));
    GND GND_i_0 (.Y(GND_net_1));
    XO1 un1_DataA_NE_0 (.A(DataB_c[1]), .B(qaux[1]), .C(un1_DataA_2), 
        .Y(un1_DataA_NE_0_net_1));
    XOR2 un1_DataA_3_0 (.A(qaux[3]), .B(DataB_c[3]), .Y(un1_DataA_3));
    XOR2 un1_DataA_0_0 (.A(qaux[0]), .B(DataB_c[0]), .Y(un1_DataA_0));
    VCC VCC_i (.Y(VCC));
    OR3 un1_DataA_NE (.A(un1_DataA_0), .B(un1_DataA_3), .C(
        un1_DataA_NE_0_net_1), .Y(INV_0_Y));
    GND GND_i (.Y(GND));
    
endmodule


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

    wire INV_0_Y, \qaux[0] , \qaux[1] , \qaux[2] , \qaux[3] , VCC, 
        \SM_8S_1_i_0[0] , \SM_8S_1_i_0[1] , \SM_8S_1_i_0[3] , 
        \HC4511_0.N_6 , CP_c, \Dn_c[0] , \Dn_c[1] , \Dn_c[2] , 
        \Dn_c[3] , \DataB_c[0] , \DataB_c[1] , \DataB_c[2] , 
        \DataB_c[3] , MRN_c, \Seg_c[4] , \Seg_c[5] , \Seg_c[6] , GND, 
        \HC161_0.N_16 , \HC161_0.N_18_i , GND_net_1, VCC_net_1;
    
    INBUF \Dn_pad[0]  (.PAD(Dn[0]), .Y(\Dn_c[0] ));
    OUTBUF \Seg_pad[5]  (.D(\Seg_c[5] ), .PAD(Seg[5]));
    INBUF \DataB_pad[0]  (.PAD(DataB[0]), .Y(\DataB_c[0] ));
    GND GND_i_0 (.Y(GND_net_1));
    INBUF \DataB_pad[2]  (.PAD(DataB[2]), .Y(\DataB_c[2] ));
    CLKBUF CP_pad (.PAD(CP), .Y(CP_c));
    OUTBUF \Seg_pad[2]  (.D(\HC4511_0.N_6 ), .PAD(Seg[2]));
    VCC VCC_i (.Y(VCC));
    OUTBUF \Seg_pad[4]  (.D(\Seg_c[4] ), .PAD(Seg[4]));
    OUTBUF \Seg_pad[3]  (.D(\SM_8S_1_i_0[3] ), .PAD(Seg[3]));
    HC4511 HC4511_0 (.SM_8S_1_i_0_0(\SM_8S_1_i_0[0] ), .SM_8S_1_i_0_1(
        \SM_8S_1_i_0[1] ), .SM_8S_1_i_0_3(\SM_8S_1_i_0[3] ), .Seg_c({
        \Seg_c[6] , \Seg_c[5] , \Seg_c[4] }), .qaux({\qaux[3] , 
        \qaux[2] , \qaux[1] , \qaux[0] }), .N_18_i(\HC161_0.N_18_i ), 
        .N_6(\HC4511_0.N_6 ), .N_16(\HC161_0.N_16 ));
    OUTBUF \Seg_pad[6]  (.D(\Seg_c[6] ), .PAD(Seg[6]));
    GND GND_i (.Y(GND));
    HC161 HC161_0 (.qaux({\qaux[3] , \qaux[2] , \qaux[1] , \qaux[0] }), 
        .Dn_c({\Dn_c[3] , \Dn_c[2] , \Dn_c[1] , \Dn_c[0] }), .MRN_c(
        MRN_c), .CP_c(CP_c), .N_16(\HC161_0.N_16 ), .N_18_i(
        \HC161_0.N_18_i ), .INV_0_Y(INV_0_Y));
    VCC VCC_i_0 (.Y(VCC_net_1));
    INBUF \DataB_pad[3]  (.PAD(DataB[3]), .Y(\DataB_c[3] ));
    INBUF \Dn_pad[3]  (.PAD(Dn[3]), .Y(\Dn_c[3] ));
    OUTBUF \Seg_pad[1]  (.D(\SM_8S_1_i_0[1] ), .PAD(Seg[1]));
    INBUF \Dn_pad[1]  (.PAD(Dn[1]), .Y(\Dn_c[1] ));
    OUTBUF \Seg_pad[7]  (.D(GND), .PAD(Seg[7]));
    OUTBUF \Seg_pad[0]  (.D(\SM_8S_1_i_0[0] ), .PAD(Seg[0]));
    INBUF MRN_pad (.PAD(MRN), .Y(MRN_c));
    INBUF \Dn_pad[2]  (.PAD(Dn[2]), .Y(\Dn_c[2] ));
    HC85 HC85_0 (.qaux({\qaux[3] , \qaux[2] , \qaux[1] , \qaux[0] }), 
        .DataB_c({\DataB_c[3] , \DataB_c[2] , \DataB_c[1] , 
        \DataB_c[0] }), .INV_0_Y(INV_0_Y));
    INBUF \DataB_pad[1]  (.PAD(DataB[1]), .Y(\DataB_c[1] ));
    
endmodule
