`timescale 1ns / 1ps
module alu_tb();
    reg [3:0] opatb;
    reg [3:0] opbtb;
    reg [1:0] asmtb;
    
    wire [7:0] opctb;
 
    ALU alu_tb(
        .opa(opatb),
        .opb(opbtb),
        .asm(asmtb),
        //output to 7seg
        .opc(opctb)
    );
    initial
        begin: TEST
            asmtb = 3;      
            opatb = 4;
            opbtb = 2;
            
            
            #100

            asmtb = 2;      
            opatb = 4;
            opbtb = 4;
           

            #100    
            
            asmtb = 1;      
            opatb = 9;
            opbtb = 1;
            
            #100    
            asmtb = 3;      
            opatb = 1;
            opbtb = 9;
            #1000
            $finish;
        end
endmodule

