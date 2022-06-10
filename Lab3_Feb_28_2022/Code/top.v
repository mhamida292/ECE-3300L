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



    wire slowclk_out; 
     CLKMANAGER FIN(
     .clk(clkt),
     //.rst(rstt), 
     .SW(SW1),
     .clkout(slowclk_out)
    );
    
   
   wire [3:0] tmp_cnt; 
     UPDOWN FIND(
     .rst1(rstt),
     .en(ent),
     .clk1(slowclk_out), 
     .tmp(tmp_cnt),
     .ud(udt)
    );
    
 SEGDRIVE FINE(
   .tmp_SW(tmp_cnt),
   .Cnode(Cnode1),
   .dp(seg),
   .AN(AN1)
   );
       


endmodule