`timescale 1ns / 1ps


module top_tb(

    );
    reg clktq;
    reg rsttq;
    
    reg [4:0] SW1q;
    reg udtq;
    wire segq;
    wire [6:0] Cnode1q;
    wire [7:0] AN1q;
    
   top COMP(
    .clkt(clktq),
    .rstt(rsttq),
    
    .SW1(SW1q),
    .udt(udtq),
    .seg(segq),
    .Cnode1(Cnode1q),
    .AN1(AN1q )
    
   
   );
   
    initial 
        begin
        clktq = 1;
        udtq =1;
        end
        
    always   
        begin
        #5 clktq = ~clktq;
        //#20 SW_tb = SW_tb+1;
        end
    initial 
        begin 
            rsttq = 1;
            
           #10 
            rsttq = 0;
           #100  
            SW1q = 4;
           #100 
           $finish;
        end 
   
    
endmodule