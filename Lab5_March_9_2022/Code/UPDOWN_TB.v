`timescale 1ns / 1ps

module UPDOWN_TB(

    );
    reg clk1_tb,rst_tb;
    reg en_tb;
    reg ud_tb;
    wire [3:0] cnt_tb;
    
    UPDOWN COMP (
    .clk1(clk1_tb),
    .rst1(rst_tb),
    .en(en_tb),
    .ud(ud_tb),
    .tmp(cnt_tb)       
    );
    
    initial 
        begin
        clk1_tb = 0;
        rst_tb = 0;
        ud_tb = 0;
        en_tb = 1;
        end
        
    always   
        begin
        #5 clk1_tb = ~clk1_tb;
        end
        
   always   
        begin
        #20 rst_tb = ~rst_tb;
        end
        endmodule