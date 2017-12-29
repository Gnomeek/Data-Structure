`timescale 1 ns/100 ps
// Version: 9.0 9.0.0.15


module test_compare(
    );

    wire GND, VCC, GND_net_1, VCC_net_1;
    
    VCC VCC_i_0 (.Y(VCC_net_1));
    GND GND_i_0 (.Y(GND_net_1));
    VCC VCC_i (.Y(VCC));
    GND GND_i (.Y(GND));
    
endmodule
