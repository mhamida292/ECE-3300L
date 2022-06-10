`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2022 04:31:47 PM
// Design Name: 
// Module Name: GenvarDECO_tb
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


module GenvarDECO_tb
   #(parameter s=8)
    (

    );
    
    reg [2:0] i_tb;
    reg e_tb;
    
    wire[7:0] p_tb;
    
    
  GenvarDECO
  #(
        .n(s) 
   )
   GenvarDECO_TB
(
    .i(i_tb),
    .e(e_tb),
    .p(p_tb)
     
);   
    initial
        begin:TSTB
        e_tb=1;
        i_tb=1;
        #10
        i_tb=2; 
        #10
        i_tb=5;
        #10
        i_tb=6;       
        #100
        $finish;
        end
    
      
endmodule

