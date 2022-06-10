`timescale 1ns / 1ps


module top(
    //INPUTS FROM FPGA
    input [3:0] opa,
    input [3:0] opb,
    input signa,
    input signb,
    input [1:0] asm,
    //OUTPUT TO 7SEG DISPLAY
   // output [7:0] opc,
    //output signc1,
    //7SEG DISPLAY INPUTS
    input clkt, 
    output [6:0] Cnode1,
    output [7:0] AN1,
    output seg
    );
    //wire [7:0] opcbcd;
    wire [31:0] seg7Digit; 
    //Send input changes to 7seg display
    assign seg7Digit[3:0] = opb; 
    assign seg7Digit[7:4] = signb + 14; 
    assign seg7Digit[11:8] = opa; 
    assign seg7Digit[15:12] = signa + 14;  
    assign seg7Digit[27:24] = signc1 + 14;
    assign seg7Digit[31:28] = asm;
    
    wire [7:0] opc;
    
    ALU alu_wrapper(
     .opa(opa),
     .opb(opb),
     .signa(signa),
     .signb(signb),
     .asm(asm),
     .opc(opc),
     .signc1(signc1)
    );
    
    
    bin2bcd b2bwrap(
    .bin(opc),
    .bcd(seg7Digit[23:16])
   );

    SEGDRIVE seg7driver_wrapper(
        .nexysCLK(clkt), 
        .inDigit(seg7Digit),
         .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
    
    
    
    
endmodule
