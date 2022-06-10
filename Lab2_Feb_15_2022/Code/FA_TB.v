`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 08:35:52 PM
// Design Name: 
// Module Name: FA_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_TB(

    );
    reg a_tb,b_tb,cin_tb;
    wire sum_tb,cout_tb;
    
    FA COMP
    (
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .cout(cout_tb) 
    );
     initial
            begin:  TST1 
               a_tb = 1'b1;
               b_tb = 1'b0;
               cin_tb = 1'b0; 
             #10 
               a_tb = 1'b0;
               b_tb = 1'b1;
               cin_tb = 1'b1;
             #10
               a_tb = 1'b1;
               b_tb = 1'b0;
               cin_tb = 1'b0;
             #10
               a_tb = 1'b1;
               b_tb = 1'b0;
               cin_tb = 1'b1; 
            #10
               a_tb = 1'b1;
               b_tb = 1'b1;
               cin_tb = 1'b1; 
            #1000
            $finish; 
            end

    
    
    
    
    
    
    
    
    
endmodule
