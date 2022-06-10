`timescale 1ns / 1ps

module SEGDRIVE_TB(

    );
    reg [31:0] tmp_SW_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;
    
    
    SEGDRIVE COMP (
    .inDigit(tmp_SW_tb),
    .Cnode(Cnode_tb),
    .dp(dp_tb),
    .AN(AN_tb)
           
    );
    
    initial 
        begin
        //dp_tb = 1;
        tmp_SW_tb=0;
        #10
        tmp_SW_tb=4;
        #1000
        $finish;
        end
        
   
   
    
    
    
    
endmodule


