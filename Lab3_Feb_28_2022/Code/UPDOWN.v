`timescale 1ns / 1ps


module UPDOWN(
    input clk1,
    input rst1,
    input en,
    input ud,
    output reg [3:0] tmp
    );
    // reg[3:0]tmp;
     
    
  
    /*initial 
        begin
        tmp = 0;
        end*/
    always@(posedge clk1 or posedge rst1)
    begin
    if(en)
       
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
           //tmp = tmp;
       end
       else
       tmp=0;  
          
    end
 
 
           
endmodule
