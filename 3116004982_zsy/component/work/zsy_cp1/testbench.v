//////////////////////////////////////////////////////////////////////
// Created by Actel SmartDesign Wed Dec 28 03:28:45 2016
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
// Instantiate Unit Under Test:  zsy_cp1
//////////////////////////////////////////////////////////////////////
zsy_cp1 zsy_cp1_0 (
    // Inputs
    .CP({1{1'b0}}),
    .A({4{1'b0}}),
    .MR({1{1'b0}}),
    .B({4{1'b0}}),

    // Outputs
    .dig1( ),
    .Y( ),
    .dig2( ),
    .dig3( ),
    .dig4( ),
    .dp( )

    // Inouts

);

endmodule

