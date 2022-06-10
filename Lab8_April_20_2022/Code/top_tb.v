`timescale 1ns / 1ps
module top_tb();
    reg [3:0] opatb;
    reg [3:0] opbtb;
    reg audtb;
    reg budtb;
    reg altb;
    reg bltb;
    reg [1:0] asmtb;
    reg but1;
    reg clk_tb;
    
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;

    
    top top_t(
        .clkt(clk_tb),
        .asw(opatb),
        .bsw(opbtb),
        .aud(audtb),
        .bud(budtb),
        .aload(altb),
        .bload(bltb),
        .in(asmtb),
        .button(but1),
        //output to 7seg
         .Cnode1(Cnode_tb),
         .seg(dp_tb),
         .AN1(AN_tb)

    );
    initial
        begin: TEST
            asmtb = 2;      
            opatb = 4;
            opbtb = 2;
            audtb = 1;
            budtb = 1;
            but1 = 1;
            clk_tb=0;
            #100

            asmtb = 1;      
            opatb = 3;
            opbtb = 6;
            audtb = 0;
            budtb = 1;
            but1 = 0;
            altb=1;
            bltb=0; 

            #100    
            
            asmtb = 2;      
            opatb = 5;
            opbtb = 2;
            audtb = 1;
            budtb = 0;
            but1 = 1; 
            
            #100    
            asmtb = 3;      
            opatb = 8;
            opbtb = 9;
            audtb = 1;
            budtb = 1;
            but1 = 0; 
            #1000
            $finish;
        end
        
        always   
        begin
        #5 clk_tb = ~clk_tb;
        end        
  
endmodule

