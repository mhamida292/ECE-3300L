`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 04:08:09 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg [3:0] opatb;
    reg [3:0] opbtb;
    reg signatb;
    reg signbtb;
    reg [1:0] asmtb;
    
    wire [7:0] opctb;
    wire signctb;
    
    ALU alu_tb(
        .opa(opatb),
        .opb(opbtb),
        .signa(signatb),
        .signb(signbtb),
        .asm(asmtb),
        //output to 7seg
        .opc(opctb),
        .signc1(signctb)
    );
    initial
        begin: TEST
            asmtb = 3;      
            opatb = 4;
            opbtb = 2;
            signatb = 0;
            signbtb = 0; 
            
            #100

            asmtb = 2;      
            opatb = 4;
            opbtb = 4;
            signatb = 0;
            signbtb = 1; 

            #100    
            
            asmtb = 1;      
            opatb = 9;
            opbtb = 1;
            signatb = 0;
            signbtb = 0; 
            
            #100    
            asmtb = 3;      
            opatb = 1;
            opbtb = 9;
            signatb = 1;
            signbtb = 0; 
            #1000
            $finish;
        end
endmodule