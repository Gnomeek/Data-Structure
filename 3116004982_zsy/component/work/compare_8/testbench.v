//////////////////////////////////////////////////////////////////////
// Created by Actel SmartDesign Sun Dec 28 05:03:52 2014
// Testbench Template
// This is a basic testbench that instantiates your design with basic 
// clock and reset pins connected.  If your design has special
// clock/reset or testbench driver requirements then you should 
// copy this file and modify it. 
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module testbench;

parameter SYSCLK_PERIOD = 100; // 10MHz

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end


//////////////////////////////////////////////////////////////////////
// 10MHz Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  compare_8
//////////////////////////////////////////////////////////////////////
compare_8 compare_8_0 (
    // Inputs
    .DataA({4{1'b0}}),
    .DataB({4{1'b0}}),
    .DataA_0({4{1'b0}}),
    .DataB_0({4{1'b0}}),

    // Outputs
    .QAEB( ),
    .QAGB( ),
    .QASB( )

    // Inouts

);

endmodule

