`timescale 1ns / 1ps

module top(
    input clkt,
    input rstt,
    input ent,
    input [4:0] SW1,
    input udt,
    output seg,
    output [6:0] Cnode1,
    output [7:0] AN1
    );
    wire [3:0] digit1;
    wire [3:0] digit2; 
    wire slowclk_out;
    
    
    clkmanager clkmanager_wrapper(
        .clk(clkt),
        .SW(SW1),
        .clkout(slowclk_out)
    );
    
    upcounter upcounter_wrapper(
        .rst1(rstt),
        .en(ent),
        .clk1(slowclk_out), 
        .tmp(digit1),
        .tmp2(digit2),
        .ud(udt)
    );
    
    seg7driver seg7driver_wrapper(
        .nexysCLK(clkt), 
        .digit1(digit1),
        .digit2(digit2),
        .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
       


endmodule
