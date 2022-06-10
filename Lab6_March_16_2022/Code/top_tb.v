`timescale 1ns / 1ps


module top_tb(

    );
    reg clktq;
    reg rsttq;
    
    reg [4:0] SW1q;
    reg udtq;
    reg l;
    reg [3:0] u;
    reg [2:0] n;
    wire segq;
    wire [6:0] Cnode1q;
    wire [7:0] AN1q;
    
   top COMP(
    .clkt(clktq),
    .rstt(rsttq),
    .load1(l),
    .udsw1(u),
    .numsel1(n),
    
    .SW(SW1q),
    .udt(udtq),
    .seg(segq),
    .Cnode1(Cnode1q),
    .AN1(AN1q )
    
   
   );
   
    initial 
        begin
        clktq = 1;
        udtq =0;
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
            SW1q = 0;
           #100 
        l=1;
        n=0;
        u=0;
        #1000
        
           $finish;
        end 
   
    
endmodule