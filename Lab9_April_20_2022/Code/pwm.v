`timescale 1ns / 1ps



module PWM(
    input [3:0] inputSW,
    input clk, rst, en,
    output result
    );
  
    
    wire[3:0] tmpCount; 
    UPCOUNT upcounter(
    .clk(clk), 
    .rst(rst), 
    .en(en),
    .count(tmpCount)
    );
    
    comparator comparator(
    .a(inputSW), 
    .b(count),
    .result(result)
    );
endmodule
