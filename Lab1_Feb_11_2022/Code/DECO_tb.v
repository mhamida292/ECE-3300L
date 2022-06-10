`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2022 03:21:59 PM
// Design Name: 
// Module Name: DECO_tb
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


module DECO_tb(

    );
    reg [1:0]in_tb;
   reg en_tb;
    
    wire [3:0]out_tb;
      
   DECO COMP_1   (
    .in(in_tb), 
    .en(en_tb),                       // Enable Input
    .out(out_tb)                    // Output 1
    );
    
    initial
            begin:  TST1 
               in_tb[0] = 1'b0;
               in_tb[1] = 1'd0;
               en_tb = 0; 
             #10 
               in_tb[0] = 1'b0;
               in_tb[1] = 1'd0;
               en_tb = 1;
               #10
                in_tb[0] = 1'd1;
                in_tb[1] = 1'd0;
                en_tb = 1; 
             #10
                in_tb[0] = 1'd0;
                in_tb[1] = 1'd1;
                en_tb = 1; 
            #10
                in_tb[0] = 1'd1;
                in_tb[1] = 1'd1;
                en_tb = 1; 
            #1000
            $finish; 
            end

endmodule
