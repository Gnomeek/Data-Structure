`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


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

    wire HC85_0_QAEB, HC85_0_QAGB, HC85_0_QASB, GND_net, VCC_net;
    
    VCC VCC (.Y(VCC_net));
    HC85 HC85_2 (.DataA({DataA_0[3], DataA_0[2], DataA_0[1], 
        DataA_0[0]}), .DataB({DataB_0[3], DataB_0[2], DataB_0[1], 
        DataB_0[0]}), .QAGB(QAGB), .QASB(QASB), .QAEB(QAEB), .IAGB(
        HC85_0_QAGB), .IASB(HC85_0_QASB), .IAEB(HC85_0_QAEB));
    HC85 HC85_1 (.DataA({DataA[3], DataA[2], DataA[1], DataA[0]}), 
        .DataB({DataB[3], DataB[2], DataB[1], DataB[0]}), .QAGB(
        HC85_0_QAGB), .QASB(HC85_0_QASB), .QAEB(HC85_0_QAEB), .IAGB(
        GND_net), .IASB(GND_net), .IAEB(VCC_net));
    GND GND (.Y(GND_net));
    
endmodule
