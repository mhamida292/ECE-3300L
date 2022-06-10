`timescale 1ns / 1ps

module FSM_TB(
    );
    reg [1:0] intb;
    reg buttb;
   // reg clktb;
    wire [1:0] outasmtb;
    wire outsratb;
    wire outsrbtb;
    
    FSM COMP
    (
   .in(intb),
   .but(buttb),
   //.clk(clktb),
   .outasm(outasmtb),
   .outsra(outsratb),
   .outsrb(outsrbtb)
    );
    initial 
        begin
       // clktb = 0;
        buttb = 1;
        intb = 2;
        
        #100
        buttb = 0;
        intb = 1;
        
        end 
   /* always   
        begin
        #5 clktb = ~clktb;
        end*/
    /*always   
        begin
        #20 buttb = ~buttb;
        end*/
    
    
    
endmodule
