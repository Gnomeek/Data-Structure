`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module HC85(
       DataB_0_c,
       DataA_0_c,
       QAEB_c,
       QAGB_c,
       QASB_c,
       HC85_0_QAGB,
       HC85_0_QASB,
       un1_DataA_NE_0_0,
       un1_DataA_NE_1
    );
input  [3:0] DataB_0_c;
input  [3:0] DataA_0_c;
output QAEB_c;
output QAGB_c;
output QASB_c;
input  HC85_0_QAGB;
input  HC85_0_QASB;
input  un1_DataA_NE_0_0;
input  un1_DataA_NE_1;

    wire un1_DataA_NE_0_net_1, un1_DataA_1_i, QAGB_0_a3_0_net_1, 
        QASB_0_a3_0_net_1, un1_DataA_NE_net_1, un1_DataA_3_i, 
        un1_DataA_2_i, QAGB17, QAGB16, \ACT_LT4_E[3] , \ACT_LT4_E[6] , 
        \ACT_LT4_E[10] , \ACT_LT4_E[7] , \ACT_LT4_E[8] , 
        \ACT_LT4_E[5] , \ACT_LT4_E[4] , \ACT_LT4_E[0] , \ACT_LT4_E[1] , 
        \ACT_LT4_E[2] , \ACT_LT4_E_0[3] , \ACT_LT4_E_0[6] , 
        \ACT_LT4_E_0[10] , \ACT_LT4_E_0[7] , \ACT_LT4_E_0[8] , 
        \ACT_LT4_E_0[5] , \ACT_LT4_E_0[4] , \ACT_LT4_E_0[0] , 
        \ACT_LT4_E_0[1] , \ACT_LT4_E_0[2] , GND, VCC, GND_net_1, 
        VCC_net_1;
    
    AND2A QAGB17_0_I_3 (.A(DataB_0_c[1]), .B(DataA_0_c[1]), .Y(
        \ACT_LT4_E[2] ));
    OR2A QAGB17_0_I_5 (.A(DataB_0_c[2]), .B(DataA_0_c[2]), .Y(
        \ACT_LT4_E[4] ));
    OR2A QAGB17_0_I_2 (.A(DataB_0_c[1]), .B(DataA_0_c[1]), .Y(
        \ACT_LT4_E[1] ));
    OR2A QAGB16_0_I_9 (.A(DataB_0_c[3]), .B(DataA_0_c[3]), .Y(
        \ACT_LT4_E_0[8] ));
    NOR2A QAGB16_0_I_7 (.A(\ACT_LT4_E_0[4] ), .B(\ACT_LT4_E_0[5] ), .Y(
        \ACT_LT4_E_0[6] ));
    VCC VCC_i (.Y(VCC));
    XNOR2 un1_DataA_2_0 (.A(DataB_0_c[2]), .B(DataA_0_c[2]), .Y(
        un1_DataA_2_i));
    OR2A QAGB16_0_I_2 (.A(DataA_0_c[1]), .B(DataB_0_c[1]), .Y(
        \ACT_LT4_E_0[1] ));
    AO1D QASB_0_a3_0 (.A(un1_DataA_NE_1), .B(un1_DataA_NE_0_0), .C(
        HC85_0_QAGB), .Y(QASB_0_a3_0_net_1));
    NOR2A QAGB16_0_I_1 (.A(DataA_0_c[0]), .B(DataB_0_c[0]), .Y(
        \ACT_LT4_E_0[0] ));
    OR3C un1_DataA_NE (.A(un1_DataA_3_i), .B(un1_DataA_2_i), .C(
        un1_DataA_NE_0_net_1), .Y(un1_DataA_NE_net_1));
    AOI1A QAGB17_0_I_11 (.A(\ACT_LT4_E[3] ), .B(\ACT_LT4_E[6] ), .C(
        \ACT_LT4_E[10] ), .Y(QAGB17));
    OR2A QAGB17_0_I_9 (.A(DataA_0_c[3]), .B(DataB_0_c[3]), .Y(
        \ACT_LT4_E[8] ));
    AOI1A QAGB17_0_I_4 (.A(\ACT_LT4_E[0] ), .B(\ACT_LT4_E[1] ), .C(
        \ACT_LT4_E[2] ), .Y(\ACT_LT4_E[3] ));
    XNOR2 un1_DataA_1_0 (.A(DataB_0_c[1]), .B(DataA_0_c[1]), .Y(
        un1_DataA_1_i));
    NOR3 un1_DataA_NE_RNIGI39 (.A(un1_DataA_NE_0_0), .B(un1_DataA_NE_1)
        , .C(un1_DataA_NE_net_1), .Y(QAEB_c));
    GND GND_i (.Y(GND));
    XA1A un1_DataA_NE_0 (.A(DataA_0_c[0]), .B(DataB_0_c[0]), .C(
        un1_DataA_1_i), .Y(un1_DataA_NE_0_net_1));
    AOI1A QAGB17_0_I_10 (.A(\ACT_LT4_E[7] ), .B(\ACT_LT4_E[8] ), .C(
        \ACT_LT4_E[5] ), .Y(\ACT_LT4_E[10] ));
    XNOR2 un1_DataA_3_0 (.A(DataB_0_c[3]), .B(DataA_0_c[3]), .Y(
        un1_DataA_3_i));
    NOR2A QAGB17_0_I_6 (.A(DataB_0_c[3]), .B(DataA_0_c[3]), .Y(
        \ACT_LT4_E[5] ));
    AOI1A QAGB16_0_I_11 (.A(\ACT_LT4_E_0[3] ), .B(\ACT_LT4_E_0[6] ), 
        .C(\ACT_LT4_E_0[10] ), .Y(QAGB16));
    AO1D un1_DataA_NE_RNISII73_0 (.A(QAGB_0_a3_0_net_1), .B(
        un1_DataA_NE_net_1), .C(QAGB16), .Y(QAGB_c));
    OR2A QAGB16_0_I_5 (.A(DataA_0_c[2]), .B(DataB_0_c[2]), .Y(
        \ACT_LT4_E_0[4] ));
    NOR2A QAGB16_0_I_6 (.A(DataA_0_c[3]), .B(DataB_0_c[3]), .Y(
        \ACT_LT4_E_0[5] ));
    AO1D un1_DataA_NE_RNISII73 (.A(QASB_0_a3_0_net_1), .B(
        un1_DataA_NE_net_1), .C(QAGB17), .Y(QASB_c));
    AO1D QAGB_0_a3_0 (.A(un1_DataA_NE_1), .B(un1_DataA_NE_0_0), .C(
        HC85_0_QASB), .Y(QAGB_0_a3_0_net_1));
    AND2A QAGB16_0_I_3 (.A(DataA_0_c[1]), .B(DataB_0_c[1]), .Y(
        \ACT_LT4_E_0[2] ));
    NOR2A QAGB17_0_I_7 (.A(\ACT_LT4_E[4] ), .B(\ACT_LT4_E[5] ), .Y(
        \ACT_LT4_E[6] ));
    NOR2A QAGB17_0_I_1 (.A(DataB_0_c[0]), .B(DataA_0_c[0]), .Y(
        \ACT_LT4_E[0] ));
    AOI1A QAGB16_0_I_4 (.A(\ACT_LT4_E_0[0] ), .B(\ACT_LT4_E_0[1] ), .C(
        \ACT_LT4_E_0[2] ), .Y(\ACT_LT4_E_0[3] ));
    AOI1A QAGB16_0_I_10 (.A(\ACT_LT4_E_0[7] ), .B(\ACT_LT4_E_0[8] ), 
        .C(\ACT_LT4_E_0[5] ), .Y(\ACT_LT4_E_0[10] ));
    VCC VCC_i_0 (.Y(VCC_net_1));
    NOR2A QAGB17_0_I_8 (.A(DataA_0_c[2]), .B(DataB_0_c[2]), .Y(
        \ACT_LT4_E[7] ));
    NOR2A QAGB16_0_I_8 (.A(DataB_0_c[2]), .B(DataA_0_c[2]), .Y(
        \ACT_LT4_E_0[7] ));
    GND GND_i_0 (.Y(GND_net_1));
    
endmodule


module HC85_1(
       DataB_c,
       DataA_c,
       HC85_0_QAGB,
       HC85_0_QASB,
       un1_DataA_NE_0,
       un1_DataA_NE_1
    );
input  [3:0] DataB_c;
input  [3:0] DataA_c;
output HC85_0_QAGB;
output HC85_0_QASB;
output un1_DataA_NE_0;
output un1_DataA_NE_1;

    wire un1_DataA_3, un1_DataA_1, \ACT_LT4_E[3] , \ACT_LT4_E[6] , 
        \ACT_LT4_E[10] , \ACT_LT4_E[7] , \ACT_LT4_E[8] , 
        \ACT_LT4_E[5] , \ACT_LT4_E[4] , \ACT_LT4_E[0] , \ACT_LT4_E[1] , 
        \ACT_LT4_E[2] , \ACT_LT4_E_0[3] , \ACT_LT4_E_0[6] , 
        \ACT_LT4_E_0[10] , \ACT_LT4_E_0[7] , \ACT_LT4_E_0[8] , 
        \ACT_LT4_E_0[5] , \ACT_LT4_E_0[4] , \ACT_LT4_E_0[0] , 
        \ACT_LT4_E_0[1] , \ACT_LT4_E_0[2] , GND, VCC, GND_net_1, 
        VCC_net_1;
    
    OR2A QAGB17_0_I_2 (.A(DataB_c[1]), .B(DataA_c[1]), .Y(
        \ACT_LT4_E[1] ));
    NOR2A QAGB17_0_I_7 (.A(\ACT_LT4_E[4] ), .B(\ACT_LT4_E[5] ), .Y(
        \ACT_LT4_E[6] ));
    OR2A QAGB16_0_I_2 (.A(DataA_c[1]), .B(DataB_c[1]), .Y(
        \ACT_LT4_E_0[1] ));
    OR2A QAGB17_0_I_9 (.A(DataA_c[3]), .B(DataB_c[3]), .Y(
        \ACT_LT4_E[8] ));
    NOR2A QAGB17_0_I_6 (.A(DataB_c[3]), .B(DataA_c[3]), .Y(
        \ACT_LT4_E[5] ));
    AOI1A QAGB17_0_I_11 (.A(\ACT_LT4_E[3] ), .B(\ACT_LT4_E[6] ), .C(
        \ACT_LT4_E[10] ), .Y(HC85_0_QASB));
    NOR2A QAGB16_0_I_1 (.A(DataA_c[0]), .B(DataB_c[0]), .Y(
        \ACT_LT4_E_0[0] ));
    AOI1A QAGB17_0_I_4 (.A(\ACT_LT4_E[0] ), .B(\ACT_LT4_E[1] ), .C(
        \ACT_LT4_E[2] ), .Y(\ACT_LT4_E[3] ));
    GND GND_i_0 (.Y(GND_net_1));
    VCC VCC_i (.Y(VCC));
    OR2A QAGB17_0_I_5 (.A(DataB_c[2]), .B(DataA_c[2]), .Y(
        \ACT_LT4_E[4] ));
    AND2A QAGB16_0_I_3 (.A(DataA_c[1]), .B(DataB_c[1]), .Y(
        \ACT_LT4_E_0[2] ));
    XOR2 un1_DataA_1_0 (.A(DataB_c[1]), .B(DataA_c[1]), .Y(un1_DataA_1)
        );
    NOR2A QAGB16_0_I_8 (.A(DataB_c[2]), .B(DataA_c[2]), .Y(
        \ACT_LT4_E_0[7] ));
    NOR2A QAGB16_0_I_6 (.A(DataA_c[3]), .B(DataB_c[3]), .Y(
        \ACT_LT4_E_0[5] ));
    AOI1A QAGB16_0_I_10 (.A(\ACT_LT4_E_0[7] ), .B(\ACT_LT4_E_0[8] ), 
        .C(\ACT_LT4_E_0[5] ), .Y(\ACT_LT4_E_0[10] ));
    NOR2A QAGB17_0_I_8 (.A(DataA_c[2]), .B(DataB_c[2]), .Y(
        \ACT_LT4_E[7] ));
    NOR2A QAGB17_0_I_1 (.A(DataB_c[0]), .B(DataA_c[0]), .Y(
        \ACT_LT4_E[0] ));
    GND GND_i (.Y(GND));
    VCC VCC_i_0 (.Y(VCC_net_1));
    OR2A QAGB16_0_I_5 (.A(DataA_c[2]), .B(DataB_c[2]), .Y(
        \ACT_LT4_E_0[4] ));
    AOI1A QAGB16_0_I_4 (.A(\ACT_LT4_E_0[0] ), .B(\ACT_LT4_E_0[1] ), .C(
        \ACT_LT4_E_0[2] ), .Y(\ACT_LT4_E_0[3] ));
    OR2A QAGB16_0_I_9 (.A(DataB_c[3]), .B(DataA_c[3]), .Y(
        \ACT_LT4_E_0[8] ));
    NOR2A QAGB16_0_I_7 (.A(\ACT_LT4_E_0[4] ), .B(\ACT_LT4_E_0[5] ), .Y(
        \ACT_LT4_E_0[6] ));
    AOI1A QAGB17_0_I_10 (.A(\ACT_LT4_E[7] ), .B(\ACT_LT4_E[8] ), .C(
        \ACT_LT4_E[5] ), .Y(\ACT_LT4_E[10] ));
    AOI1A QAGB16_0_I_11 (.A(\ACT_LT4_E_0[3] ), .B(\ACT_LT4_E_0[6] ), 
        .C(\ACT_LT4_E_0[10] ), .Y(HC85_0_QAGB));
    XO1 un1_DataA_NE_0_inst_1 (.A(DataA_c[0]), .B(DataB_c[0]), .C(
        un1_DataA_1), .Y(un1_DataA_NE_0));
    XO1 un1_DataA_NE_1_inst_1 (.A(DataA_c[2]), .B(DataB_c[2]), .C(
        un1_DataA_3), .Y(un1_DataA_NE_1));
    XOR2 un1_DataA_3_0 (.A(DataB_c[3]), .B(DataA_c[3]), .Y(un1_DataA_3)
        );
    AND2A QAGB17_0_I_3 (.A(DataB_c[1]), .B(DataA_c[1]), .Y(
        \ACT_LT4_E[2] ));
    
endmodule


module compare_8(
       DataA,
       DataB,
       DataA_0,
       DataB_0,
       QAEB,
       QAGB,
       QASB
    );
input  [3:0] DataA;
input  [3:0] DataB;
input  [3:0] DataA_0;
input  [3:0] DataB_0;
output QAEB;
output QAGB;
output QASB;

    wire HC85_0_QAGB, HC85_0_QASB, VCC, GND, \DataA_c[0] , 
        \DataA_c[1] , \DataA_c[2] , \DataA_c[3] , \DataB_c[0] , 
        \DataB_c[1] , \DataB_c[2] , \DataB_c[3] , \DataA_0_c[0] , 
        \DataA_0_c[1] , \DataA_0_c[2] , \DataA_0_c[3] , \DataB_0_c[0] , 
        \DataB_0_c[1] , \DataB_0_c[2] , \DataB_0_c[3] , QAEB_c, QAGB_c, 
        QASB_c, \HC85_1.un1_DataA_NE_0 , \HC85_1.un1_DataA_NE_1 , 
        GND_net_1, VCC_net_1;
    
    HC85 HC85_2 (.DataB_0_c({\DataB_0_c[3] , \DataB_0_c[2] , 
        \DataB_0_c[1] , \DataB_0_c[0] }), .DataA_0_c({\DataA_0_c[3] , 
        \DataA_0_c[2] , \DataA_0_c[1] , \DataA_0_c[0] }), .QAEB_c(
        QAEB_c), .QAGB_c(QAGB_c), .QASB_c(QASB_c), .HC85_0_QAGB(
        HC85_0_QAGB), .HC85_0_QASB(HC85_0_QASB), .un1_DataA_NE_0_0(
        \HC85_1.un1_DataA_NE_0 ), .un1_DataA_NE_1(
        \HC85_1.un1_DataA_NE_1 ));
    INBUF \DataA_0_pad[2]  (.PAD(DataA_0[2]), .Y(\DataA_0_c[2] ));
    INBUF \DataA_pad[0]  (.PAD(DataA[0]), .Y(\DataA_c[0] ));
    INBUF \DataA_0_pad[0]  (.PAD(DataA_0[0]), .Y(\DataA_0_c[0] ));
    INBUF \DataB_pad[0]  (.PAD(DataB[0]), .Y(\DataB_c[0] ));
    GND GND_i_0 (.Y(GND_net_1));
    INBUF \DataB_pad[2]  (.PAD(DataB[2]), .Y(\DataB_c[2] ));
    VCC VCC_i (.Y(VCC));
    INBUF \DataB_0_pad[2]  (.PAD(DataB_0[2]), .Y(\DataB_0_c[2] ));
    INBUF \DataA_0_pad[1]  (.PAD(DataA_0[1]), .Y(\DataA_0_c[1] ));
    INBUF \DataA_pad[2]  (.PAD(DataA[2]), .Y(\DataA_c[2] ));
    OUTBUF QASB_pad (.D(QASB_c), .PAD(QASB));
    GND GND_i (.Y(GND));
    INBUF \DataB_0_pad[3]  (.PAD(DataB_0[3]), .Y(\DataB_0_c[3] ));
    VCC VCC_i_0 (.Y(VCC_net_1));
    HC85_1 HC85_1 (.DataB_c({\DataB_c[3] , \DataB_c[2] , \DataB_c[1] , 
        \DataB_c[0] }), .DataA_c({\DataA_c[3] , \DataA_c[2] , 
        \DataA_c[1] , \DataA_c[0] }), .HC85_0_QAGB(HC85_0_QAGB), 
        .HC85_0_QASB(HC85_0_QASB), .un1_DataA_NE_0(
        \HC85_1.un1_DataA_NE_0 ), .un1_DataA_NE_1(
        \HC85_1.un1_DataA_NE_1 ));
    INBUF \DataB_pad[3]  (.PAD(DataB[3]), .Y(\DataB_c[3] ));
    INBUF \DataB_0_pad[0]  (.PAD(DataB_0[0]), .Y(\DataB_0_c[0] ));
    INBUF \DataA_pad[3]  (.PAD(DataA[3]), .Y(\DataA_c[3] ));
    INBUF \DataA_pad[1]  (.PAD(DataA[1]), .Y(\DataA_c[1] ));
    INBUF \DataA_0_pad[3]  (.PAD(DataA_0[3]), .Y(\DataA_0_c[3] ));
    OUTBUF QAGB_pad (.D(QAGB_c), .PAD(QAGB));
    OUTBUF QAEB_pad (.D(QAEB_c), .PAD(QAEB));
    INBUF \DataB_0_pad[1]  (.PAD(DataB_0[1]), .Y(\DataB_0_c[1] ));
    INBUF \DataB_pad[1]  (.PAD(DataB[1]), .Y(\DataB_c[1] ));
    
endmodule
