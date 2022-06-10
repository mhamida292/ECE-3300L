`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 08:04:26 PM
// Design Name: 
// Module Name: MAJORITY
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


module MAJORITY(
    input x,
    input y,
    input z,
    output p
    );
    
  assign p = (y&z)|(x&z)|(x&y);
  
endmodule
