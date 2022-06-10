
`timescale 1ns / 1ps


module UPDOWN(
    input clk1,
    input rst1,
    input load,
    input ud,
    input [3:0] a,
    output reg [3:0] tmp=0
    );
   
    always@(posedge clk1)
    begin
    if(load)
       begin 
       tmp=a;
       end
     else
     begin 
        if(rst1)
            begin
                if(ud)// 0 is up,  1 is down
                tmp<= 4'd9;
                else
                tmp<= 4'd0;    
             end                
        else
            begin
                if(ud)
                    if(tmp==4'd0)
                        tmp <= 4'd9;
                    else    
                        tmp <= tmp-1;
                else
                    if(tmp==4'd9)
                        tmp <= 4'd0;
                    else
                        tmp <= tmp+1;
             end  
        end  
    end
 
 
           
endmodule
