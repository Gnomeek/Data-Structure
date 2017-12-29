`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15
// File used only for Simulation


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

    wire HC85_0_QAGB, HC85_0_QASB, \DataA_c[0] , \DataA_c[1] , 
        \DataA_c[2] , \DataA_c[3] , \DataB_c[0] , \DataB_c[1] , 
        \DataB_c[2] , \DataB_c[3] , \DataA_0_c[0] , \DataA_0_c[1] , 
        \DataA_0_c[2] , \DataA_0_c[3] , \DataB_0_c[0] , \DataB_0_c[1] , 
        \DataB_0_c[2] , \DataB_0_c[3] , QAEB_c, QAGB_c, QASB_c, 
        \HC85_1.un1_DataA_NE_0 , \HC85_1.un1_DataA_NE_1 , 
        \HC85_2/un1_DataA_NE_0_net_1 , \HC85_2/un1_DataA_1_i , 
        \HC85_2/QAGB_0_a3_0_net_1 , \HC85_2/QASB_0_a3_0_net_1 , 
        \HC85_2/un1_DataA_NE_net_1 , \HC85_2/un1_DataA_3_i , 
        \HC85_2/un1_DataA_2_i , \HC85_2/QAGB17 , \HC85_2/QAGB16 , 
        \HC85_2/ACT_LT4_E[3] , \HC85_2/ACT_LT4_E[6] , 
        \HC85_2/ACT_LT4_E[10] , \HC85_2/ACT_LT4_E[7] , 
        \HC85_2/ACT_LT4_E[8] , \HC85_2/ACT_LT4_E[5] , 
        \HC85_2/ACT_LT4_E[0] , \HC85_2/ACT_LT4_E[1] , 
        \HC85_2/ACT_LT4_E[2] , \HC85_2/ACT_LT4_E_0[3] , 
        \HC85_2/ACT_LT4_E_0[6] , \HC85_2/ACT_LT4_E_0[10] , 
        \HC85_2/ACT_LT4_E_0[7] , \HC85_2/ACT_LT4_E_0[8] , 
        \HC85_2/ACT_LT4_E_0[5] , \HC85_2/ACT_LT4_E_0[0] , 
        \HC85_2/ACT_LT4_E_0[1] , \HC85_2/ACT_LT4_E_0[2] , 
        \HC85_1/un1_DataA_3 , \HC85_1/un1_DataA_1 , 
        \HC85_1/ACT_LT4_E[3] , \HC85_1/ACT_LT4_E[6] , 
        \HC85_1/ACT_LT4_E[10] , \HC85_1/ACT_LT4_E[7] , 
        \HC85_1/ACT_LT4_E[8] , \HC85_1/ACT_LT4_E[5] , 
        \HC85_1/ACT_LT4_E[0] , \HC85_1/ACT_LT4_E[1] , 
        \HC85_1/ACT_LT4_E[2] , \HC85_1/ACT_LT4_E_0[3] , 
        \HC85_1/ACT_LT4_E_0[6] , \HC85_1/ACT_LT4_E_0[10] , 
        \HC85_1/ACT_LT4_E_0[7] , \HC85_1/ACT_LT4_E_0[8] , 
        \HC85_1/ACT_LT4_E_0[5] , \HC85_1/ACT_LT4_E_0[0] , 
        \HC85_1/ACT_LT4_E_0[1] , \HC85_1/ACT_LT4_E_0[2] , 
        \DataB_pad[1]/U0/NET1 , \DataB_0_pad[2]/U0/NET1 , 
        \DataB_pad[2]/U0/NET1 , \DataA_0_pad[2]/U0/NET1 , 
        \DataB_0_pad[1]/U0/NET1 , \QAGB_pad/U0/NET1 , 
        \QAGB_pad/U0/NET2 , \DataA_0_pad[1]/U0/NET1 , 
        \QASB_pad/U0/NET1 , \QASB_pad/U0/NET2 , \DataB_pad[0]/U0/NET1 , 
        \DataA_pad[0]/U0/NET1 , \DataA_pad[3]/U0/NET1 , 
        \DataB_pad[3]/U0/NET1 , \DataA_pad[1]/U0/NET1 , 
        \DataB_0_pad[3]/U0/NET1 , \DataA_0_pad[3]/U0/NET1 , 
        \DataA_0_pad[0]/U0/NET1 , \QAEB_pad/U0/NET1 , 
        \QAEB_pad/U0/NET2 , VCC, \DataA_pad[2]/U0/NET1 , 
        \DataB_0_pad[0]/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_TRI \QAGB_pad/U0/U0  (.D(\QAGB_pad/U0/NET1 ), .E(
        \QAGB_pad/U0/NET2 ), .PAD(QAGB));
    XO1 \HC85_1/un1_DataA_NE_1  (.A(\DataA_c[2] ), .B(\DataB_c[2] ), 
        .C(\HC85_1/un1_DataA_3 ), .Y(\HC85_1.un1_DataA_NE_1 ));
    AOI1A \HC85_1/QAGB17_0_I_7  (.A(\DataA_c[2] ), .B(\DataB_c[2] ), 
        .C(\HC85_1/ACT_LT4_E[5] ), .Y(\HC85_1/ACT_LT4_E[6] ));
    NOR2A \HC85_1/QAGB16_0_I_1  (.A(\DataA_c[0] ), .B(\DataB_c[0] ), 
        .Y(\HC85_1/ACT_LT4_E_0[0] ));
    AOI1A \HC85_1/QAGB16_0_I_4  (.A(\HC85_1/ACT_LT4_E_0[0] ), .B(
        \HC85_1/ACT_LT4_E_0[1] ), .C(\HC85_1/ACT_LT4_E_0[2] ), .Y(
        \HC85_1/ACT_LT4_E_0[3] ));
    AOI1A \HC85_1/QAGB16_0_I_7  (.A(\DataB_c[2] ), .B(\DataA_c[2] ), 
        .C(\HC85_1/ACT_LT4_E_0[5] ), .Y(\HC85_1/ACT_LT4_E_0[6] ));
    IOPAD_IN \DataA_pad[2]/U0/U0  (.PAD(DataA[2]), .Y(
        \DataA_pad[2]/U0/NET1 ));
    AOI1A \HC85_2/QAGB16_0_I_11  (.A(\HC85_2/ACT_LT4_E_0[3] ), .B(
        \HC85_2/ACT_LT4_E_0[6] ), .C(\HC85_2/ACT_LT4_E_0[10] ), .Y(
        \HC85_2/QAGB16 ));
    AOI1A \HC85_2/QAGB16_0_I_10  (.A(\HC85_2/ACT_LT4_E_0[7] ), .B(
        \HC85_2/ACT_LT4_E_0[8] ), .C(\HC85_2/ACT_LT4_E_0[5] ), .Y(
        \HC85_2/ACT_LT4_E_0[10] ));
    AO1D \HC85_2/QAGB_0_a3_0  (.A(\HC85_1.un1_DataA_NE_1 ), .B(
        \HC85_1.un1_DataA_NE_0 ), .C(HC85_0_QASB), .Y(
        \HC85_2/QAGB_0_a3_0_net_1 ));
    OR2A \HC85_2/QAGB17_0_I_9  (.A(\DataA_0_c[3] ), .B(\DataB_0_c[3] ), 
        .Y(\HC85_2/ACT_LT4_E[8] ));
    IOIN_IB \DataB_0_pad[2]/U0/U1  (.YIN(\DataB_0_pad[2]/U0/NET1 ), .Y(
        \DataB_0_c[2] ));
    NOR2A \HC85_1/QAGB16_0_I_8  (.A(\DataB_c[2] ), .B(\DataA_c[2] ), 
        .Y(\HC85_1/ACT_LT4_E_0[7] ));
    IOPAD_IN \DataA_pad[0]/U0/U0  (.PAD(DataA[0]), .Y(
        \DataA_pad[0]/U0/NET1 ));
    IOPAD_IN \DataB_0_pad[0]/U0/U0  (.PAD(DataB_0[0]), .Y(
        \DataB_0_pad[0]/U0/NET1 ));
    XA1A \HC85_2/un1_DataA_NE_0  (.A(\DataA_0_c[0] ), .B(
        \DataB_0_c[0] ), .C(\HC85_2/un1_DataA_1_i ), .Y(
        \HC85_2/un1_DataA_NE_0_net_1 ));
    AOI1A \HC85_2/QAGB17_0_I_4  (.A(\HC85_2/ACT_LT4_E[0] ), .B(
        \HC85_2/ACT_LT4_E[1] ), .C(\HC85_2/ACT_LT4_E[2] ), .Y(
        \HC85_2/ACT_LT4_E[3] ));
    AOI1A \HC85_1/QAGB17_0_I_11  (.A(\HC85_1/ACT_LT4_E[3] ), .B(
        \HC85_1/ACT_LT4_E[6] ), .C(\HC85_1/ACT_LT4_E[10] ), .Y(
        HC85_0_QASB));
    IOIN_IB \DataA_pad[2]/U0/U1  (.YIN(\DataA_pad[2]/U0/NET1 ), .Y(
        \DataA_c[2] ));
    IOIN_IB \DataA_0_pad[0]/U0/U1  (.YIN(\DataA_0_pad[0]/U0/NET1 ), .Y(
        \DataA_0_c[0] ));
    NOR2A \HC85_2/QAGB17_0_I_1  (.A(\DataB_0_c[0] ), .B(\DataA_0_c[0] )
        , .Y(\HC85_2/ACT_LT4_E[0] ));
    NOR2A \HC85_1/QAGB17_0_I_6  (.A(\DataB_c[3] ), .B(\DataA_c[3] ), 
        .Y(\HC85_1/ACT_LT4_E[5] ));
    IOIN_IB \DataA_0_pad[1]/U0/U1  (.YIN(\DataA_0_pad[1]/U0/NET1 ), .Y(
        \DataA_0_c[1] ));
    IOIN_IB \DataA_pad[0]/U0/U1  (.YIN(\DataA_pad[0]/U0/NET1 ), .Y(
        \DataA_c[0] ));
    OR2A \HC85_2/QAGB16_0_I_2  (.A(\DataA_0_c[1] ), .B(\DataB_0_c[1] ), 
        .Y(\HC85_2/ACT_LT4_E_0[1] ));
    XOR2 \HC85_1/un1_DataA_1_0  (.A(\DataB_c[1] ), .B(\DataA_c[1] ), 
        .Y(\HC85_1/un1_DataA_1 ));
    IOPAD_IN \DataB_0_pad[1]/U0/U0  (.PAD(DataB_0[1]), .Y(
        \DataB_0_pad[1]/U0/NET1 ));
    AND2A \HC85_1/QAGB17_0_I_3  (.A(\DataB_c[1] ), .B(\DataA_c[1] ), 
        .Y(\HC85_1/ACT_LT4_E[2] ));
    NOR2A \HC85_2/QAGB16_0_I_6  (.A(\DataA_0_c[3] ), .B(\DataB_0_c[3] )
        , .Y(\HC85_2/ACT_LT4_E_0[5] ));
    OR2A \HC85_2/QAGB17_0_I_2  (.A(\DataB_0_c[1] ), .B(\DataA_0_c[1] ), 
        .Y(\HC85_2/ACT_LT4_E[1] ));
    IOPAD_IN \DataB_pad[2]/U0/U0  (.PAD(DataB[2]), .Y(
        \DataB_pad[2]/U0/NET1 ));
    OR2A \HC85_1/QAGB16_0_I_9  (.A(\DataB_c[3] ), .B(\DataA_c[3] ), .Y(
        \HC85_1/ACT_LT4_E_0[8] ));
    NOR2A \HC85_1/QAGB17_0_I_8  (.A(\DataA_c[2] ), .B(\DataB_c[2] ), 
        .Y(\HC85_1/ACT_LT4_E[7] ));
    AND2A \HC85_1/QAGB16_0_I_3  (.A(\DataA_c[1] ), .B(\DataB_c[1] ), 
        .Y(\HC85_1/ACT_LT4_E_0[2] ));
    IOIN_IB \DataB_pad[2]/U0/U1  (.YIN(\DataB_pad[2]/U0/NET1 ), .Y(
        \DataB_c[2] ));
    IOIN_IB \DataA_0_pad[2]/U0/U1  (.YIN(\DataA_0_pad[2]/U0/NET1 ), .Y(
        \DataA_0_c[2] ));
    XNOR2 \HC85_2/un1_DataA_3_0  (.A(\DataB_0_c[3] ), .B(
        \DataA_0_c[3] ), .Y(\HC85_2/un1_DataA_3_i ));
    IOPAD_IN \DataA_pad[1]/U0/U0  (.PAD(DataA[1]), .Y(
        \DataA_pad[1]/U0/NET1 ));
    XNOR2 \HC85_2/un1_DataA_2_0  (.A(\DataB_0_c[2] ), .B(
        \DataA_0_c[2] ), .Y(\HC85_2/un1_DataA_2_i ));
    AOI1A \HC85_1/QAGB16_0_I_11  (.A(\HC85_1/ACT_LT4_E_0[3] ), .B(
        \HC85_1/ACT_LT4_E_0[6] ), .C(\HC85_1/ACT_LT4_E_0[10] ), .Y(
        HC85_0_QAGB));
    IOTRI_OB_EB \QASB_pad/U0/U1  (.D(QASB_c), .E(VCC), .DOUT(
        \QASB_pad/U0/NET1 ), .EOUT(\QASB_pad/U0/NET2 ));
    IOTRI_OB_EB \QAEB_pad/U0/U1  (.D(QAEB_c), .E(VCC), .DOUT(
        \QAEB_pad/U0/NET1 ), .EOUT(\QAEB_pad/U0/NET2 ));
    IOIN_IB \DataB_0_pad[3]/U0/U1  (.YIN(\DataB_0_pad[3]/U0/NET1 ), .Y(
        \DataB_0_c[3] ));
    AOI1A \HC85_2/QAGB17_0_I_7  (.A(\DataA_0_c[2] ), .B(\DataB_0_c[2] )
        , .C(\HC85_2/ACT_LT4_E[5] ), .Y(\HC85_2/ACT_LT4_E[6] ));
    NOR2A \HC85_2/QAGB16_0_I_1  (.A(\DataA_0_c[0] ), .B(\DataB_0_c[0] )
        , .Y(\HC85_2/ACT_LT4_E_0[0] ));
    IOPAD_IN \DataB_0_pad[2]/U0/U0  (.PAD(DataB_0[2]), .Y(
        \DataB_0_pad[2]/U0/NET1 ));
    AOI1A \HC85_2/QAGB16_0_I_4  (.A(\HC85_2/ACT_LT4_E_0[0] ), .B(
        \HC85_2/ACT_LT4_E_0[1] ), .C(\HC85_2/ACT_LT4_E_0[2] ), .Y(
        \HC85_2/ACT_LT4_E_0[3] ));
    AOI1A \HC85_1/QAGB17_0_I_10  (.A(\HC85_1/ACT_LT4_E[7] ), .B(
        \HC85_1/ACT_LT4_E[8] ), .C(\HC85_1/ACT_LT4_E[5] ), .Y(
        \HC85_1/ACT_LT4_E[10] ));
    IOIN_IB \DataA_pad[1]/U0/U1  (.YIN(\DataA_pad[1]/U0/NET1 ), .Y(
        \DataA_c[1] ));
    AOI1A \HC85_2/QAGB16_0_I_7  (.A(\DataB_0_c[2] ), .B(\DataA_0_c[2] )
        , .C(\HC85_2/ACT_LT4_E_0[5] ), .Y(\HC85_2/ACT_LT4_E_0[6] ));
    XO1 \HC85_1/un1_DataA_NE_0  (.A(\DataA_c[0] ), .B(\DataB_c[0] ), 
        .C(\HC85_1/un1_DataA_1 ), .Y(\HC85_1.un1_DataA_NE_0 ));
    IOIN_IB \DataA_0_pad[3]/U0/U1  (.YIN(\DataA_0_pad[3]/U0/NET1 ), .Y(
        \DataA_0_c[3] ));
    IOPAD_IN \DataA_pad[3]/U0/U0  (.PAD(DataA[3]), .Y(
        \DataA_pad[3]/U0/NET1 ));
    AO1D \HC85_2/un1_DataA_NE_RNISII73_0  (.A(
        \HC85_2/QAGB_0_a3_0_net_1 ), .B(\HC85_2/un1_DataA_NE_net_1 ), 
        .C(\HC85_2/QAGB16 ), .Y(QAGB_c));
    IOPAD_IN \DataA_0_pad[0]/U0/U0  (.PAD(DataA_0[0]), .Y(
        \DataA_0_pad[0]/U0/NET1 ));
    IOPAD_IN \DataA_0_pad[1]/U0/U0  (.PAD(DataA_0[1]), .Y(
        \DataA_0_pad[1]/U0/NET1 ));
    IOPAD_IN \DataB_pad[3]/U0/U0  (.PAD(DataB[3]), .Y(
        \DataB_pad[3]/U0/NET1 ));
    NOR2A \HC85_2/QAGB16_0_I_8  (.A(\DataB_0_c[2] ), .B(\DataA_0_c[2] )
        , .Y(\HC85_2/ACT_LT4_E_0[7] ));
    IOTRI_OB_EB \QAGB_pad/U0/U1  (.D(QAGB_c), .E(VCC), .DOUT(
        \QAGB_pad/U0/NET1 ), .EOUT(\QAGB_pad/U0/NET2 ));
    XOR2 \HC85_1/un1_DataA_3_0  (.A(\DataB_c[3] ), .B(\DataA_c[3] ), 
        .Y(\HC85_1/un1_DataA_3 ));
    IOIN_IB \DataA_pad[3]/U0/U1  (.YIN(\DataA_pad[3]/U0/NET1 ), .Y(
        \DataA_c[3] ));
    AO1D \HC85_2/QASB_0_a3_0  (.A(\HC85_1.un1_DataA_NE_1 ), .B(
        \HC85_1.un1_DataA_NE_0 ), .C(HC85_0_QAGB), .Y(
        \HC85_2/QASB_0_a3_0_net_1 ));
    NOR2A \HC85_2/QAGB17_0_I_6  (.A(\DataB_0_c[3] ), .B(\DataA_0_c[3] )
        , .Y(\HC85_2/ACT_LT4_E[5] ));
    IOIN_IB \DataB_pad[3]/U0/U1  (.YIN(\DataB_pad[3]/U0/NET1 ), .Y(
        \DataB_c[3] ));
    IOPAD_IN \DataB_pad[1]/U0/U0  (.PAD(DataB[1]), .Y(
        \DataB_pad[1]/U0/NET1 ));
    OR2A \HC85_1/QAGB17_0_I_9  (.A(\DataA_c[3] ), .B(\DataB_c[3] ), .Y(
        \HC85_1/ACT_LT4_E[8] ));
    AND2A \HC85_2/QAGB17_0_I_3  (.A(\DataB_0_c[1] ), .B(\DataA_0_c[1] )
        , .Y(\HC85_2/ACT_LT4_E[2] ));
    AOI1A \HC85_1/QAGB17_0_I_4  (.A(\HC85_1/ACT_LT4_E[0] ), .B(
        \HC85_1/ACT_LT4_E[1] ), .C(\HC85_1/ACT_LT4_E[2] ), .Y(
        \HC85_1/ACT_LT4_E[3] ));
    IOPAD_IN \DataB_pad[0]/U0/U0  (.PAD(DataB[0]), .Y(
        \DataB_pad[0]/U0/NET1 ));
    IOPAD_IN \DataA_0_pad[2]/U0/U0  (.PAD(DataA_0[2]), .Y(
        \DataA_0_pad[2]/U0/NET1 ));
    NOR3 \HC85_2/un1_DataA_NE_RNIGI39  (.A(\HC85_1.un1_DataA_NE_0 ), 
        .B(\HC85_1.un1_DataA_NE_1 ), .C(\HC85_2/un1_DataA_NE_net_1 ), 
        .Y(QAEB_c));
    IOIN_IB \DataB_pad[1]/U0/U1  (.YIN(\DataB_pad[1]/U0/NET1 ), .Y(
        \DataB_c[1] ));
    AOI1A \HC85_1/QAGB16_0_I_10  (.A(\HC85_1/ACT_LT4_E_0[7] ), .B(
        \HC85_1/ACT_LT4_E_0[8] ), .C(\HC85_1/ACT_LT4_E_0[5] ), .Y(
        \HC85_1/ACT_LT4_E_0[10] ));
    OR2A \HC85_2/QAGB16_0_I_9  (.A(\DataB_0_c[3] ), .B(\DataA_0_c[3] ), 
        .Y(\HC85_2/ACT_LT4_E_0[8] ));
    NOR2A \HC85_1/QAGB17_0_I_1  (.A(\DataB_c[0] ), .B(\DataA_c[0] ), 
        .Y(\HC85_1/ACT_LT4_E[0] ));
    IOPAD_TRI \QASB_pad/U0/U0  (.D(\QASB_pad/U0/NET1 ), .E(
        \QASB_pad/U0/NET2 ), .PAD(QASB));
    AO1D \HC85_2/un1_DataA_NE_RNISII73  (.A(\HC85_2/QASB_0_a3_0_net_1 )
        , .B(\HC85_2/un1_DataA_NE_net_1 ), .C(\HC85_2/QAGB17 ), .Y(
        QASB_c));
    NOR2A \HC85_2/QAGB17_0_I_8  (.A(\DataA_0_c[2] ), .B(\DataB_0_c[2] )
        , .Y(\HC85_2/ACT_LT4_E[7] ));
    IOPAD_TRI \QAEB_pad/U0/U0  (.D(\QAEB_pad/U0/NET1 ), .E(
        \QAEB_pad/U0/NET2 ), .PAD(QAEB));
    AND2A \HC85_2/QAGB16_0_I_3  (.A(\DataA_0_c[1] ), .B(\DataB_0_c[1] )
        , .Y(\HC85_2/ACT_LT4_E_0[2] ));
    OR2A \HC85_1/QAGB16_0_I_2  (.A(\DataA_c[1] ), .B(\DataB_c[1] ), .Y(
        \HC85_1/ACT_LT4_E_0[1] ));
    IOPAD_IN \DataB_0_pad[3]/U0/U0  (.PAD(DataB_0[3]), .Y(
        \DataB_0_pad[3]/U0/NET1 ));
    IOIN_IB \DataB_0_pad[0]/U0/U1  (.YIN(\DataB_0_pad[0]/U0/NET1 ), .Y(
        \DataB_0_c[0] ));
    IOIN_IB \DataB_pad[0]/U0/U1  (.YIN(\DataB_pad[0]/U0/NET1 ), .Y(
        \DataB_c[0] ));
    NOR2A \HC85_1/QAGB16_0_I_6  (.A(\DataA_c[3] ), .B(\DataB_c[3] ), 
        .Y(\HC85_1/ACT_LT4_E_0[5] ));
    OR2A \HC85_1/QAGB17_0_I_2  (.A(\DataB_c[1] ), .B(\DataA_c[1] ), .Y(
        \HC85_1/ACT_LT4_E[1] ));
    AOI1A \HC85_2/QAGB17_0_I_11  (.A(\HC85_2/ACT_LT4_E[3] ), .B(
        \HC85_2/ACT_LT4_E[6] ), .C(\HC85_2/ACT_LT4_E[10] ), .Y(
        \HC85_2/QAGB17 ));
    AOI1A \HC85_2/QAGB17_0_I_10  (.A(\HC85_2/ACT_LT4_E[7] ), .B(
        \HC85_2/ACT_LT4_E[8] ), .C(\HC85_2/ACT_LT4_E[5] ), .Y(
        \HC85_2/ACT_LT4_E[10] ));
    OR3C \HC85_2/un1_DataA_NE  (.A(\HC85_2/un1_DataA_3_i ), .B(
        \HC85_2/un1_DataA_2_i ), .C(\HC85_2/un1_DataA_NE_0_net_1 ), .Y(
        \HC85_2/un1_DataA_NE_net_1 ));
    IOPAD_IN \DataA_0_pad[3]/U0/U0  (.PAD(DataA_0[3]), .Y(
        \DataA_0_pad[3]/U0/NET1 ));
    XNOR2 \HC85_2/un1_DataA_1_0  (.A(\DataB_0_c[1] ), .B(
        \DataA_0_c[1] ), .Y(\HC85_2/un1_DataA_1_i ));
    IOIN_IB \DataB_0_pad[1]/U0/U1  (.YIN(\DataB_0_pad[1]/U0/NET1 ), .Y(
        \DataB_0_c[1] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
