`timescale 1ns / 1ps


module UPDOWN(
    input clk1,
    input rst1,
    input en,
    input ud,
    input load,
    input [3:0] udsw,
    input [2:0] numsel,
    output reg [31:0] tmp
    );
    
    always@(posedge clk1 or posedge rst1)
    begin
    if(en)

      begin
        if(rst1)
            begin
                if(ud)// 0 is up,  1 is down
                tmp<= 32'd99999999;
                else
                tmp<= 32'd0;
             end
    
        else
            begin
                if(ud)
                begin
                    if(tmp==32'd0)
                        tmp <= 32'd99999999;
                    else
                        tmp <= tmp-1;
                        end
          else if(load)
    begin 
        if(numsel==3'b000)
            begin
            tmp[31:4]=tmp[31:4]; 
            tmp[3:0]= udsw;
            end     
            else if(numsel==3'b001)
            begin
            tmp[31:8]=tmp[31:8];
            tmp[3:0]=tmp[3:0];
            tmp[7:4] = udsw;             
            end 
            else if(numsel==3'b010)
            begin
           tmp[31:12]=tmp[31:12];
           tmp[7:0]=tmp[7:0];
           tmp[15:12]= udsw;  
            end 
            else if(numsel==3'b011)
            begin
            tmp[31:16]=tmp[31:16];
            tmp[11:0]=tmp[11:0];
            tmp[15:12]= udsw;  
            end 
            else if(numsel==3'b100)
            begin
            tmp[31:20]=tmp[31:20];
            tmp[15:0]=tmp[15:0];
            tmp[19:16]= udsw;   
            end 
            else if(numsel==3'b101)
            begin
            tmp[31:24]=tmp[31:24];
            tmp[19:0]=tmp[19:0];
            tmp[23:20]= udsw;   
            end 
            else if(numsel==3'b110)
            begin
            tmp[31:28]=tmp[31:28];
            tmp[23:0]=tmp[23:0];
            tmp[27:24]= udsw;  
            end 
            else
            begin
            tmp[28:0]=tmp[28:0];
            tmp[31:28]=udsw; 
            end
    end
               
	
            else
                    begin                
                    if(tmp==32'd99999999)
                    tmp<=0;
                    else
                    tmp<=tmp+1;
                                        
                    
                    end
       
                    
             end 
           //tmp = tmp;
       end
       else
       tmp=tmp;
    end

endmodule

/*else
            begin
                if(ud)
                    if(tmp==32'd0)
                        tmp <= 32'd99999999;
                    else
                        tmp <= tmp-1;
                else
                    if(tmp==32'd99999999)
                        tmp <= 32'd0;
                    if (tmp[3:0] > 4'd9)
                    begin 
                    tmp[3:0] = 0;	
                    tmp[7:4]+=1;
                    end	
	
                    else
                        tmp <= tmp+1;
             end */