`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 10:54:57 PM
// Design Name: 
// Module Name: FAnbit_tb
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


module FAnbit_tb
#(parameter DT_TB=4)
(

    );
  
  reg [DT_TB-1:0] abit_tb, bbit_tb;
  reg cinbit_tb;
  
  
  wire [DT_TB-1:0] sumbit_tb;
  wire coutbit_tb;
  
  FAnbit
  #(
    .DT(DT_TB)
  )  
  
    FA_TB_NBITS
    (
                 .cinbit(cinbit_tb),
                 .abit(abit_tb),
                 .bbit(bbit_tb),
                 .sumbit(sumbit_tb),
                 .coutbit(coutbit_tb)
    );
    
    initial
            begin:  TST1 
               abit_tb = 4;
               bbit_tb = 7;
               cinbit_tb = 0; 
               
               
            #1000
            $finish; 
            end

    
    
    
    
endmodule
