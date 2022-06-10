`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 10:38:21 PM
// Design Name: 
// Module Name: FAnbit
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


module FAnbit
        #(parameter DT = 4)
(
    input cinbit,
    input [DT-1:0] abit,
    input [DT-1:0] bbit,
    output [DT-1:0] sumbit,
    output coutbit
    );
    wire [DT-1:0] bridge;
    
       FA UNIT0 (
                 .cin(cinbit),
                 .a(abit[0]),
                 .b(bbit[0]),
                 .sum(sumbit[0]),
                 .cout(bridge[0])
                    );
       
    genvar i;
    generate
    for(i=1;i<DT;i=i+1)
        begin
        
        FA UNIT(
                 .cin(bridge[i-1]),
                 .a(abit[i]),
                 .b(bbit[i]),
                 .sum(sumbit[i]),
                 .cout(bridge[i])
        );  
     end
    endgenerate
      
    assign coutbit=bridge[DT-1];
endmodule
