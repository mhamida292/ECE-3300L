    `timescale 1ns / 1ps
    module UPDOWN_TB(
        );
        reg clk_tb,rst_tb;
        reg l_tb;
        reg ud_tb;
        reg [3:0] atb;
        wire [3:0] cnt_tb;    
        UPDOWN COMP (
        .clk1(clk_tb),
        .rst1(rst_tb),
        .load(l_tb),
        .ud(ud_tb),
        .a(atb),
        .tmp(cnt_tb)       
        );    
        initial 
            begin
            clk_tb = 0;
            rst_tb = 0;
            ud_tb = 0;
            l_tb= 1;
            atb= 3;
            end        
        always   
            begin
            #5 clk_tb = ~clk_tb;
            end        
       always   
            begin
            #20 l_tb = ~l_tb;
            end   
    endmodule
