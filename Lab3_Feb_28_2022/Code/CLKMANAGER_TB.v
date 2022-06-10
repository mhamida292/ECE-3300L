`timescale 1ns / 1ps


module CLKMANAGER_TB (

    );
    
    reg clk_tb,rst_tb;
    reg [4:0] SW_tb;
    wire clkout_tb;

    
    CLKMANAGER COMP(
    .clk(clk_tb),
    .rst(rst_tb),
    .SW(SW_tb),
    .clkout(clkout_tb)       
    );
    
    initial 
        begin
        clk_tb = 1;
        end
        
    always   
        begin
        #5 clk_tb = ~clk_tb;
        //#20 SW_tb = SW_tb+1;
        end
    initial 
        begin 
            rst_tb = 1;
            SW_tb <= 0;
           #10 
            rst_tb = 0;
           #100  
            SW_tb = 4;
           #100 
           $finish;
        end 
    
endmodule


