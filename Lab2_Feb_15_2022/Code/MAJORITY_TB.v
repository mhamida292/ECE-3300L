`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 08:07:03 PM
// Design Name: 
// Module Name: MAJORITY_TB
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


module MAJORITY_TB(

    );
    reg x_tb,y_tb,z_tb;
    wire p_tb;
    
    MAJORITY COMP
    (
    .x(x_tb),
    .y(y_tb),
    .z(z_tb),
    .p(p_tb)
    );
    
     initial
            begin:  TST1 
               x_tb = 1'b0;
               y_tb = 1'b0;
               z_tb = 1'b0; 
             #10 
               x_tb = 1'b0;
               y_tb = 1'b1;
               z_tb = 1'b1;
             #10
               x_tb = 1'b1;
               y_tb = 1'b0;
               z_tb = 1'b0;
             #10
               x_tb = 1'b1;
               y_tb = 1'b0;
               z_tb = 1'b1; 
            #10
               x_tb = 1'b1;
               y_tb = 1'b1;
               z_tb = 1'b1; 
            #1000
            $finish; 
            end

endmodule

    
    
    
