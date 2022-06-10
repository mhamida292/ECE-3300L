`timescale 1ns / 1ps


module upcounter(
    input clk1,
    input rst1,
    input en,
    input ud,
    output reg [3:0] tmp=0,
    output reg [3:0] tmp2=0
    );

    always@(posedge clk1 or posedge rst1)
    begin

        if(rst1)
            begin
                if(ud)// 1 is up 0 is still
                begin
                tmp<= 4'd0;
                tmp2<=4'd0;
                end
                else
                begin
                tmp<= 4'd0;
                tmp2<=4'd0;
                end
             end
        else
            begin
                if(ud)
                    begin
                        if(tmp2==4'd9 && tmp==4'd9)
                           begin
                            tmp <= 4'd0;
                            tmp2 <= 4'd0;
                           end
                         else if(tmp==4'd9)
                            begin
                            tmp <= 4'd0;
                            tmp2 <= tmp2+1; 
                            end
                        else
                            tmp <= tmp+1;
                       end
                 else
                    begin
                        tmp<=tmp;
                        tmp2<=tmp2;
                    end
             end
           //tmp = tmp;

       end 


    endmodule