`timescale 1ns / 1ps

module SEGDRIVE_TB(

    );
    reg [3:0] tmp_SW_tb;
    reg [3:0] tmp_SW_tb1;
    wire [6:0] Cnode_tb;
    
    wire dp_tb;
    wire [7:0] AN_tb;
    
    
    SEGDRIVE COMP (
    .digit1(tmp_SW_tb),
    .digit2(tmp_SW_tb1),
    .Cnode(Cnode_tb),
    .dp(dp_tb),
    .AN(AN_tb)
           
    );
    
    initial 
        begin
        //dp_tb = 1;
        tmp_SW_tb=0;
        tmp_SW_tb1=0;
        #10
        tmp_SW_tb=4;
        #5
        tmp_SW_tb1=5;
        #1000
        $finish;
        end
        
   
   
    
    
    
    
endmodule
