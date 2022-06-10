`timescale 1ns / 1ps

module top(
    input clkt,
    input rstt,
    input ent,
    input udt, 
    input [4:0] SW,
    output seg,
    output [6:0] Cnode1,
    output [7:0] AN1
    );
    wire slowclk_out;
    wire [31:0] inDigit; 
    clockmanager clockmanager_wrapper(
        .clk(clkt),
        .SW(SW),
        .clkout(slowclk_out)
    );
    
    
    wire [26:0] tmp_cnt; 
    udcounter udcounter_wrapper(
        .rst1(rstt),
        .en(ent),
        .clk1(slowclk_out), 
        .tmp(tmp_cnt),
        .ud(udt)
    );
    
    bin2bcd bin2bcd_wrapper(
        .bin(tmp_cnt),
        .bcd(inDigit)
    );
    
    
    segdisplaydriver seg7driver_wrapper(
        .nexysCLK(clkt), 
        .inDigit(inDigit),
        .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
endmodule