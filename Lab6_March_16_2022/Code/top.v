`timescale 1ns / 1ps

module top(
    input clkt,
    input rstt,
    input ent,
    input udt, 
    input [4:0] SW,
input load1,
    input [3:0] udsw1,
    input [2:0] numsel1,
    output seg,
    output [6:0] Cnode1,
    output [7:0] AN1
    );
    wire slowclk_out;
    wire [31:0] inDigit; 
    CLKMANAGER clockmanager_wrapper(
        .clk(clkt),
        .SW(SW),
        .clkout(slowclk_out)
    );
    
    
    wire [31:0] tmp_cnt; 
    UPDOWN udcounter_wrapper(
        .rst1(rstt),
        .en(ent),
        .clk1(slowclk_out),       
       .load(load1),
        .udsw(udsw1),
        .numsel(numsel1), 
        .tmp(tmp_cnt),
        .ud(udt)
    );
    
   bin2bcd bin2bcd_wrapper(
        .bin(tmp_cnt), 
          
        .bcd(inDigit)
    );
    
    
    SEGDRIVE seg7driver_wrapper(
        .nexysCLK(clkt), 
        .inDigit(inDigit),
         .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
endmodule