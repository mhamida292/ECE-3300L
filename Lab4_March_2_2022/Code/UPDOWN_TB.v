`timescale 1ns / 1ps
module UPDOWN_TB(
    );
    reg clk_tb,rst_tb;
    //reg en_tb;
    reg ud_tb;
    wire [3:0] cnt_tb;
    wire [3:0] cnt_tb2;     
    UPDOWN COMP (
    .clk1(clk_tb),
    .rst1(rst_tb),
    //.en(en_tb),
    .ud(ud_tb),
    .tmp(cnt_tb),
    .tmp2(cnt_tb2)       
    );    
    initial 
        begin
        clk_tb = 0;
        rst_tb = 0;
        ud_tb = 1;
        //en_tb = 1;
        end        
    always   
        begin
        #5 clk_tb = ~clk_tb;
        end  
      /*  always   
        begin
        #20 rst_tb = ~rst_tb;
        end  */
      
   
endmodule
