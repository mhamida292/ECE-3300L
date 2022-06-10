`timescale 1ns / 1ps
module BSUPDOWN_TB(
    );
    reg clk_tb;
    wire [1:0] s0_tb; 
    wire [1:0] s1_tb;   
    BSUPDOWN COMP (
    .clk1(clk_tb),
    .s0(s0_tb),
    .s1(sl_tb)
    );    
    initial 
        begin
        clk_tb = 0;
        end        
    always   
        begin
        #5 clk_tb = ~clk_tb;
        end        
  
endmodule