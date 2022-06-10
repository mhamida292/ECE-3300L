`timescale 1ns / 1ps
module top_tb();
    reg [3:0] opatb;
    reg [3:0] opbtb;
    reg signatb;
    reg signbtb;
    reg [1:0] asmtb;
    
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;

    
    top top_t(
        .opa(opatb),
        .opb(opbtb),
        .signa(signatb),
        .signb(signbtb),
        .asm(asmtb),
        //output to 7seg
         .Cnode1(Cnode_tb),
         .seg(dp_tb),
         .AN1(AN_tb)

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

