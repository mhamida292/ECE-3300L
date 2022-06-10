`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2022 08:31:16 PM
// Design Name: 
// Module Name: FA
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


module FA(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    wire temp;
    xor(temp,a,b);
    xor(sum,temp,cin);
    
    MAJORITY UNIT
    (
    .x(a),
    .y(b),
    .z(cin),
    .p(cout)
    );
    
    
    
    
    
endmodule
