`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2022 02:43:05 PM
// Design Name: 
// Module Name: DECO
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
module DECO(
    input [1:0]in,
    input en,                       // Enable Input
 
    output [3:0]out
    );
 
 wire in0_neg, in1_neg;
 //wire en1;
 
 not(in0_neg, in[0]);
 not(in1_neg, in[1]);
 
 
 and(out[0],in1_neg,in0_neg,en);
 and(out[1],in1_neg,in[0],en);  
 and(out[2],in[1],in0_neg,en);  
 and(out[3],in[1],in[0],en); 
   
   
endmodule